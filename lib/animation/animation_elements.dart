import 'package:flutter/material.dart';
import '../animation/fade_animation.dart';
import '../constants.dart';

class AnimationElements extends StatelessWidget {
  final Size screenSize;

  AnimationElements({this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -screenSize.height * 0.03,
          left: screenSize.width * 0.7,
          height: screenSize.height * 0.3,
          width: screenSize.width * 0.4,
          child: FadeAnimation(
            1.6,
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/leaf-2.png'),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -60,
          left: 220,
          height: 200,
          width: 100,
          child: FadeAnimation(
            1.8,
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/flower-2.png'),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -10,
          height: 150,
          width: 80,
          child: FadeAnimation(
            1.2,
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/flow-2.png'),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 15,
          top: -10,
          height: 220,
          width: 150,
          child: FadeAnimation(
            1.4,
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/flow-3.png'),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 110,
          left: 110,
          child: FadeAnimation(
            1.2,
            Container(
              child: Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
//                            color: Colors.white,
                    color: kLightGrey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
