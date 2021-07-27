import 'package:flutter/material.dart';
import 'package:flutter_notes/database/database_helper.dart';
import 'package:flutter_notes/models/Task.dart';
import 'package:flutter_notes/models/Todo.dart';

class TaskPage extends StatefulWidget {
  late final Task task;

  TaskPage({required this.task});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  String _taskTitle = "";

  @override
  void initState() {
    if (widget.task.id != null) {
      _taskTitle = widget.task.title!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 24.0, bottom: 6.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          print("Clicked Back Button");
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Image(
                              image: AssetImage(
                                  'assets/images/back_arrow_icon.png')),
                        ),
                      ),
                      Expanded(
                          child: TextField(
                        onSubmitted: (value) async {
                          print("Field Value: $value");

                          // check if textField isn't empty
                          if (value != "") {
                            //check if task is null
                            if (widget.task.id == null) {
                              DatabaseHelper _dbHelper = DatabaseHelper();

                              Task _newTask = Task(title: value);
                              await _dbHelper.insertTask(_newTask);

                              print("Task Added");
                            } else {
                              print("Update existing task");
                            }
                          }
                        },
                        controller: TextEditingController()..text = _taskTitle,
                        decoration: InputDecoration(
                            hintText: "Enter Note Title...",
                            border: InputBorder.none),
                        style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF211551)),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter Note Description...",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 24.0)),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: [
                          Container(
                              width: 20.0,
                              height: 20.0,
                              margin: EdgeInsets.only(right: 12.0),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(6.0),
                                  border: Border.all(
                                      color: Color(0xFF86829D), width: 1.5)),
                              child: Image(
                                image: AssetImage(
                                  'assets/images/check_icon.png',
                                ),
                              )),
                          Expanded(
                              child: TextField(
                            onSubmitted: (value) async {
                              print("Todo: $value");

                              // check if textField isn't empty
                              if (value != "") {
                                //check if task is null
                                if (widget.task.id == null) {
                                  DatabaseHelper _dbHelper = DatabaseHelper();

                                  Todo _newTodo = Todo(
                                      title: value,
                                      id: 0,
                                      isDone: 0,
                                      taskId: widget.task.id ?? 0);

                                  print("Todo Model: ${_newTodo.taskId}");

                                  await _dbHelper.insertTodo(_newTodo);

                                  print("Todo Added $value");
                                } else {
                                  print("Update existing Todo");
                                }
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Enter Todo Item...",
                                border: InputBorder.none),
                          ))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Positioned(
              bottom: 24.0,
              right: 24.0,
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => TaskPage()));
                },
                child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        color: Color(0xFFFE3577),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Image(
                      image: AssetImage('assets/images/delete_icon.png'),
                    )),
              ),
            )
          ],
        )),
      ),
    );
  }
}
