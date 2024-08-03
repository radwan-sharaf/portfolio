import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_t_app/todo_app/domain/task_ctrl.dart';
import 'package:todo_t_app/todo_app/ui/pages/add_task_page/sections/app_bar_section.dart';
import 'package:todo_t_app/todo_app/ui/style/design/theme.dart';
import 'package:todo_t_app/todo_app/ui/widget/title_text.dart';
import '../../../data/db_helper.dart';
import '../../../data/models/task_model.dart';
import '../../widget/default_button.dart';
import '../../widget/default_text_field.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime date = DateTime.now();
  TaskCtrl ctrl = Get.put(TaskCtrl());
  TimeOfDay startTime = TimeOfDay.now();
  List<String> remindList = ['5', '10', '15', '20'];
  String selectRemind = '5';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  String selectRepeat = 'None';
  int selectColor = 0;
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController noteCtrl = TextEditingController();
  TextEditingController dateCtrl = TextEditingController(
    text: DateFormat.yMd().format(DateTime.now()),
  );
  TextEditingController startCtrl = TextEditingController();
  TextEditingController endCtrl = TextEditingController();
  TextEditingController remindCtrl = TextEditingController();
  TextEditingController repeatCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: appBarSection(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title section
              TitleText(
                text: 'Add task',
                size: 24,
              ),
              SizedBox(
                height: 15,
              ),
              // forms section
              Column(
                children: [
                  DefaultTextField(
                    label: 'Title',
                    hint: 'Add title here',
                    ctrl: titleCtrl,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultTextField(
                    label: 'Note',
                    hint: 'Add note here',
                    ctrl: noteCtrl,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultTextField(
                    label: 'Date',
                    ctrl: dateCtrl,
                    type: TextInputType.none,
                    onTap: null,
                    hint: '${DateFormat.yMd().format(date)}',
                    suIcon: InkWell(
                      onTap: () async {
                        await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2014),
                          lastDate: DateTime(2025),
                        ).then((value) {
                          setState(() {
                            date = value!;
                            dateCtrl.text = '${DateFormat.yMd().format(date)}';
                          });
                        });
                      },
                      child: Icon(
                        Icons.calendar_month,
                        color: primaryClr,
                        size: 28,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DefaultTextField(
                          label: 'Start time',
                          type: TextInputType.none,
                          ctrl: startCtrl,
                          hint: '${startTime.format(context).toString()}',
                          suIcon: InkWell(
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                startTime = value!;
                                startCtrl.text =
                                    '${startTime.format(context).toString()}';
                              });
                            },
                            child: Icon(
                              Icons.access_alarm_outlined,
                              color: primaryClr,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: DefaultTextField(
                          type: TextInputType.none,
                          ctrl: endCtrl,
                          suIcon: InkWell(
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                endCtrl.text =
                                    '${value!.format(context).toString()}';
                              });
                            },
                            child: Icon(
                              Icons.access_alarm_outlined,
                              color: primaryClr,
                              size: 28,
                            ),
                          ),
                          label: 'End time',
                          hint: '12:30 AM',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultTextField(
                    label: 'Remind',
                    ctrl: remindCtrl,
                    type: TextInputType.none,
                    hint: '$selectRemind minutes early',
                    suIcon: DropdownButton(
                      items: remindList.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (newRemind) {
                        setState(() {
                          selectRemind = newRemind!;
                          remindCtrl.text = selectRemind;
                        });
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryClr,
                      ),
                      iconSize: 40,
                      elevation: 4,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: primaryClr,
                        //: Colors.grey[700],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultTextField(
                    label: 'Repeat',
                    ctrl: repeatCtrl,
                    type: TextInputType.none,
                    hint: '$selectRepeat',
                    suIcon: DropdownButton(
                      items: repeatList.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (newRepeat) {
                        setState(() {
                          selectRepeat = newRepeat!;
                          repeatCtrl.text = selectRepeat;
                        });
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryClr,
                      ),
                      iconSize: 40,
                      elevation: 4,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color:primaryClr,
                        // Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        text: 'Colors',
                        size: 18,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Wrap(
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectColor = index;
                                });
                              },
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: index == 0
                                    ? Colors.indigo
                                    : index == 1
                                        ? Colors.pink
                                        : Colors.yellow,
                                child: selectColor == index
                                    ? Icon(
                                        Icons.done,
                                        size: 16,
                                        color: Colors.white,
                                      )
                                    : Container(),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  Spacer(),
                  DefaultButton(
                    onTap: () {
                      if (titleCtrl.text.isNotEmpty &&
                          noteCtrl.text.isNotEmpty) {
                        ctrl.addTask(
                            taskModel: TaskModel(
                          title: titleCtrl.text,
                          note: noteCtrl.text,
                          date: dateCtrl.text,
                          startTime: '${startTime.format(context).toString()}',
                          endTime: '${endCtrl.text}',
                          remind: selectRemind,
                          repeat: selectRepeat,
                          colors: selectColor,
                          isComplete: 0,
                        ));
                        Navigator.pop(context);
                        Get.snackbar('Task added successfully', '',
                            colorText: selectColor == 0
                                ? Colors.indigo[900]
                                : selectColor == 1
                                    ? Colors.pink[900]
                                    : selectColor == 2
                                        ? Colors.amber[900]
                                        : Colors.indigo[900],
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: selectColor == 0
                                ? Colors.indigo.withOpacity(0.3)
                                : selectColor == 1
                                    ? Colors.pink.withOpacity(0.3)
                                    : selectColor == 2
                                        ? Colors.amber.withOpacity(0.3)
                                        : Colors.indigo.withOpacity(0.3),
                            margin: EdgeInsets.symmetric(vertical: 20),
                            borderRadius: 15,
                            icon: Icon(
                              Icons.done,
                              size: 30,
                              color: selectColor == 0
                                  ? Colors.indigo[900]
                                  : selectColor == 1
                                      ? Colors.pink[900]
                                      : selectColor == 2
                                          ? Colors.amber[900]
                                          : Colors.indigo[900],
                            ));
                      } else if (titleCtrl.text.isEmpty ||
                          noteCtrl.text.isEmpty) {
                        Get.snackbar(
                            'Required', 'Please enter all data in all forms',
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
                      }
                    },
                    text: 'Add task',
                    h: 45,
                    r: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
