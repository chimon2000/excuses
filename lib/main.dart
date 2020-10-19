import 'package:excuses/blocs/blocs.dart';
import 'package:excuses/repositories/excuse.dart';
import 'package:excuses/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  register();
  runApp(ExcusesApp());
}

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

void register() {
  GetIt.I.registerSingleton<ExcuseRepository>(ExcuseRepository());
  GetIt.I.registerSingleton<HomeCubit>(HomeCubit());
}
