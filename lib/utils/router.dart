import 'package:flutter/material.dart';
import 'package:velox/screens/unknown_screen.dart';

class AppRouter {

  final Map<String, WidgetBuilder> routes;

  AppRouter(this.routes);

  Route<dynamic> generateRoute(RouteSettings settings) {
    final name = settings.name;
    final route = routes[name];

    if (route != null) {
      return MaterialPageRoute(
        builder: (context) => route(context),
      );
    }

    return MaterialPageRoute(builder: (context) => const UnknownScreen());
  }
}