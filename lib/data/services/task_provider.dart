import 'package:flutter/widgets.dart';
import 'package:learn_any_thing/data/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];

  void addTask({required String title}) {
    tasks.add(
      TaskModel(
        title: title,
        isDone: false,
        createAt: DateTime.now(),
        id: DateTime.now().millisecondsSinceEpoch.toString(),
      ),
    );
    notifyListeners();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void editTaskTitle(int index, String newTitle) {
    tasks[index] = TaskModel(
      title: newTitle,
      isDone: tasks[index].isDone,
      createAt: DateTime.now(),
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    notifyListeners();
  }

  void pressOnCheckBox({required int index, required bool newValue}) {
    tasks[index] = TaskModel(
      title: tasks[index].title,
      isDone: newValue,
      createAt: DateTime.now(),
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    notifyListeners();
  }

  void reset() {
    tasks.clear();
    notifyListeners();
  }

  void reorderTask(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex -= 1;
    final task = tasks.removeAt(oldIndex);
    tasks.insert(newIndex, task);
    notifyListeners();
  }
}
