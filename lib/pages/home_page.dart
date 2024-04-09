import 'package:flutter/material.dart';
import 'package:to_do_app_mitch_version/util/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Text controller
  final MyController = TextEditingController();
  List toDoList = [];

  void onSave() {
    setState(() {
      toDoList.add([MyController.text,false]);
      MyController.clear();
    });
    Navigator.of(context).pop();
  }


  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void checkBoxChanged (bool? value,int index) {
    setState(() {
      toDoList[index][1] = value;
    });
  }
  void createTask() {
    showDialog(context: context, builder: (context){
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          padding: EdgeInsets.all(20),
          height: 150,
          color: Colors.pink[400],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                controller: MyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new task"
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: onSave,
                  child: Text("Submit"),
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 5,),
                MaterialButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancel"),
                  color: Theme.of(context).primaryColor,
                )
              ],
            )
            ],
          ),
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      appBar: AppBar(
        title: Text("To Do"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
            delete: (context) => deleteTask(index),
            taskName: toDoList[index][0],
            onChanged: (value) => checkBoxChanged(value,index),
            taskCompleted: toDoList[index][1]
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: Icon(Icons.add),
      ),
    );
  }
}