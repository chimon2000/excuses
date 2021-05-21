import 'package:excuses/ui/pages/pages.dart';
import 'package:routemaster/routemaster.dart';

final routes = RouteMap(
  routes: {
    '/': (_) => const Redirect('/excuses'),
    '/excuses': (_) => HomePage.route(),
  },
);
