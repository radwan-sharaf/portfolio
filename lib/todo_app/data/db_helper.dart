import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_t_app/todo_app/data/models/task_model.dart';
import 'package:todo_t_app/todo_app/domain/task_ctrl.dart';

import '../ui/pages/add_task_page/add_task_page.dart';

/// 1 create database
/// 2 create table
/// 3 open database
/// 4 insert into database
/// 5 get from database
/// 6 update
/// 7 delete
class DBHelper {
  static TaskCtrl ctrl = Get.put(TaskCtrl());

  static String dbName = 'todo_app.db';
  static int v = 1;
  static String tableName = 'task';
  static Database? database;
  // create db
  static void createDatabase() async {
    database = await openDatabase(
      dbName,
      version: v,
      onCreate: (database, version) {
        print('database created');
        database.execute('''create table $tableName (
          id integer primary key,
          title text,
          note text,
          date text,
          startTime text,
          endTime text,
          remind text,
          repeat text,
          colors integer,
          isComplete integer
        )''').then((value) {
          print('table created');
        }).catchError((onError) {
          print('the error : $onError');
        });
      },
      onOpen: (database) {
        print('database open');
        getDataFromDatabase(database);
      },
    );
  }

  static Future insertDatabase({
    required TaskModel taskModel,
  }) async {
    await database!.transaction((txn) async {
      return await txn.rawInsert('''
     INSERT INTO $tableName(
     title,
     note,
     date,
     startTime,
     endTime,
     remind,
     repeat,
     colors,
     isComplete) VALUES(
     "${taskModel.title}",
     "${taskModel.note}",
     "${taskModel.date}",
     "${taskModel.startTime}",
     "${taskModel.endTime}",
     "${taskModel.remind}",
     "${taskModel.repeat}",
     ${taskModel.colors},
     0
     )
     ''').then((value) {
        print('insert row is done $value');
      }).catchError((error) {
        print('errer here: $error');
      });
    });
  }

  // static List<Map<String,dynamic>>newTask=[];
  static void getDataFromDatabase(database) {
    ctrl.newTask.value = [];
    ctrl.doneTask.value = [];
    database!.rawQuery('select * from $tableName').then((value) {
      print(ctrl.newTask);
      value.forEach((e) {
        print(e['isComplete']);
        if (e['isComplete'] == 0) {
          ctrl.newTask.add(e);
        } else if (e['isComplete'] == 1) {
          ctrl.doneTask.add(e);
        }
      });
    });
  }

  static Future<void> deleteFromDatabase({required int id}) async {
    await database!
        .rawDelete('Delete from $tableName where id=?', [id]).then((value) {
      print('delete row number $value ');
    }).catchError((error) {
      print(error);
    });
  }

  static Future<void> updateDataFromDatabase({
    required int isComplete,
    required int id,
  }) async {
    await database!.rawUpdate(
      'update $tableName set isComplete=? where id=?',
      [isComplete, id],
    ).then((value) {
      print('is completed');
    });
  }

  static Future<int> deleteAllData() async {
    return await database!.delete(tableName);
  }
}
