import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:todo_t_app/todo_app/domain/task_ctrl.dart';
import 'package:todo_t_app/todo_app/ui/pages/home_page/sections/date_picker_section.dart';
import 'package:todo_t_app/todo_app/ui/pages/home_page/sections/header_section.dart';
import 'package:todo_t_app/todo_app/ui/pages/home_page/sections/tasks_section.dart';
import 'package:todo_t_app/todo_app/ui/style/design/theme.dart';
import 'package:todo_t_app/todo_app/ui/widget/default_button.dart';

import '../../widget/description_text.dart';
import '../../widget/subtitle_text.dart';
import '../../widget/title_text.dart';
import '../add_task_page/add_task_page.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectDate = DateTime.now();

  TaskCtrl ctrl = Get.find<TaskCtrl>();

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          buildHeaderSection(context),
          SizedBox(
            height: 20,
          ),
          DatePicker(
            DateTime.now(),
            height: 110,
            width: 80,
            selectionColor: primaryClr,
            onDateChange: (date) {
              setState(() {
                selectDate = date;
                print(selectDate);
              });
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
          ),
          buildTasksSection(),
          SizedBox(
            height: 15,
          ),
          Obx(() {
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  if (ctrl.newTask[index]['repeat'] == 'Daily' ||
                      ctrl.newTask[index]['date'] ==
                          DateFormat.yMd().format(selectDate) ||
                      (ctrl.newTask[index]['repeat'] == 'Weekly' &&
                          selectDate
                                      .difference(DateFormat.yMd()
                                          .parse(ctrl.newTask[index]['date']))
                                      .inDays %
                                  7 ==
                              0) ||
                      (ctrl.newTask[index]['repeat'] == 'Monthly' &&
                          DateFormat.yMd()
                                  .parse(ctrl.newTask[index]['date'])
                                  .day ==
                              selectDate.day)) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: Duration(milliseconds: 1300),
                      child: SlideAnimation(
                          verticalOffset: 300,
                          child: FadeInAnimation(
                              child: taskItem(ctrl.newTask[index], ctrl))),
                    );
                  } else {
                    return Container();
                  }
                },
                itemCount: ctrl.newTask.length,
              ),
            );
          })
        ],
      ),
    );
  }
}

Widget taskItem(Map<String, dynamic> model, TaskCtrl ctrl) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: InkWell(
      onTap: () {
        Get.bottomSheet(Container(
          color: Get.isDarkMode ? darkHeaderClr : Colors.white,
          height: 300,
          padding: EdgeInsets.only(top: 6, left: 15, right: 15, bottom: 15),
          child: model['isComplete'] == 0
              ? Column(
                  children: [
                    Container(
                      height: 5,
                      width: 130,
                      color:
                          Get.isDarkMode ? Colors.grey[900] : Colors.grey[400],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    DefaultButton(
                      onTap: () {
                        ctrl.updateTask(isComplete: 1, id: model['id']);
                      },
                      w: double.infinity,
                      h: 50,
                      text: 'Task Completed',
                      r: 15,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    DefaultButton(
                      onTap: () {
                        ctrl.deleteTask(model['id']);
                        Get.back();
                        Get.snackbar('Delete task is done', '......',
                            colorText: Colors.pink[900],
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.pink.withOpacity(0.2),
                            margin: EdgeInsets.symmetric(vertical: 20),
                            borderRadius: 15,
                            icon: Icon(
                              Icons.nearby_error_rounded,
                              size: 30,
                              color: Colors.pink[900],
                            ));
                      },
                      w: double.infinity,
                      h: 50,
                      color: Colors.red,
                      text: 'Delete task',
                      r: 15,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    DefaultButton(
                      onTap: () {
                        Get.back();
                      },
                      w: double.infinity,
                      h: 50,
                      color: Get.isDarkMode
                          ? Colors.grey[900]!
                          : Colors.grey[200]!,
                      textColor: Get.isDarkMode ? Colors.white : Colors.black,
                      text: 'Close',
                      r: 15,
                    ),
                  ],
                )
              : Column(
                  children: [
                    Container(
                      height: 5,
                      width: 130,
                      color:
                          Get.isDarkMode ? Colors.grey[900] : Colors.grey[400],
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    DefaultButton(
                      onTap: () {
                        ctrl.deleteTask(model['id']);
                        Get.back();
                        Get.snackbar('Delete task is done', '......',
                            colorText: Colors.pink[900],
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.pink.withOpacity(0.2),
                            margin: EdgeInsets.symmetric(vertical: 20),
                            borderRadius: 15,
                            icon: Icon(
                              Icons.nearby_error_rounded,
                              size: 30,
                              color: Colors.pink[900],
                            ));
                      },
                      w: double.infinity,
                      h: 50,
                      color: Colors.red,
                      text: 'Delete task',
                      r: 15,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    DefaultButton(
                      onTap: () {
                        Get.back();
                      },
                      w: double.infinity,
                      h: 50,
                      color: Get.isDarkMode
                          ? Colors.grey[900]!
                          : Colors.grey[200]!,
                      textColor: Get.isDarkMode ? Colors.white : Colors.black,
                      text: 'Close',
                      r: 15,
                    ),
                  ],
                ),
        ));
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Get.isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
              blurRadius: 6,
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          color: model['colors'] == 0
              ? Colors.indigo
              : model['colors'] == 1
                  ? Colors.pink
                  : model['colors'] == 2
                      ? Colors.amber
                      : Colors.indigo,
        ),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model['title'] ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_alarm_outlined,
                      color: Colors.grey[200],
                      size: 18,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      model['startTime'] + ' - ' + model['endTime'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[100],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                DescriptionText(
                  text: model['note'] ?? '',
                  size: 15,
                  color: Colors.grey[100]!,
                ),
              ],
            )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              color: Colors.grey[200]!.withOpacity(0.7),
              width: 0.5,
              height: 60,
              // height: double.infinity,
            ),
            SizedBox(
              width: 5,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                model['isComplete'] == 0 ? 'TODO' : 'COMPLETED',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
