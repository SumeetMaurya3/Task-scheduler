import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoapp/utils/dialog_box.dart';
import 'package:todoapp/utils/todo_tile.dart'; // Import your TodoTile here

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();
  List<List<dynamic>> todoList = [

  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = value ?? false;
    });
  }

  void saveNewTask(){
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel:  ()=> Navigator.of(context).pop(),
          );
      },
      );
  }

  void deletetask(int index){
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text('TodoApp',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: const Color.fromARGB(255, 124, 240, 255),
        elevation: 0.0,
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
            ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 120, 255, 255),
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){

            },
          child: Container(
          margin: EdgeInsets.all(20),
          alignment: Alignment.center,
          width: 20,
          child: SvgPicture.asset(
            'assets/icons/dots.svg',
            height: 20,
            width: 20,
            ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 129, 255, 255),
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add ),
        ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deletetask(index),
          );
        },
      ),
    );
  }
}
