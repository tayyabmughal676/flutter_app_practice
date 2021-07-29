import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _width = 200.0;
  double _height = 200.0;
  var _color = Colors.deepOrange;

  Tween<double> _scaleTween = Tween<double>(begin: 0.2, end: 0.9);

  ColorTween _colorTween = ColorTween(begin: Colors.deepOrange, end: Colors.lightBlue);

  _updateState() {
    setState(() {
      _width = 300;
      _height = 300;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 600),
          tween: _scaleTween,
          builder: (context, scale, child){
            return Transform.scale(scale: scale, child: child,);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _updateState();
                },
                child: Text("Click Me"),
              ),
              Container(
                width: _width,
                height: _height,
                color: _color,
                child: Center(
                    child: Text(
                  "Animation",
                  style: Theme.of(context).textTheme.headline5,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
