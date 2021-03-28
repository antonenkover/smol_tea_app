import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tea_app/animation/animation_elements.dart';
import 'package:tea_app/constants.dart';
import 'package:tea_app/screens/menu_screen.dart';
import 'package:tea_app/screens/registration.dart';
import '../animation/fade_animation.dart';
import 'forgot_password.dart';
import '../components/gradient_button.dart';
import '../components/fancy_textfield.dart';
import '../components/blur_shadow_container.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  String password;
  String email;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_tea.png'),
                      fit: BoxFit.cover),
                ),
                child: AnimationElements(
                  screenSize: screenSize,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                      1.8,
                      BlurShadowContainer(
                        color: kAccentColor,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(2),
                              child: Column(
                                children: <Widget>[
                                  FancyTextField(
                                    onChanged: (value) {
                                      email = value;
                                    },
                                    textInputType: TextInputType.emailAddress,
                                    text: 'Email or phone number',
                                    hideText: false,
                                  ),
                                  FancyTextField(
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    hideText: true,
                                    text: 'Password',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        2,
                        GestureDetector(
                          onTap: () async {
                            try {
                              final newUser =
                                  await _auth.signInWithEmailAndPassword(
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
                            backgroundColor: kAccentColor,
                            textColor: Colors.white,
                            text: 'Login',
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            barrierColor: Colors.grey.withOpacity(0.7),
                            context: context,
                            builder: (context) => SingleChildScrollView(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: ForgotPasswordBottomSheet(),
                                ));
                      },
                      child: FadeAnimation(
                        2.2,
                        Text('Forgot password?', style: kBottomTextStyle),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Registration(),
                          ),
                        );
                      },
                      child: FadeAnimation(
                        2.2,
                        Text('Register', style: kBottomTextStyle),
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
