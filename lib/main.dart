import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

void main() => runApp(ExcusesApp());

class ExcusesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Excuses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Excuse> excuses;
  var currentPage = 0;

  _getExcuses() async {
    var fetchedExcuses = await fetchExcuses();

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
          child: ExcusesPageView(
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
    );
  }
}

class ExcusesPageView extends StatelessWidget {
  final List<Excuse> excuses;
  final int currentPage;

  const ExcusesPageView({Key key, this.excuses, this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var excuseCards =
        excuses.map((excuse) => ExcuseCard.fromExcuse(excuse)).toList();

    return PageTransitionSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (child, animation, secondAnimation) {
        return SharedAxisTransition(
          child: child,
          animation: animation,
          secondaryAnimation: secondAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
        );
      },
      child: excuseCards[currentPage],
    );
  }
}

class ExcuseCard extends StatelessWidget {
  final Excuse excuse;

  const ExcuseCard._({Key key, this.excuse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Center(
      child: Text(
        excuse.text,
        style: textTheme.display3,
      ),
    );
  }

  ExcuseCard.fromExcuse(Excuse excuse)
      : this._(key: ValueKey(excuse.id), excuse: excuse);
}

class Excuse {
  final String text;
  final int id;

  Excuse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'];
}

Future<List<Excuse>> fetchExcuses() async {
  try {
    Response response = await Dio().get(
        'https://s3.ap-south-1.amazonaws.com/idontlikework/wfh-reasons.json');

    List<dynamic> json = jsonDecode(response.data);
    var excuses = json.map((json) => Excuse.fromJson(json)).toList();

    return excuses;
  } catch (e) {
    print(e);
  }

  return [];
}
