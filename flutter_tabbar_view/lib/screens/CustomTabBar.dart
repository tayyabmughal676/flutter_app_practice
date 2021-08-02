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

  late ProviderModel _providerModel;

  @override
  void initState() {
    _providerModel = ProviderModel();

    // _providerModel = Provider.of(context)

    _providerModel.init(context: context, index: 0);

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
                              provider.isHome = !provider.isHome;
                              provider.isFeed = false;
                              provider.isUser = false;
                              provider.isSetting = false;
                              provider.setCurrentIndex(0);
                            },
                            child: Text(
                              "Home",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: provider.isHome
                                      ? Colors.blue
                                      : Colors.black),
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
                              provider.isFeed = !provider.isFeed;
                              provider.isHome = false;
                              provider.isUser = false;
                              provider.isSetting = false;
                              provider.setCurrentIndex(1);
                            },
                            child: Text(
                              "Feed",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: provider.isFeed
                                      ? Colors.blue
                                      : Colors.black),
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
                              provider.isUser = !provider.isUser;
                              provider.isFeed = false;
                              provider.isHome = false;
                              provider.isSetting = false;
                              provider.setCurrentIndex(2);
                            },
                            child: Text(
                              "User",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: provider.isUser
                                      ? Colors.blue
                                      : Colors.black),
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
                              provider.isSetting = !provider.isSetting;
                              provider.isFeed = false;
                              provider.isUser = false;
                              provider.isHome = false;
                              provider.setCurrentIndex(3);
                            },
                            child: Text(
                              "Setting",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: provider.isSetting
                                      ? Colors.blue
                                      : Colors.black),
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
