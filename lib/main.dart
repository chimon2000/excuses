import 'package:excuses/ui/routes.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

void main() => runApp(const ExcusesApp());

class ExcusesApp extends StatelessWidget {
  const ExcusesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: RoutemasterDelegate(routesBuilder: (context) => routes),
      routeInformationParser: const RoutemasterParser(),
      title: 'Excuses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
