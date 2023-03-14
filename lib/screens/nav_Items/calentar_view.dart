// ignore_for_file: prefer_const_constructors

import 'package:attend_check/authentication/auth_services.dart';
import 'package:attend_check/utilities/routes.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          AuthService.firebase().logout();
          Navigator.of(context).pushNamedAndRemoveUntil(
            loginPage,
            (route) => false,
          );
        },
        child: Text('Logout'),
      ),
    );
  }
}
