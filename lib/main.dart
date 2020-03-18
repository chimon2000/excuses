import 'package:excuses/ui/pages/pages.dart';
import 'package:flutter/material.dart';

void main() => runApp(ExcusesApp());

class ExcusesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Excuses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
