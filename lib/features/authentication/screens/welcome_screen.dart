import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velox/constants/colors.dart';
import 'package:velox/constants/images.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20.0),
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [COLOR_DARK, COLOR_PRIMARY],
              stops: [0, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage(logoImg),
                width: size.width * 0.8,
                height: size.height * 0.4,
              ),
              Text(
                "Welcome To Velox".toUpperCase(),
                style: const TextStyle(
                    color: COLOR_LIGHT,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Your Interplanetary Travel Partner",
                style: TextStyle(
                  color: COLOR_LIGHT,
                  fontSize: 20.0,
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 80.0,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        COLOR_LIGHT.withOpacity(0.25),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all(
                        const Size(300.0, 55.0),
                      ),
                    ),
                    child: Text(
                      "Sign In".toUpperCase(),
                      style: const TextStyle(
                        color: COLOR_LIGHT,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  OutlinedButton(
                    onPressed: () => Navigator.pushNamed(context, '/signup'),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(
                          width: 2.0,
                          style: BorderStyle.solid,
                          color: COLOR_LIGHT.withOpacity(0.25),
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all(
                        const Size(300.0, 55.0),
                      ),
                    ),
                    child: Text(
                      "Sign Up".toUpperCase(),
                      style: const TextStyle(
                        color: COLOR_LIGHT,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
