import 'package:flutter/material.dart';
import 'package:flutter_provider/screens/FourthScreen.dart';
import 'package:page_transition/page_transition.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(child: Text("Hello, I'm Third")),
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: FourthScreen(), type: PageTransitionType.fade));
              },
              child: Text("Go Fourth")),
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
