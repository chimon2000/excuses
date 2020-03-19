import 'package:excuses/models/models.dart';
import 'package:excuses/ui/pages/pages.dart';
import 'package:excuses/viewmodels/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ExcusesApp());

class ExcusesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: HomeViewmodel()),
        Consumer<HomeViewmodel>(
          builder: (context, vm, child) {
            return StreamProvider<RemoteState<List<Excuse>>>.value(
              value: vm.excusesStream$,
              child: child,
              initialData: RemoteState.initial(),
              catchError: (context, error) {
                return RemoteState.failure();
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
    );
  }
}
