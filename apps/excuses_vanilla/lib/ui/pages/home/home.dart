import 'dart:math';
import 'package:excuses_data/excuses_data.dart';
import 'package:excuses_design/excuses_design.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

  static Page<dynamic> route() => const MaterialPage(
        child: HomePage(),
      );
}

class _HomePageState extends State<HomePage> {
  List<Excuse>? excuses;
  ExcuseFacade excuseService = ExcuseFacade();

  _getExcuses() async {
    var fetchedExcuses = await excuseService.fetchExcuses();

    if (currentExcuse == null) {
      Routemaster.of(context).push('', queryParameters: {
        'id': fetchedExcuses[randomIndex(fetchedExcuses.length)].id.toString()
      });
    }

    setState(() {
      excuses = fetchedExcuses;
    });
  }

  @override
  void initState() {
    super.initState();

    _getExcuses();
  }

  @override
  Widget build(BuildContext context) {
    if (excuses == null) {
      return const Material(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ExcusePageView(
            excuses: excuses
                ?.map((e) => ExcuseViewData(
                      id: e.id,
                      text: e.text,
                    ))
                .toList(),
            currentExcuse: currentExcuse,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          setState(() {
            final currentPage = randomIndex(excuses!.length);

            Routemaster.of(context).push('',
                queryParameters: {'id': excuses![currentPage].id.toString()});
          });
        },
      ),
    );
  }

  int? get currentExcuse {
    final queryParameters = RouteData.of(context).queryParameters;
    final id = queryParameters.containsKey('id')
        ? int.tryParse(queryParameters['id']!)
        : excuses?[0].id;

    return id;
  }

  int randomIndex(int length) => Random().nextInt(length);
}
