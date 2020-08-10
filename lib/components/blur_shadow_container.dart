import 'package:flutter/material.dart';
import 'package:tea_app/constants.dart';

class BlurShadowContainer extends StatelessWidget {
  final Widget child;
  final Color color;

  BlurShadowContainer({this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 20.0,
            offset: Offset(0, 10),
          )
        ],
        color: Colors.white,
      ),
      child: child,
    );
  }
}
