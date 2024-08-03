import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    Key? key,
    required this.onTap,
    this.h = 60,
    this.w = 120,
    this.r = 20,
    this.s = 16,
    this.text = '',
    this.color = Colors.indigo,
    this.textColor = Colors.white,
    this.icon,
    this.iconSize=30
  }) : super(key: key);
  final void Function() onTap;
  double h;
  double w;
  double r;
  double s;
  Color color;
  String text;
  Color textColor;
  IconData? icon;
  double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: h,
        width: w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(r),
        ),
        child: text != '' && icon == null
            ? Text(
                text,
                style: TextStyle(
                    fontSize: s, color: textColor, fontWeight: FontWeight.bold),
              )
            : text == '' && icon != null
                ? Icon(
                    icon,
                    size: 30,
                    color: textColor,
                  )
                : Row(
                    children: [
                      Icon(
                        icon,
                        size: iconSize,
                        color: textColor,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: s,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
