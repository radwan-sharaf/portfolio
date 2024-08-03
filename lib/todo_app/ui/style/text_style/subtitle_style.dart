import 'package:flutter/material.dart';

class TextStyles{
  static TextStyle subtitleStyle({
    double size=24,
    FontWeight weight=FontWeight.w400,
    Color color=Colors.grey,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,

    );
  }
}