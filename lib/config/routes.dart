import 'package:flutter/material.dart';
import 'package:velox/screens/login_screen.dart';
import 'package:velox/screens/signup_screen.dart';
import 'package:velox/screens/welcome_screen.dart';

// Define your routes as a Map<String, WidgetBuilder> where the keys are the route names
// and the values are functions that return the widget for that route.

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const WelcomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignupScreen(),
};