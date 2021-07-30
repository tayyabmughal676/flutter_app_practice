import 'package:flutter/material.dart';
import 'package:flutter_provider/screens/FirstScreen.dart';
import 'package:flutter_provider/screens/FourthScreen.dart';
import 'package:flutter_provider/screens/SecondScreen.dart';
import 'package:flutter_provider/screens/ThirdScreen.dart';
import 'package:page_transition/page_transition.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Types"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
                child: Text(
              "Go and Visit Provider's",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: FirstScreen(), type: PageTransitionType.fade));
              },
              child: Text("Provider")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: SecondScreen(), type: PageTransitionType.fade));
              },
              child: Text("Change Notifier Provider")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: ThirdScreen(), type: PageTransitionType.fade));
              },
              child: Text("Multi Provider")),
          ElevatedButton(onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: FourthScreen(), type: PageTransitionType.fade));

          }, child: Text("Proxy Provider")),
          // ElevatedButton(
          //     onPressed: () {}, child: Text("Change Notifier Proxy Provider")),
        ],
      ),
    );
  }
}
