// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

const Color primary = Colors.red;
const Color secondary = Colors.white;
const Color blackColor = Colors.black;
const Color splashColor = Color.fromARGB(95, 255, 255, 255);

bool isTeacher = false;
bool isStudent = false;

//navbar items
bool isCalendarSelected = true; //since it is the landing page
bool isAttendanceSelected = false;
bool isProfileSelected = false;

ButtonStyle buttonStyle() {
  return ButtonStyle(
    fixedSize: MaterialStateProperty.all(
      Size(150.0, 50.0),
    ),
    backgroundColor: MaterialStateProperty.all(primary),
    elevation: MaterialStateProperty.all(5.0),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
    overlayColor: MaterialStateColor.resolveWith(
      (states) => splashColor,
    ),
  );
}
