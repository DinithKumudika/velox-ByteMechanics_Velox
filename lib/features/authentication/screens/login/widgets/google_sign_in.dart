import 'package:flutter/material.dart';
import 'package:velox/constants/colors.dart';
import 'package:velox/constants/images.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: COLOR_GRAY),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 2.0,
            style: BorderStyle.solid,
            color: COLOR_LIGHT.withOpacity(0.5),
          ),
        ),
        icon: Image.asset(
          googleLogo,
          width: 30.0,
          height: 30.0,
        ),
      ),
    );
  }
}
