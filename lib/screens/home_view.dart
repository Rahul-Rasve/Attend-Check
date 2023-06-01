// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'nav_Items/calentar_view.dart';
import 'package:attend_check/utilities/constants.dart';
import 'package:attend_check/widgets/navbar_item.dart';
import 'package:flutter/material.dart';
import 'nav_Items/attend_view.dart';

import 'nav_Items/profile_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  List<Widget> pages = [
    CalendarPage(),
    AttendancePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: pages[index],
      //bottom navbar
      bottomNavigationBar: Card(
        elevation: 5.0,
        margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 10.0,
        ),
        color: primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenHeight / 25)),
        child: SizedBox(
          height: screenHeight / 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNavItem(
                iconData: Icons.calendar_month_outlined,
                onPressed: () {
                  setState(() {
                    index = 0;
                    isCalendarSelected = true;

                    isAttendanceSelected = false;
                    isProfileSelected = false;
                  });
                },
                isSelected: isCalendarSelected,
              ),
              BottomNavItem(
                iconData: Icons.check_box_outlined,
                onPressed: () {
                  setState(() {
                    index = 1;
                    isAttendanceSelected = true;

                    isCalendarSelected = false;
                    isProfileSelected = false;
                  });
                },
                isSelected: isAttendanceSelected,
              ),
              BottomNavItem(
                iconData: Icons.person_pin_outlined,
                onPressed: () {
                  setState(() {
                    index = 2;
                    isProfileSelected = true;

                    isCalendarSelected = false;
                    isAttendanceSelected = false;
                  });
                },
                isSelected: isProfileSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
