import 'package:flutter/material.dart';
import 'package:velox/config/routes.dart';
import 'package:velox/utils/router.dart';
import 'package:velox/screens/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // application root
  @override
  Widget build(BuildContext context) {
    // instantiate the router and pass int the routes map
    final router = AppRouter(routes);

    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Velox',
      home: const SplashScreen(),
      // Use the onGenerateRoute callback to delegate the routing to the router
      onGenerateRoute: router.generateRoute,
    );
  }
}
