import 'package:flutter/material.dart';
import 'package:tea_app/constants.dart';

class FancyTextField extends StatelessWidget {
  final String text;
  final TextInputType textInputType;
  final bool hideText;
  final Function onChanged;

  FancyTextField(
      {this.text, this.textInputType, this.hideText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: textInputType,
      cursorColor: kAccentColor,
      textAlign: TextAlign.center,
      obscureText: hideText,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text,
          hintStyle: TextStyle(
            color: Colors.grey[400],
          )),
    );
  }
}
