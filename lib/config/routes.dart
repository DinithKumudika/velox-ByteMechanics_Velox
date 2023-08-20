import 'package:flutter/material.dart';
import 'package:velox/features/authentication/screens/login/login_screen.dart';
import 'package:velox/features/authentication/screens/otp_verification_screen.dart';
import 'package:velox/features/authentication/screens/register/signup_screen.dart';
import 'package:velox/screens/home_screen.dart';
import 'package:velox/features/authentication/screens/welcome_screen.dart';

// Define your routes as a Map<String, WidgetBuilder> where the keys are the route names
// and the values are functions that return the widget for that route.

final Map<String, WidgetBuilder> routes = {
  '/welcome': (context) => const WelcomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignupScreen(),
  '/otp': (context) => const OTPVerificationScreen(),
  '/home': (context) => const HomeScreen(),
};