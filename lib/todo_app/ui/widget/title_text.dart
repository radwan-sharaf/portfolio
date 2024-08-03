import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleText extends StatelessWidget {
  TitleText({
    super.key,
    required this.text,
    this.size = 26,
    this.weight = FontWeight.bold,
    this.space,
  });
  final String text;
  double size;
  FontWeight weight;
  double? space;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        letterSpacing: space,
      ),
    );
  }
}
