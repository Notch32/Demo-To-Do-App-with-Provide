import 'package:flutter/material.dart';
import 'package:learn_any_thing/data/services/task_provider.dart';
import 'package:learn_any_thing/presentation/pages/home_page.dart';
import 'package:learn_any_thing/presentation/pages/settings_page.dart';
import 'package:provider/provider.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  final List<Widget> body = [HomePage(), SettingsPage()];

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      activeIcon: Icon(Icons.home_outlined),
      label: "Home",
      backgroundColor: Colors.blue,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      activeIcon: Icon(Icons.settings_outlined),
      label: "Settings",
      backgroundColor: Colors.blue,
    ),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(index == 0 ? "To Do" : "Settings"),
        ),
        elevation: 4.0,
        shadowColor: Colors.black,

        centerTitle: true,
      ),

      body: body[index],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: index,
        onTap: (value) => setState(() => index = value),
      ),
      floatingActionButton:
          index == 0
              ? FloatingActionButton.extended(
                onPressed: () {
                  TextEditingController controller = TextEditingController();
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text("Add Task"),
                          content: TextField(controller: controller),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.read<TaskProvider>().addTask(
                                  title: controller.text,
                                );
                                Navigator.pop(context);
                              },
                              child: const Text("Save"),
                            ),
                          ],
                        ),
                  );
                },
                label: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 4.0),
                    Text("Add Task"),
                  ],
                ),
              )
              : null,
    );
  }
}
