import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tea_app/animation/animation_elements.dart';
import 'package:tea_app/constants.dart';
import 'package:tea_app/components/fancy_textfield.dart';
import 'package:tea_app/components/blur_shadow_container.dart';
import 'package:tea_app/components/gradient_button.dart';
import 'package:tea_app/screens/menu_screen.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: kAccentColor,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: AnimationElements(
                  screenSize: screenSize,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Create account',
                      style: TextStyle(
                        color: kDarkAccentColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BlurShadowContainer(
                      color: kDarkAccentColor,
                      child: Column(
                        children: <Widget>[
                          FancyTextField(
                            onChanged: (value) {
                              email = value;
                            },
                            text: 'Email or phone number',
                            textInputType: TextInputType.emailAddress,
                            hideText: false,
                          ),
                          FancyTextField(
                            onChanged: (value) {
                              password = value;
                            },
                            text: 'Password',
                            hideText: false,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuScreen()));
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: GradientButton(
                        backgroundColor: kDarkAccentColor,
                        textColor: Colors.white,
                        text: 'Register',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
