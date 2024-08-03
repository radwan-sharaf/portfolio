import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../widget/default_button.dart';
import '../../../widget/subtitle_text.dart';
import '../../../widget/title_text.dart';
import '../../add_task_page/add_task_page.dart';

Widget buildHeaderSection(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubtitleText(
            text: '${DateFormat.yMMMd().format(DateTime.now())}',
          ),
          SizedBox(
            height: 10,
          ),
          TitleText(
            text: 'Today',
          )
        ],
      ),
      DefaultButton(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddTaskPage();
              },
            ),
          );
        },
        text: '+ Add task',
      )
    ],
  );
}
