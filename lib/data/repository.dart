import 'package:final_project/data/database.dart';
import 'package:sqflite/sqflite.dart';

// class Repository{
//   DataBaseConnection _dataBaseConnection;
//
//   Repository (){
//     _dataBaseConnection = DataBaseConnection();
//
//   }
//   static Database _database;
//   Future<Database> get database async{
//     if( _database !=null) return _database;
//     _database = await _dataBaseConnection.setDatabase();
//     return _database;
//   }
//   insertData(table, data)async{
//     var connection = await database;
//     return await connection.insert(table, data);
//   }
// }