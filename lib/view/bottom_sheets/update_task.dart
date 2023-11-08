import 'package:final_project/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/app_view_model.dart';

class UpdateTask extends StatefulWidget {
  const UpdateTask({super.key});

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {

  List<Task> tasks = [];
  String text = "";

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


