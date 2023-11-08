import 'package:flutter/material.dart';
import 'add_task_view.dart';
import 'header_view.dart';
import 'task_list_view.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Expanded(flex: 1, child: HeaderView()),
          Expanded(flex: 7, child: TaskListView())
        ],),
      ),
      floatingActionButton: const AddTaskView(),
    );
  }
}
