import 'package:excuses/models/models.dart';
import 'package:excuses/ui/routes.dart';
import 'package:excuses/viewmodels/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_state/remote_state.dart';
import 'package:routemaster/routemaster.dart';

void main() => runApp(const ExcusesApp());

class ExcusesApp extends StatelessWidget {
  const ExcusesApp({Key? key}) : super(key: key);

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
                return RemoteState.error();
              },
            );
          },
        )
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
