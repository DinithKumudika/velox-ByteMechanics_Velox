import 'package:flutter/material.dart';
import 'package:velox/constants/colors.dart';
import 'package:velox/features/authentication/screens/login/widgets/login_form.dart';
import 'package:velox/features/authentication/screens/login/widgets/login_header.dart';
import 'package:velox/features/authentication/screens/login/widgets/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: COLOR_DARK,
      body: SingleChildScrollView(
        child: Container(
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
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginHeader(),
              const LoginForm(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "or".toUpperCase(),
                      style: const TextStyle(
                        color: COLOR_LIGHT,
                      ),
                    ),
                  ),
                  const GoogleSignIn(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an Account?",
                        style: TextStyle(color: COLOR_GRAY, fontSize: 15.0),
                      ),
                      TextButton(
                        onPressed: ()=> Navigator.pushNamed(context, '/signup'),
                        child: const Text(
                          "Signup",
                          style: TextStyle(color: COLOR_LIGHT, fontSize: 15.0),
                        ),
                      ),
                    ],
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
