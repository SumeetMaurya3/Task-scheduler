import 'package:flutter/material.dart';
import 'package:todoapp/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave; 
  VoidCallback onCancel;

  DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 159, 215, 255),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          // get user input
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter Task",
            )
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            MyButton(text: "Save", onPressed: onSave),
            const SizedBox(width: 15),
            MyButton(text: "Cancel", onPressed: onCancel),
          ],)
        ],)
        )
    );
  }
}