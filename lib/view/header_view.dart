import 'package:final_project/pages/dashboard.dart';
import 'package:final_project/pages/profile.dart';
import 'package:final_project/view_model/app_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderView extends StatelessWidget {
  HeaderView({super.key});

  final user = TextEditingController();

  final password =TextEditingController();
  final TextEditingController entryController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child){
      return Container(color: viewModel.clrlvl1,
        child: Row(children: [
          Expanded(flex: 1 ,child: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back, size: 30,))),
          Expanded(flex: 1 ,child: IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
          }, icon: Icon(Icons.menu, size: 40,))),
          Center(
            child: Expanded(flex: 3 ,child: Center(
              child: Text("Welcome back, Maha",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400,
              )),
            ),),
          )
          , Expanded(flex: 1 ,child: IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(
            )));
          }, icon: Icon(Icons.person, size: 40,)))
        ],),
      );
    });
  }
}
