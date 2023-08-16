import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/material/Icons-class.html

class FloatingButton extends StatelessWidget {
  final IconData iconData;
  final Function() onPressed;
  final String tooltipText;
  final Color iconColor;
  final Color backgroundColor;

  const FloatingButton({
    super.key,
    required this.tooltipText,
    required this.iconData,
    required this.iconColor,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltipText,
      backgroundColor: backgroundColor,
      child: Icon(
        iconData,
        color: iconColor,
      ),
    );
  }
}