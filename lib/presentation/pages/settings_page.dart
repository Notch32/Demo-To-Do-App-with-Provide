import 'package:flutter/material.dart';
import 'package:learn_any_thing/data/services/task_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Reset Task"),
              IconButton(
                onPressed: () => context.read<TaskProvider>().reset(),
                icon: Icon(Icons.refresh_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
