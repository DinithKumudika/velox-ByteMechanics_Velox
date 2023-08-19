import 'package:flutter/material.dart';
import 'package:velox/constants/colors.dart';
import 'package:velox/constants/images.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: const AssetImage(logoImg),
          width: size.width * 0.3,
          height: size.height * 0.2,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
          child: Text(
            "LOGIN".toUpperCase(),
            style: const TextStyle(
                color: COLOR_LIGHT, fontSize: 35.0, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
