import 'package:flutter/material.dart';
import 'package:velox/features/authentication/screens/login/login_screen.dart';
import 'package:velox/features/authentication/screens/register/signup_screen.dart';
import 'package:velox/features/booking/screens/bookings_screen.dart';
import 'package:velox/screens/home_screen.dart';
import 'package:velox/features/authentication/screens/welcome_screen.dart';
import 'package:velox/features/booking/screens/booking_screen.dart';

// Define your routes as a Map<String, WidgetBuilder> where the keys are the route names
// and the values are functions that return the widget for that route.

final Map<String, WidgetBuilder> routes = {
  '/welcome': (context) => const WelcomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignupScreen(),
  '/bookingDetails': (context) => BookingScreen(),
  '/home': (context) => const HomeScreen(),
  '/bookings': (context) => const BookingsScreen(),
};