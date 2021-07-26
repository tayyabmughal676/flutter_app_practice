import 'package:flutter/material.dart';
import 'package:flutter_notes/database/database_helper.dart';
import 'package:flutter_notes/models/Task.dart';
import 'package:flutter_notes/widgets.dart';
import 'package:oktoast/oktoast.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
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

                          if (value != "") {
                            DatabaseHelper _dbHelper = DatabaseHelper();

                            Task _newTask = Task(title: value);
                            await _dbHelper.insertTask(_newTask);

                            print("Task Added");

                          }
                        },
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
                TodoWidget(
                  text: "Create your First Note.",
                  isDone: true,
                ),
                TodoWidget(
                  isDone: true,
                ),
                TodoWidget(
                  isDone: false,
                ),
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
