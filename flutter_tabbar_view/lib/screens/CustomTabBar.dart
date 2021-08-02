import 'package:flutter/material.dart';
import 'package:flutter_tabbar_view/models/ProviderModel.dart';
import 'package:flutter_tabbar_view/screens/FeedScreen.dart';
import 'package:flutter_tabbar_view/screens/HomeScreen.dart';
import 'package:flutter_tabbar_view/screens/SettingScreen.dart';
import 'package:flutter_tabbar_view/screens/UserScreen.dart';
import 'package:provider/provider.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  List<Widget> mTabList = [
    HomeScreen(),
    FeedScreen(),
    UserScreen(),
    SettingScreen()
  ];

  double _tabPadding = 26.0;
  bool _isHome = true;
  bool _isFeed = false;
  bool _isUser = false;
  bool _isSetting = false;

  late ProviderModel _providerModel;

  @override
  void initState() {
    _providerModel = ProviderModel();

    // _providerModel = Provider.of(context)

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderModel(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 52.0),
          child: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(22.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _tabPadding),
                      child: Consumer<ProviderModel>(
                        builder: (context, provider, child) {
                          return GestureDetector(
                            onTap: () {
                              print("Home");
                              setState(() {
                                _isHome = !_isHome;
                                _isFeed = false;
                                _isUser = false;
                                _isSetting = false;
                                provider.setCurrentIndex(0);
                              });
                            },
                            child: Text(
                              "Home",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _isHome ? Colors.blue : Colors.black),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _tabPadding),
                      child: Consumer<ProviderModel>(
                        builder: (context, provider, child) {
                          return GestureDetector(
                            onTap: () {
                              print("Feed");
                              setState(() {
                                _isFeed = !_isFeed;
                                _isHome = false;
                                _isUser = false;
                                _isSetting = false;
                                provider.setCurrentIndex(1);
                              });
                            },
                            child: Text(
                              "Feed",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _isFeed ? Colors.blue : Colors.black),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _tabPadding),
                      child: Consumer<ProviderModel>(
                        builder: (context, provider, child) {
                          return GestureDetector(
                            onTap: () {
                              print("User");
                              setState(() {
                                _isUser = !_isUser;
                                _isFeed = false;
                                _isHome = false;
                                _isSetting = false;
                                provider.setCurrentIndex(2);
                              });
                            },
                            child: Text(
                              "User",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _isUser ? Colors.blue : Colors.black),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _tabPadding),
                      child: Consumer<ProviderModel>(
                        builder: (context, provider, child) {
                          return GestureDetector(
                            onTap: () {
                              print("Setting");
                              setState(() {
                                _isSetting = !_isSetting;
                                _isFeed = false;
                                _isUser = false;
                                _isHome = false;
                                provider.setCurrentIndex(3);
                              });
                            },
                            child: Text(
                              "Setting",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      _isSetting ? Colors.blue : Colors.black),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Expanded(child: Container(
                child: Consumer<ProviderModel>(
                  builder: (context, provider, child) {
                    return Center(child: mTabList[provider.mIndex]);
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
