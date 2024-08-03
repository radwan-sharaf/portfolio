import 'package:flutter/material.dart';

appBarSection(BuildContext context) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        size: 28,
      ),
    ),
    actions: [
      CircleAvatar(),
      SizedBox(
        width: 20,
      ),
    ],
  );
}
