import 'package:flutter/material.dart';
import 'package:flutter_tabbar_view/screens/FeedScreen.dart';
import 'package:flutter_tabbar_view/screens/HomeScreen.dart';
import 'package:flutter_tabbar_view/screens/SettingScreen.dart';
import 'package:flutter_tabbar_view/screens/UserScreen.dart';

class TabViewScreen extends StatefulWidget {
  const TabViewScreen({Key? key}) : super(key: key);

  @override
  _TabViewScreenState createState() => _TabViewScreenState();
}

class _TabViewScreenState extends State<TabViewScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 45.0),
        child: Column(
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(22.0)),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    color: Colors.blueAccent),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: "Home",
                  ),
                  Tab(
                    text: "Feed",
                  ),
                  Tab(
                    text: "User",
                  ),
                  Tab(
                    text: "Setting",
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                HomeScreen(),
                FeedScreen(),
                UserScreen(),
                SettingScreen()
              ],
            ))
          ],
        ),
      ),
    );
  }
}
