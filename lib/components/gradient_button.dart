import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  GradientButton({this.text, this.backgroundColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(colors: [
          backgroundColor.withOpacity(1),
          backgroundColor.withOpacity(0.6),
        ]),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
