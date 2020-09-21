import 'package:excuses/blocs/blocs.dart';
import 'package:excuses/repositories/excuse.dart';
import 'package:excuses/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() => runApp(ExcusesApp());

class ExcusesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit()),
        Provider(create: (context) => ExcuseRepository()),
        Provider(create: (c) => c)
      ],
      child: MaterialApp(
        title: 'Excuses',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: HomePage(),
        ),
      ),
    );
  }
}
