import 'package:excuses/blocs/blocs.dart';
import 'package:excuses/repositories/excuse.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:excuses/ui/routes.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  register();
  runApp(const ExcusesApp());
}

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

void register() {
  GetIt.I.registerSingleton<ExcuseRepository>(ExcuseRepository());
  GetIt.I.registerSingleton<HomeCubit>(HomeCubit());
}
