import 'package:excuses/ui/routes.dart';
import 'package:excuses/logic/home.logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:routemaster/routemaster.dart';

void main() => runApp(const ExcusesApp());

class ExcusesApp extends StatelessWidget {
  const ExcusesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<HomeLogic, HomeState>.value(value: HomeLogic()),
      ],
      child: MaterialApp.router(
        routerDelegate: RoutemasterDelegate(routesBuilder: (context) => routes),
        routeInformationParser: const RoutemasterParser(),
        title: 'Excuses',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
