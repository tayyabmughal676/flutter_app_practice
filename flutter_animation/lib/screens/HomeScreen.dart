import 'package:flutter/material.dart';
import 'package:flutter_animation/models/SingleScreenModel.dart';
import 'package:flutter_animation/routes/MyRoutes.dart';
import 'package:flutter_animation/screens/SingleScreen.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imageUrl =
      "https://media.wired.com/photos/59fb679f8e9fc3082a139c11/master/w_2240,c_limit/Thor-MainArt.jpg";
  double _width = 200.0;
  double _height = 200.0;
  var _color = Colors.deepOrange;
  bool _isAnimated = true;

  // Use For Update Width & Height values
  _updateState() {
    setState(() {
      _width = 300.0;
      _height = 300.0;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Animations"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _updateState();
                _isAnimated = !_isAnimated;
                // Navigator.pushNamed(context, MyRoutes.singleScreenRoute,
                //     arguments: SingleScreenModel("Dogar", _isAnimated));
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        duration: Duration(milliseconds: 1050),
                        child: SingleScreen(name: "God of Thunder",)));
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 800),
                width: _isAnimated ? _width : 200.0,
                height: _isAnimated ? _height : 200.0,
                decoration: BoxDecoration(
                  borderRadius: _isAnimated
                      ? BorderRadius.circular(30.0)
                      : BorderRadius.circular(5.0),
                  image: DecorationImage(
                      image: NetworkImage(
                          imageUrl),
                      fit: BoxFit.fill),
                  color: _isAnimated ? _color : Colors.lightBlue,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 900),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: Text(
                    "I'm Thor, God of Thunder!",
                    style: TextStyle(
                        fontSize: _isAnimated ? 22.0 : 14.0,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
