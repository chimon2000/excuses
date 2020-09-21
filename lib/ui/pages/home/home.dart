import 'dart:math';

import 'package:excuses/blocs/blocs.dart';
import 'package:excuses/commands/get_excuses.command.dart';
import 'package:excuses/models/models.dart';
import 'package:excuses/services/excuse.dart';
import 'package:excuses/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_state/remote_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Excuse> excuses;
  ExcuseService excuseService = ExcuseService();
  var currentPage = 0;

  @override
  void initState() {
    GetExcusesCommand(context).run();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, RemoteState<List<Excuse>>>(
      builder: (context, excuseState) => excuseState.maybeWhen(
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
        error: (_, __) =>
            Center(child: Text('Something went horribly wrong!!!')),
        orElse: () => Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
