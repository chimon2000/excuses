import 'dart:math';

import 'package:excuses/blocs/blocs.dart';
import 'package:excuses/commands/get_excuses.command.dart';
import 'package:excuses/models/models.dart';
import 'package:excuses/services/excuse.dart';
import 'package:excuses/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:remote_state/remote_state.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class HomePage extends StatefulWidget with GetItStatefulWidgetMixin {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with GetItStateMixin {
  List<Excuse>? excuses;
  ExcuseService excuseService = ExcuseService();
  var currentPage = 0;

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
            padding: EdgeInsets.all(16.0),
            child: ExcusePageView(
              excuses: excuses,
              currentPage: currentPage,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward),
          onPressed: () {
            setState(() {
              currentPage = Random().nextInt(excuses.length);
            });
          },
        ),
      ),
      error: (_, __) => Center(child: Text('Something went horribly wrong!!!')),
      orElse: () => Material(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
