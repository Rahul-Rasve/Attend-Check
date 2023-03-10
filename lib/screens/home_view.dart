// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:attend_check/authentication/auth_services.dart';
import 'package:attend_check/constants.dart';
import 'package:attend_check/utilities/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            await AuthService.firebase().logout();
            Navigator.of(context).pushNamedAndRemoveUntil(
              (!isTeacher && !isStudent) ? userType : loginPage,
              (route) => false,
            );
          },
          style: buttonStyle(),
          child: Text(
            'logout',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
