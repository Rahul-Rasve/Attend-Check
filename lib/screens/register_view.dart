// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:attend_check/constants.dart';
import 'package:attend_check/resources/auth_services.dart';
import 'package:attend_check/resources/auth_services.dart';
import 'package:attend_check/utilities/routes.dart';
import 'package:attend_check/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController? userEmail;
  TextEditingController? userPassword;
  TextEditingController? userConfirmPassword;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bool isKeyboardVisibile =
        KeyboardVisibilityProvider.isKeyboardVisible(context);

    return Scaffold(
      body: Column(
        children: [
          isKeyboardVisibile
              ? SizedBox(
                  //to eliminate pixel overflow
                  height: screenHeight / 18,
                )
              : Container(
                  height: screenHeight / 2.5,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20.0),
                      right: Radius.circular(20.0),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person_pin_rounded,
                      color: Colors.white,
                      size: screenHeight / 7,
                    ),
                  ),
                ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30.0),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: [
                InputField(
                  controllerName: userEmail,
                  isObsecure: false,
                  hintText: 'Enter your Email-Id',
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 30.0,
                ),
                InputField(
                  controllerName: userPassword,
                  isObsecure: true,
                  hintText: 'Enter your Password',
                  inputType: TextInputType.text,
                ),
                SizedBox(
                  height: 30.0,
                ),
                InputField(
                  controllerName: userConfirmPassword,
                  isObsecure: true,
                  hintText: 'Confirm your Password',
                  inputType: TextInputType.text,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              try {
                if (userConfirmPassword!.text == userPassword!.text) {
                  await AuthService.firebase().register(
                    email: userEmail!.text,
                    password: userPassword!.text,
                  );

                  AuthService.firebase().sendEmailVerification();

                  Navigator.of(context).pushNamedAndRemoveUntil(
                      verifyEmailPage, (route) => false);
                }
              } on Exception catch (_) {
                Fluttertoast.showToast(
                  msg: 'Failed to register!',
                );
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
