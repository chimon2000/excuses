import 'package:excuses_provider/ui/pages/pages.dart';
import 'package:routemaster/routemaster.dart';

final routes = RouteMap(
  routes: {
    '/': (_) => const Redirect('/excuses/1'),
    '/excuses': (_) => const Redirect('/excuses/1'),
    '/excuses/:id': (_) => HomePage.route(),
  },
);
