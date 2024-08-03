import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../domain/task_ctrl.dart';
import '../home_page/home_page.dart';
import '../home_page/sections/date_picker_section.dart';
import '../home_page/sections/header_section.dart';
import '../home_page/sections/tasks_section.dart';

class DonePage extends StatelessWidget {
  DonePage({
    Key? key,
  }) : super(key: key);
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
          Obx(() {
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: Duration(milliseconds: 1300),
                    child: SlideAnimation(
                        verticalOffset: 300,
                        child: FadeInAnimation(
                            child: taskItem(ctrl.doneTask[index], ctrl))),
                  );
                },
                itemCount: ctrl.doneTask.length,
              ),
            );
          })
        ],
      ),
    );
  }
}
