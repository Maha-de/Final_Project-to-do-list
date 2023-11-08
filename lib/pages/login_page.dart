import 'package:final_project/pages/profile.dart';
import 'package:final_project/view/task_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/cacheHelper.dart';
import '../view_model/app_view_model.dart';

class LoginPage extends StatelessWidget {


  LoginPage({super.key});

  // var taskname;
  final user = TextEditingController();

  final password =TextEditingController();

  final TextEditingController entryController = TextEditingController();


  // getPref()async{
  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child)
    {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: viewModel.clrlvl4,
          title: Center(child: Text("Login")),
        ), body: Center(
        child: ListView(children: [
          SizedBox(height: 150,),
          Icon(Icons.diamond, size: 50,),
          Text("Login", textAlign: TextAlign.center,),
          SizedBox(height: 30,),
          Row(
            children: [Padding(padding: EdgeInsets.only(left: 10)),
              Icon(Icons.person),
              SizedBox(width: 320,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: user,
                    // onTap: viewModel.setusername(user.text),
                    decoration: InputDecoration(border: OutlineInputBorder(),
                        labelText: "Username"),),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [Padding(padding: EdgeInsets.only(left: 10)),
              Icon(Icons.lock),
              SizedBox(width: 320,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                        labelText: "Password"),),
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          OverflowBar(
            alignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text(
                  'CANCEL', style: TextStyle(color: viewModel.clrlvl4),),
                onPressed: () {
                  user.clear();
                  password.clear();
                },
              ), ElevatedButton(
                style: ElevatedButton.styleFrom(primary: viewModel.clrlvl4),
                child: const Text('NEXT'),
                onPressed: () {
                  // viewModel.setusername(user.text);
                  // await CacheData.getData(key: "TaskName");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          TaskPage(),
                      ));
                },
              ),
            ],
          ),
        ],),)
        ,
      );
    });
  }
}
