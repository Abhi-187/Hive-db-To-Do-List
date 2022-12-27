import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];

  //refrence Box
  final _myBox = Hive.box('myBox');

  void createInitialData() {
    toDoList = [
      ['Try Creating task', false],
      ['Try Deleting by Swipe Left', false],
      ["Click on checkbox if you're done", false]
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
