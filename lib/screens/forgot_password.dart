import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tea_app/components/blur_shadow_container.dart';
import 'package:tea_app/constants.dart';
import '../components/gradient_button.dart';
import '../components/fancy_textfield.dart';

class ForgotPasswordBottomSheet extends StatefulWidget {
  @override
  _ForgotPasswordBottomSheetState createState() =>
      _ForgotPasswordBottomSheetState();
}

class _ForgotPasswordBottomSheetState extends State<ForgotPasswordBottomSheet> {
  final _auth = FirebaseAuth.instance;
  String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 40,
        ),
        child: Column(
          children: <Widget>[
            Text(
              'Enter your email or phone number',
              textAlign: TextAlign.center,
              style: kTopTextStyle,
            ),
            SizedBox(height: (MediaQuery.of(context).size.height) * 0.05),
            BlurShadowContainer(
              color: kAccentColor,
              child: Container(
                padding: EdgeInsets.all(2),
                child: FancyTextField(
                  onChanged: (value) {
                    email = value;
                  },
                  textInputType: TextInputType.emailAddress,
                  text: 'Email or phone number',
                  hideText: false,
                ),
              ),
            ),
            SizedBox(height: (MediaQuery.of(context).size.height) * 0.05),
            GestureDetector(
                onTap: () async {
                  try {
                    await _auth.sendPasswordResetEmail(email: email);
                    Navigator.pop(context);
                  } catch (e) {
                    print(e);
                  }
                },
                child: GradientButton(
                  backgroundColor: kAccentColor,
                  textColor: Colors.white,
                  text: 'Reset password',
                )),
          ],
        ),
      ),
    );
  }
}
