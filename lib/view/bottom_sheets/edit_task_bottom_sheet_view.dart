import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/task_model.dart';

import '../../view_model/app_view_model.dart';


class EditTask extends StatelessWidget {

  final TextEditingController entryController = TextEditingController();


  EditTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return AlertDialog(
        title: const Text('Edit Task'),
        content: SingleChildScrollView(
          child: ListBody(

            children: <Widget>[
              //
              TextField(
                onSubmitted: (value) {
                  if (entryController.text.isNotEmpty) {
                    //   Task newTask = Task(entryController.text, false);
                    //   viewModel.addTask(newTask);

                    entryController.clear();
                  }
                  Navigator.of(context).pop();
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 5),
                    filled: true,
                    //   fillColor: viewModel.clrLvl2,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none))),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,

                autofocus: true,
                autocorrect: false,
                controller: entryController,
                style: TextStyle(
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Save'),
            onPressed: () {

              if(entryController.text.isNotEmpty){

                viewModel.editTask(0,entryController.text);
              }
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              entryController.clear();
              Navigator.of(context).pop();
            },
          ),

        ],
      );
    })

    ;
  }

}
