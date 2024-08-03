import 'package:flutter/material.dart';
class DescriptionText extends StatelessWidget {
  DescriptionText({
    Key? key,
    required this.text,
    this.size = 15,
    this.color = Colors.white,
    this.weight = FontWeight.w400,
    this.space=1.5,
  }) : super(key: key);
  final String text;
  double size;
  FontWeight weight;
  Color color;
  double space;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: space,
      ),
    );
  }
}
