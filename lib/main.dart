import 'package:flutter/material.dart';
import 'package:velox/config/firebase_service.dart';
import 'package:velox/config/routes.dart';
import 'package:velox/utils/router.dart';
import 'package:velox/screens/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // application root
  @override
  Widget build(BuildContext context) {
    // instantiate the router and pass int the routes map
    final router = AppRouter(routes);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Velox',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const SplashScreen(),
      // Use the onGenerateRoute callback to delegate the routing to the router
      onGenerateRoute: router.generateRoute,
    );
  }
}
