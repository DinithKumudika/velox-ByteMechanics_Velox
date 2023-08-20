import 'package:flutter/material.dart';
import 'package:velox/constants/colors.dart';
import 'package:velox/constants/images.dart';

class FinishedBookings extends StatelessWidget {
  const FinishedBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [COLOR_DARK, COLOR_PRIMARY],
            stops: [0, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          image: DecorationImage(
            image: AssetImage(logoImg),
          ),
        ),
        child: Column(),
      ),
    );
  }
}
