import 'package:flutter/material.dart';
import 'package:flutter_animation/models/SingleScreenModel.dart';

class SingleScreen extends StatefulWidget {
  final String? name;

  SingleScreen({Key? key, this.name}) : super(key: key);

  @override
  _SingleScreenState createState() => _SingleScreenState();
}

class _SingleScreenState extends State<SingleScreen> {
  late bool _isAnimated;
  double _width = 200.0;
  double _height = 200.0;

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
  void dispose() {
    _isAnimated = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as SingleScreenModel;
    //
    // print("isAnimated: ${args.isAnimated}");
    //
    // _isAnimated = args.isAnimated;

    // ${args.userName}

    return Scaffold(
      appBar: AppBar(
        title: Text("Single Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 1100),
                  width: 400.0,
                  height: 400.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://wallpapercave.com/wp/wp8831547.jpg"),
                        fit: BoxFit.fill),
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "My Name is: ${widget.name}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
