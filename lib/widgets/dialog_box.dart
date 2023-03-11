// ignore_for_file: prefer_const_constructors

import 'package:attend_check/utilities/constants.dart';
import 'package:flutter/material.dart';

Future<void> showErrorDialog(BuildContext context, String message) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'Alert!',
          style: TextStyle(
            color: primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          )
        ],
      );
    },
  );
}
