import 'package:final_project/view_model/app_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: viewModel.clrlvl4,
          title: Center(child: Text("Dashboard")),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: Column(children: [
              Text("Total Tasks", style: TextStyle(color: viewModel.clrlvl4,
                  fontWeight: FontWeight.w600, fontSize: 30),),
              Text("${viewModel.numTasks}",
                style: TextStyle(fontSize: 40, color: viewModel.clrlvl3,
                    fontWeight: FontWeight.bold),),
              Text("Completed Tasks", style: TextStyle(color: viewModel.clrlvl4,
                  fontWeight: FontWeight.w600, fontSize: 30),),
              Text("${viewModel.CompletedTasks}",
                style: TextStyle(fontSize: 40, color: viewModel.clrlvl3,
                    fontWeight: FontWeight.bold),),
              Text("Non-Completed Tasks", style: TextStyle(color: viewModel.clrlvl4,
                  fontWeight: FontWeight.w600, fontSize: 30),),
              Text("${viewModel.numTasksRemaining}",
                style: TextStyle(fontSize: 40, color: viewModel.clrlvl3,
                    fontWeight: FontWeight.bold),),
            ],),
          ),
        ),
      );
    });
  }
}
