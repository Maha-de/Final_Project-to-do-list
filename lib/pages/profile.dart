import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/app_view_model.dart';

class ProfileScreen extends StatefulWidget {

  var data;
  var passdata;
  ProfileScreen({this.data, this.passdata , super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = TextEditingController();

  final email =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: viewModel.clrlvl4,
          title: Center(child: Text("Profile Page")),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 100, left: 20),
          children: [
            Center(
              child: Stack(children: [
                Container(
                  height: 150, width: 150,
                  decoration: BoxDecoration(shape: BoxShape.circle,
                      image: DecorationImage(fit: BoxFit.cover, image: AssetImage("images/profile.jpg")),
                      border: Border.all(color: Colors.black, width: 5)),
                ),
              ],
              ),
            ),
          SizedBox(height: 25,),
            Row(
              children: [Padding(padding: EdgeInsets.only(left: 10)),
                Icon(Icons.person, size: 30,),
                SizedBox(width: 320,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20),
                    child:
                    // Text("${widget.data}"),

                    TextField(
                    controller: user,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                    labelText: "Username"),
                    style: TextStyle(fontSize: 25, color: viewModel.clrlvl4),
      ),
                  ),
                ),
              ],
            ),
             SizedBox(height: 20),
             Row(
               children: [Padding(padding: EdgeInsets.only(left: 10)),
                 Icon(Icons.email, size: 30,),
                 SizedBox(width: 320,
                   child: Padding(
                     padding: const EdgeInsets.only(right: 20.0, left: 20),
                     child: TextField(
                     controller: email,
                     decoration: InputDecoration(border: OutlineInputBorder(),
                     labelText: "Email"), style: TextStyle(fontSize: 25, color: viewModel.clrlvl4),),
                   ),
                 ),
               ],
             ),
          ],
        ),
      );
    });
  }
}
