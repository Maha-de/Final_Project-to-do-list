import 'package:final_project/data/cacheHelper.dart';
import 'package:final_project/pages/login_page.dart';
import 'package:final_project/pages/splash_screen.dart';
import 'package:final_project/view_model/app_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'view/task_page.dart';


void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await CacheData.cacheInitialization();

  runApp(ChangeNotifierProvider(create: (context) => AppViewModel() , child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
    );
  }
}



