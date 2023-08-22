import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(image),
          width: size.width * 0.8,
          height: size.height * 0.3,
        ),
        Text(
          title,
          style: TextStyle(),
        ),
        Text(
          subTitle,
          style: TextStyle(),
        ),
      ],
    );
  }
}
