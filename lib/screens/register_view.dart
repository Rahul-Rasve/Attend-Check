// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:attend_check/authentication/auth_exceptions.dart';
import 'package:attend_check/utilities/constants.dart';
import 'package:attend_check/authentication/auth_services.dart';
import 'package:attend_check/utilities/routes.dart';
import 'package:attend_check/widgets/dialog_box.dart';
import 'package:attend_check/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController userEmail;
  late final TextEditingController userPassword;
  late final TextEditingController userConfirmPassword;

  @override
  void initState() {
    userEmail = TextEditingController();
    userPassword = TextEditingController();
    userConfirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userEmail = TextEditingController();
    userPassword = TextEditingController();
    userConfirmPassword = TextEditingController();
    super.dispose();
  }

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
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
            child: Column(
              children: [
                Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: InputField(
                    controllerName: userEmail,
                    isObsecure: false,
                    hintText: 'Enter your Email-Id',
                    inputType: TextInputType.emailAddress,
                    iconData: Icons.email_outlined,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: InputField(
                    controllerName: userPassword,
                    isObsecure: true,
                    hintText: 'Enter your Password',
                    inputType: TextInputType.text,
                    iconData: Icons.lock_person_outlined,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: InputField(
                    controllerName: userConfirmPassword,
                    isObsecure: true,
                    hintText: 'Confirm your Password',
                    inputType: TextInputType.text,
                    iconData: Icons.lock_person_outlined,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () async {
              try {
                if (userEmail.text.isEmpty ||
                    userPassword.text.isEmpty ||
                    userConfirmPassword.text.isEmpty) {
                  showErrorDialog(context, 'All fields are mandatory');
                } else {
                  if (userConfirmPassword.text == userPassword.text) {
                    await AuthService.firebase().register(
                      email: userEmail.text,
                      password: userPassword.text,
                    );

                    AuthService.firebase().sendEmailVerification();

                    Navigator.of(context).pushNamed(verifyEmailPage);
                  } else {
                    showErrorDialog(context, 'Passwords don\'t match!');
                  }
                }
              } on WeakPasswordAuthException catch (_) {
                await showErrorDialog(
                  context,
                  'Weak Password',
                );
              } on EmailAlreadyInUseAuthException catch (_) {
                await showErrorDialog(
                  context,
                  'Email already in use, try signing in.',
                );
              } on InvalidEmailAuthException catch (_) {
                await showErrorDialog(
                  context,
                  'Invalid Email!',
                );
              } on GenericAuthException catch (_) {
                await showErrorDialog(
                  context,
                  'Failed to register!',
                );
              }
            },
            style: buttonStyle(),
            child: Text(
              'SIGN UP',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have a account?",
                style: TextStyle(fontSize: 15.0),
              ),
              TextButton(
                onPressed: () => Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginPage, (route) => false),
                child: Text(
                  'Login here',
                  style: TextStyle(color: Colors.blue, fontSize: 15.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
