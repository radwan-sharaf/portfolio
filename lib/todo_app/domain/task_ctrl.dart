import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo_t_app/todo_app/data/db_helper.dart';
import 'package:todo_t_app/todo_app/data/models/task_model.dart';

class TaskCtrl extends GetxController {
  RxList<dynamic> newTask = [].obs;
  RxList<dynamic> doneTask = [].obs;

  Future<void> addTask({required TaskModel taskModel}) async {
    await DBHelper.insertDatabase(
      taskModel: taskModel,
    ).then((value) {
      DBHelper.getDataFromDatabase(DBHelper.database);
    });
  }

  Future<void> deleteTask(int id) async {
    await DBHelper.deleteFromDatabase(id: id).then((value) {
      DBHelper.getDataFromDatabase(DBHelper.database);
    });
  }

  Future<void> updateTask({required int isComplete, required int id}) async {
    await DBHelper.updateDataFromDatabase(isComplete: isComplete, id: id)
        .then((value) {
      DBHelper.getDataFromDatabase(DBHelper.database);
    });
  }

  deleteAllTasks() async {
    await DBHelper.deleteAllData().then((value) {
      newTask.clear();
      doneTask.clear();
      // snack bar
      Get.snackbar('Tasks is Deleted', 'No any task now ...',
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          margin: EdgeInsets.symmetric(vertical: 20),
          borderRadius: 15,
          icon: Icon(
            Icons.nearby_error_rounded,
            size: 30,
            color: Colors.white,
          ));
    });
  }
}
