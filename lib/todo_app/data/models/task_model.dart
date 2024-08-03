class TaskModel {
  int? id;
  String title;
  String note;
  String date;
  String startTime;
  String endTime;
  String remind;
  String repeat;
  int colors;
  int isComplete;

  TaskModel({
    this.id,
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.remind,
    required this.repeat,
    required this.colors,
    required this.isComplete,
  });
}
