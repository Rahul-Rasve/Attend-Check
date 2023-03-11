// ignore_for_file: prefer_const_constructors

import 'package:attend_check/utilities/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controllerName,
    required this.isObsecure,
    required this.inputType,
    required this.hintText,
    this.iconData,
  });

  final TextEditingController? controllerName;
  final bool isObsecure;
  final TextInputType? inputType;
  final String? hintText;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerName,
      obscureText: isObsecure,
      onSubmitted: (value) => FocusScope.of(context).unfocus(),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      keyboardType: inputType,
      cursorColor: primary,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          iconData,
          color: Colors.black,
          size: 30.0,
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 2.0,
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          gapPadding: 2.0,
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
