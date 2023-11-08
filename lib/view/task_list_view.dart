import 'package:final_project/view/add_task_view.dart';
import 'package:final_project/view/bottom_sheets/add_task_bottom_sheet_view.dart';
import 'package:final_project/view/bottom_sheets/edit_task_bottom_sheet_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_model.dart';
import '../view_model/app_view_model.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController = TextEditingController();


    return Consumer<AppViewModel>(builder: (context, viewModel, child){
      return Container(
        decoration: BoxDecoration( color: viewModel.clrlvl2,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: ListView.separated(
          padding: EdgeInsets.all(15),
          separatorBuilder: (context, index){
            return SizedBox(height: 15,);
          }, itemCount: viewModel.numTasks,
          itemBuilder: (context, index){
          return Dismissible( key: UniqueKey(),
            onDismissed: (direction){
              viewModel.deleteTask(index);
            },
            background: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.red.shade300,
                borderRadius: BorderRadius.circular(10),),
              child: Center(child: Icon(Icons.delete, color: Colors.red.shade700,),),
            ),
            child: Container(
              decoration: BoxDecoration(color: viewModel.clrlvl1,
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                  leading: Checkbox(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    side: BorderSide(width: 2, color: viewModel.clrlvl3),
                    checkColor: viewModel.clrlvl1,
                    activeColor: viewModel.clrlvl3,
                    value: viewModel.getTaskValue(index),
                    onChanged: (value){
                      viewModel.seTaskValue(index, value!);
                    },
                  ),
                  title: Text(viewModel.getTaskTitle(index),
                    style: TextStyle(color: viewModel.clrlvl4, fontSize: 17, fontWeight: FontWeight.w500),),
                  trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      IconButton(onPressed: (){viewModel.deleteTask(index);}, icon: Icon(Icons.delete)),
                      IconButton(onPressed: ()async{

                        await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Edit Task'),
                            content: SingleChildScrollView(
                              child: ListBody(

                                children: <Widget>[
                                  //
                                  TextField(
                                    onSubmitted: (value) {
                                      if (entryController.text.isNotEmpty) {

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

                                    viewModel.editTask(index,entryController.text);
                                  }
                                  entryController.clear();
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
                        });

                      }, icon: Icon(Icons.edit)),
                    ],
                  )
              ),
            ),
          );
        },),
      );
    });
  }
}
