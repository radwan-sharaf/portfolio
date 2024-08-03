import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SubtitleText extends StatelessWidget {
  SubtitleText({
    Key? key,
    required this.text,
    this.size = 20,
    this.weight = FontWeight.bold,
    this.space,
  }) : super(key: key);
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
      ),
    );
  }
}
