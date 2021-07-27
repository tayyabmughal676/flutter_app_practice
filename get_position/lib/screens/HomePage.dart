import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final List<String> items = List<String>.generate(40, (i) => 'Item $i');

  Future<void> setPositionVal(value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("last_position_index", value);
  }

  Future<void> setScrollValue(value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setDouble("last_scroll_position", value);
  }

  ScrollController _scrollController = ScrollController();
  late double _scrollPosition;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
      // print(_scrollPosition);
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    _scrollController.addListener(_scrollListener);
    // getPositionVal();
    getScrollValue();
    super.initState();
  }

  getPositionVal() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int? myVal = pref.getInt("last_position_index");
    print("Pref value is: $myVal");
  }

  getScrollValue() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var scrollVal = pref.getDouble("last_scroll_position");
    _scrollController.animateTo(scrollVal!,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
    print("Pref Scroll Value is: $scrollVal");
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.addObserver(this);
    setScrollValue(_scrollPosition);
    print("Dispose: $_scrollPosition");
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        print("Paused: $state");

        if (_scrollPosition != null) {
          setScrollValue(_scrollPosition);
        }
        break;
      case AppLifecycleState.resumed:
        getPositionVal();
        print("Resumed: $state");
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: ListView.builder(
          itemCount: items.length,
          controller: _scrollController,
          key: PageStorageKey<String>("currentPosition"),
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20.0),
              padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                leading: Icon(Icons.schedule_outlined),
                title: Text(items[index]),
                subtitle: Text("Save My Position"),
                trailing: Text("Current"),
                onTap: () {
                  print("Tapped: $index");
                  setPositionVal(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void scrollToLastPosition(double scrollPosition) {
    final double lastPosition = scrollPosition;
    print("scrollToLastPosition: $scrollPosition");

    // _scrollController.jumpTo(lastPosition);
    _scrollController.animateTo(lastPosition,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
  }
}
