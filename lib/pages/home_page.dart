import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todolist/data/database.dart';
import 'package:todolist/util/dialog_box.dart';
import 'package:todolist/util/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //refrence hivebox
  final _myBox = Hive.box('myBox');
  final _controller = TextEditingController();
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // TODO: implement initState
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }
  //checkbox was tapped

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //save button dabavta
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  //create anew task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (builder) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
            child: const Text(
          "To Do List",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xdf8fa6ef),
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
