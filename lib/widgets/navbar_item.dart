import 'package:attend_check/utilities/constants.dart';
import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.iconData,
    required this.onPressed,
    required this.isSelected,
  });

  final IconData iconData;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: secondary,
        elevation: isSelected ? 0.0 : 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          widthFactor: 2.8,
          heightFactor: 1.5,
          child: Icon(
            iconData,
            size: screenHeight / 23,
            color: isSelected ? primary : blackColor,
          ),
        ),
      ),
    );
  }
}
