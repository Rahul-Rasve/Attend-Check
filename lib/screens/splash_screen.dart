// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:attend_check/main.dart';
import 'package:attend_check/utilities/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 500,
      animationDuration: Duration(milliseconds: 2000),
      splash: Container(
        width: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/attendance.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
      splashIconSize: 150,
      backgroundColor: primary,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.topToBottom,
      nextScreen: AuthPage(),
    );
  }
}
