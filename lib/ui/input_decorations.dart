import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0XffA73030), width: 2)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0XffBDBCBC)),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: const Color(0XffA73030))
            : null);
  }
}
