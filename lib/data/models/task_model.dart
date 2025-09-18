class TaskModel {
  String title;
  bool isDone;
  DateTime createAt;
  String id;

  TaskModel({
    required this.title,
    required this.isDone,
    required this.createAt,
    required this.id,
  });
}
