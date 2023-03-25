// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:attend_check/authentication/auth_services.dart';
import 'package:attend_check/utilities/constants.dart';
import 'package:attend_check/utilities/routes.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
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
                Icons.mark_email_unread_outlined,
                color: secondary,
                size: screenHeight / 7,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Please check your inbox to verify your Email.',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  "If you didn't receive the email, click the button below.",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () async =>
                      await AuthService.firebase().sendEmailVerification(),
                  style: TextButton.styleFrom(
                    fixedSize: Size(250.0, 50.0),
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Send Verification Email',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: secondary,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                TextButton(
                  onPressed: () async {
                    AuthService.firebase().logout();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(loginPage, (route) => false,);
                  },
                  style: TextButton.styleFrom(
                    fixedSize: Size(150.0, 50.0),
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
