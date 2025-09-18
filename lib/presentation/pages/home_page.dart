import 'package:flutter/material.dart';
import 'package:learn_any_thing/data/services/task_provider.dart';
import 'package:learn_any_thing/presentation/widgets/task_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    final screenSize = MediaQuery.sizeOf(context);

    if (taskProvider.tasks.isEmpty) {
      return const Center(child: Text("Nothing Here, Add Task"));
    }

    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: ReorderableListView.builder(
        buildDefaultDragHandles: false,
        itemCount: taskProvider.tasks.length,
        onReorder: (oldIndex, newIndex) {
          context.read<TaskProvider>().reorderTask(oldIndex, newIndex);
        },
        itemBuilder: (context, index) {
          return Padding(
            key: ValueKey(taskProvider.tasks[index].id),
            padding: EdgeInsets.only(
              left: screenSize.width * 0.05,
              right: screenSize.width * 0.05,
              bottom: screenSize.width * 0.02,
            ),
            child: TaskWidget(task: taskProvider.tasks[index], index: index),
          );
        },
      ),
    );
  }
}
