import 'package:flutter/material.dart';
import 'package:learn_any_thing/data/models/task_model.dart';
import 'package:learn_any_thing/data/services/task_provider.dart';
import 'package:provider/provider.dart';

class TaskWidget extends StatelessWidget {
  final TaskModel task;
  final int index;
  const TaskWidget({super.key, required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Dismissible(
      key: ValueKey(task.id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.blue,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          context.read<TaskProvider>().removeTask(index);
          return true;
        } else {
          TextEditingController controller = TextEditingController();
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: const Text("Edit Task"),
                  content: TextField(controller: controller),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<TaskProvider>().editTaskTitle(
                          index,
                          controller.text,
                        );
                        Navigator.pop(context);
                      },
                      child: const Text("Save"),
                    ),
                  ],
                ),
          );
          return false; // don’t remove from UI
        }
      },
      child: Stack(
        children: [
          Container(
            key: ValueKey(task.id), // important for reorder
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            height: screenSize.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: const Color(0xFF363636),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
                  offset: Offset(1, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    task.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: task.isDone ? Colors.grey : Colors.white,
                      decoration:
                          task.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                      decorationThickness: 2.5,
                    ),
                  ),
                ),

                Checkbox(
                  value: task.isDone,
                  onChanged:
                      (_) => context.read<TaskProvider>().pressOnCheckBox(
                        index: index,
                        newValue: !task.isDone,
                      ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ReorderableDragStartListener(
              index: index,
              child: Center(
                child: Container(
                  width: screenSize.width * 0.59,
                  color: Colors.transparent,
                  height: screenSize.height * 0.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
