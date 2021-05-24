import 'dart:math';

import 'package:excuses/logic/logic.dart';
import 'package:excuses/commands/get_excuses.command.dart';
import 'package:excuses/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class HomePage extends StatefulWidget with GetItStatefulWidgetMixin {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

  static Page<dynamic> route() => MaterialPage(
        child: HomePage(),
      );
}

class _HomePageState extends State<HomePage> with GetItStateMixin {
  @override
  void initState() {
    super.initState();
    GetExcusesCommand().run();
  }

  @override
  Widget build(BuildContext context) {
    final homeLogic = watchX((HomeLogic x) => x);
    final queryParameters = RouteData.of(context).queryParameters;

    registerHandler(
      (HomeLogic x) => x,
      (context, HomeState excuseState, _) {
        if (currentExcuse != null && !queryParameters.containsKey('id')) {
          excuseState.maybeWhen(
            success: (excuses) => Routemaster.of(context)
                .push('', queryParameters: {'id': currentExcuse.toString()}),
            orElse: () => {},
          );
        }
      },
    );

    return homeLogic.maybeWhen(
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
    final excuseState = get<HomeLogic>().value;
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
