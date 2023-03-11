// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:attend_check/utilities/constants.dart';
import 'package:attend_check/authentication/auth_exceptions.dart';
import 'package:attend_check/authentication/auth_services.dart';
import 'package:attend_check/utilities/routes.dart';
import 'package:attend_check/widgets/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../widgets/input_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController userPassword;
  late final TextEditingController userEmail;

  @override
  void initState() {
    userEmail = TextEditingController();
    userPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userEmail = TextEditingController();
    userPassword = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final bool isKeyboardVisibile =
        KeyboardVisibilityProvider.isKeyboardVisible(context);

    return Scaffold(
      body: Column(
        children: [
          isKeyboardVisibile
              ? SizedBox(
                  //to eliminate pixel overflow
                  height: screenHeight / 15,
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
              'Login',
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
              ],
            ),
          ),
          TextButton(
            onPressed: () async {
              try {
                if (userEmail.text.isEmpty || userPassword.text.isEmpty) {
                  showErrorDialog(
                      context, 'Please enter your login credentials.');
                } else {
                  await AuthService.firebase().login(
                    email: userEmail.text,
                    password: userPassword.text,
                  );

                  final user = AuthService.firebase().currentUser;

                  if (user?.isEmailVerified == true) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(homePage, (route) => false);
                  } else {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        verifyEmailPage, (route) => false);
                  }
                }
              } on UserNotFoundAuthException catch (_) {
                await showErrorDialog(
                  context,
                  'User not found!',
                );
              } on WrongPasswordAuthException catch (_) {
                await showErrorDialog(
                  context,
                  'Wrong password! Try again.',
                );
              } on GenericAuthException catch (_) {
                await showErrorDialog(
                  context,
                  'Authentication Error!',
                );
              }
            },
            style: buttonStyle(),
            child: Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 15.0),
              ),
              TextButton(
                onPressed: () => Navigator.of(context)
                    .pushNamedAndRemoveUntil(registerPage, (route) => false),
                child: Text(
                  'Sign Up here',
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
