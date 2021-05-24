import 'dart:math';

import 'package:excuses/blocs/blocs.dart';
import 'package:excuses/commands/get_excuses.command.dart';
import 'package:excuses/models/models.dart';
import 'package:excuses/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:remote_state/remote_state.dart';
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
  List<Excuse>? excuses;

  @override
  void initState() {
    GetExcusesCommand().run();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeCubit = watchStream(
        (HomeCubit x) => x.stream, RemoteState<List<Excuse>>.loading());

    registerStreamHandler(
        (HomeCubit x) => x.stream,
        (context, AsyncSnapshot<RemoteState<List<Excuse>>> snap, _) =>
            print(snap.data!.isSuccess),
        initialValue: RemoteState<List<Excuse>>.loading());

    if (!homeCubit.hasData) return Container();

    return homeCubit.data!.maybeWhen(
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
              final currentPage = randomIndex(excuses!.length);

              Routemaster.of(context).push('',
                  queryParameters: {'id': excuses![currentPage].id.toString()});
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
    final queryParameters = RouteData.of(context).queryParameters;
    final id = queryParameters.containsKey('id')
        ? int.tryParse(queryParameters['id']!)
        : excuses?[0].id;

    return id;
  }

  int randomIndex(int length) => Random().nextInt(length);
}
