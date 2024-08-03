import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_t_app/todo_app/ui/style/design/theme.dart';

Widget buildDatePickerSection(DateTime selectDate) {
  return DatePicker(
    DateTime.now(),
    height: 110,
    width: 80,
    selectionColor: primaryClr,
    onDateChange: (date) {
      selectDate = date;
      print(selectDate);
    },
    daysCount: 60,
    dateTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    dayTextStyle: TextStyle(
      fontSize: 16,
      color: Colors.grey[700],
    ),
    monthTextStyle: TextStyle(
      fontSize: 18,
      color: Colors.grey[800],
    ),
    selectedTextColor: Colors.white,
    deactivatedColor: Colors.grey,
    initialSelectedDate: DateTime.now(),
  );
}
