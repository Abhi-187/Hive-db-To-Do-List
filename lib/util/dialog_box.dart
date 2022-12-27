import 'package:flutter/material.dart';
import 'package:todolist/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {Key? key, this.controller, required this.onCancel, required this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xffced7f5),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new Task 😊",
                  fillColor: Colors.white,
                  filled: true),
            ),
            Container(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //save
                MyButton(text: "Save", onPressed: onSave),
                const SizedBox(width: 4),
                MyButton(text: "Cancel", onPressed: onCancel),
                //cancel
              ],
            )

            //two buttons
          ],
        ),
      ),
    );
  }
}
