import 'dart:math';

import 'package:excuses/logic/home.logic.dart';
import 'package:excuses/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

  static Page<dynamic> route() => const MaterialPage(
        child: HomePage(),
      );
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      var homeLogic = Provider.of<HomeLogic>(context, listen: false);
      homeLogic.getExcuses();
    });
  }

  @override
  Widget build(BuildContext context) {
    var excuseState = Provider.of<HomeState>(context);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final queryParameters = RouteData.of(context).queryParameters;

      if (currentExcuse != null && !queryParameters.containsKey('id')) {
        excuseState.maybeWhen(
          success: (excuses) => Routemaster.of(context)
              .push('', queryParameters: {'id': currentExcuse.toString()}),
          orElse: () => {},
        );
      }
    });

    return excuseState.maybeWhen(
      success: (excuses) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ExcusePageView(
              excuses: excuses,
              currentExcuse: currentExcuse,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_forward),
          onPressed: () {
            setState(() {
              final currentPage = randomIndex(excuses.length);

              Routemaster.of(context).push('',
                  queryParameters: {'id': excuses[currentPage].id.toString()});
            });
          },
        ),
      ),
      error: (_, __) =>
          const Center(child: Text('Something went horribly wrong!!!')),
      orElse: () => const Material(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  int? get currentExcuse {
    final excuseState = context.read<HomeState>();
    final defaultExcuse = excuseState.maybeWhen(
      success: (excuses) => excuses[randomIndex(excuses.length)],
      orElse: () => null,
    );

    final queryParameters = RouteData.of(context).queryParameters;
    final id = queryParameters.containsKey('id')
        ? int.tryParse(queryParameters['id']!)
        : defaultExcuse?.id;

    return id;
  }

  int randomIndex(int length) => Random().nextInt(length);
}
