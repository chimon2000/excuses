import 'dart:math';

import 'package:excuses/models/models.dart';
import 'package:excuses/ui/widgets/widgets.dart';
import 'package:excuses/viewmodels/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = 0;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      var homeViewmodel = Provider.of<HomeViewmodel>(context, listen: false);
      homeViewmodel.getExcuses();
    });
  }

  @override
  Widget build(BuildContext context) {
    var excuseState = Provider.of<RemoteState<List<Excuse>>>(context);

    return excuseState.maybeWhen(
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
      empty: () => Center(child: Text('No results!!!')),
      failure: (_) => Center(child: Text('Something went horribly wrong!!!')),
      orElse: () => Material(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
