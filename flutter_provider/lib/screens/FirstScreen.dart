import 'package:flutter/material.dart';
import 'package:flutter_provider/models/TaskData.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'SecondScreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  getMyTitle(context, index){
    var title = context.watch<TaskData>().listTask[index].title;
    return  title;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue,
          ),
          child: ListView.builder(
              itemCount: context.watch<TaskData>().listTask.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: SecondScreen(),
                            type: PageTransitionType.fade));
                  },
                  title: Text(
                      "${context.watch<TaskData>().listTask[index].title}"),
                  trailing: Checkbox(
                    value: context.watch<TaskData>().listTask[index].isDone,
                    onChanged: (value) {
                      context.read<TaskData>().toggle(index, value);
                      print("$value");
                    },
                  ),
                );
              }),
        ),
      ),
    );
  }
}

// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Container(
// child: Center(child: Text("Hello, I'm First")),
// ),
// SizedBox(
// height: 10.0,
// ),
// ElevatedButton(
// onPressed: () {
// Navigator.push(
// context,
// PageTransition(
// child: SecondScreen(), type: PageTransitionType.fade));
// },
// child: Text("Go Second"))
// ],
// ),
