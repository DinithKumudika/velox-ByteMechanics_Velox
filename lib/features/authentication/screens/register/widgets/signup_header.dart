import 'package:flutter/material.dart';
import 'package:velox/constants/colors.dart';
import 'package:velox/constants/images.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage(logoImg),
          width: size.width * 0.8,
          height: size.height * 0.3,
        ),
        Text(
          "sign up".toUpperCase(),
          style: const TextStyle(
              color: COLOR_LIGHT, fontSize: 35.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}