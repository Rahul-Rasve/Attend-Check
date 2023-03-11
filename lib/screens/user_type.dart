// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables,

import 'package:attend_check/utilities/constants.dart';
import 'package:attend_check/utilities/routes.dart';
import 'package:flutter/material.dart';

class UserType extends StatefulWidget {
  const UserType({super.key});

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
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
                Icons.people_alt_rounded,
                color: Colors.white,
                size: screenHeight / 7,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 60.0, horizontal: 30.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: primary,
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Select the Login User Type',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenHeight / 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isTeacher = true;
                            });
                            Navigator.of(context, rootNavigator: true,).popAndPushNamed(loginPage);
                          },
                          style: buttonStyle(),
                          child: Text(
                            'Teacher Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isStudent = true;
                            });
                            Navigator.of(context).pushNamed(loginPage);
                          },
                          style: buttonStyle(),
                          child: Text(
                            'Student Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
