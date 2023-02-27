import 'package:flutter/material.dart';
import 'package:web/extention_function.dart';

class Utils {
  static showSnackBar(String text, context, color) {
    var snackBar = SnackBar(
      content: Text(text.capitalize()),
      backgroundColor: color,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
