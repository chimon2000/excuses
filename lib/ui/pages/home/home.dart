import 'dart:math';

import 'package:excuses/services/excuse.dart';
import 'package:excuses/models/models.dart';
import 'package:excuses/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Excuse>? excuses;
  ExcuseService excuseService = ExcuseService();
  var currentPage = 0;

  _getExcuses() async {
    var fetchedExcuses = await excuseService.fetchExcuses();

    setState(() {
      this.excuses = fetchedExcuses;
    });
  }

  @override
  void initState() {
    super.initState();

    _getExcuses();
  }

  @override
  Widget build(BuildContext context) {
    if (excuses == null)
      return Material(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );

    return Scaffold(
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
            currentPage = Random().nextInt(excuses!.length);
          });
        },
      ),
    );
  }
}
