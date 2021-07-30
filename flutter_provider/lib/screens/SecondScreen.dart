import 'package:flutter/material.dart';
import 'package:flutter_provider/screens/ThirdScreen.dart';
import 'package:page_transition/page_transition.dart';

class SecondScreen extends StatefulWidget {
  final String? getTitle;

  SecondScreen({Key? key, this.getTitle}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(child: Text("Hello, I'm ${widget.getTitle}")),
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: ThirdScreen(), type: PageTransitionType.fade));
              },
              child: Text("Go Third")),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go Back")),
        ],
      ),
    );
  }
}
