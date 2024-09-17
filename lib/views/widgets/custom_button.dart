import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double fontSize;
  final EdgeInsets padding;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 16.0,
    this.padding = const EdgeInsets.all(5.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontSize: fontSize),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
