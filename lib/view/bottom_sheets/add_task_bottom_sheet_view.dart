import 'package:final_project/data/cacheHelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/task_model.dart';
import '../../view_model/app_view_model.dart';

class AddTaskBottomSheetView extends StatelessWidget {
  const AddTaskBottomSheetView({super.key});

  // savePref()async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString("task", "task1");
  // }

  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController = TextEditingController();

    return Consumer<AppViewModel>(builder: (context, viewModel, child){
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Text("Add Task"),
                Container(height: 80,
                  child: Center(
                    child: SizedBox(
                      height: 40,
                      width: 250,
                      child: TextField(
                        onSubmitted: (value){
                          if(entryController.text.isNotEmpty){
                            Task newTask = Task(entryController.text, false);
                            viewModel.addTask(newTask);
                            entryController.clear();
                          }
                          Navigator.of(context).pop();
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 5),
                            filled: true, fillColor: viewModel.clrlvl2,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(width: 0, style: BorderStyle.none)) ),
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: viewModel.clrlvl4,
                        autofocus: true,
                        autocorrect: false,
                        controller: entryController,
                        style: TextStyle(color: viewModel.clrlvl4, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("Cancel")),
              SizedBox(width: 25,),
              ElevatedButton(onPressed: () {
                Task newTask = Task(entryController.text, false);
                viewModel.addTask(newTask);
                entryController.clear();
                Navigator.of(context).pop();
                // await savePref();
                // await CacheData.setData(key: "TaskName", value: entryController.text);
                // CacheData.getData(key: "TaskName");
              }, child: Text("Save")),
          ],)
      , Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))],
      );
    },);
  }
}