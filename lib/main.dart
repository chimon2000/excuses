import 'package:excuses/cubits/home.dart';
import 'package:excuses/models/models.dart';
import 'package:excuses/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:remote_state/remote_state.dart';

void main() => runApp(ExcusesApp());

class ExcusesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeCubit(),
        ),
        Provider.value(value: HomeViewmodel()),
        Consumer<HomeViewmodel>(
          builder: (context, vm, child) {
            return StreamProvider<RemoteState<List<Excuse>>>.value(
              value: vm.excusesStream$,
              child: child,
              initialData: RemoteState.initial(),
              catchError: (context, error) {
                return RemoteState.error();
              },
            );
          },
        )
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
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
