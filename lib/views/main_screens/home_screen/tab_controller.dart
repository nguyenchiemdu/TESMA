import 'package:flutter/material.dart';
import 'package:tesma/constants/size_config.dart';

import 'package:tesma/views/classes_screen/qr_class.dart';
import 'package:tesma/views/main_screens/home_screen/class_info.dart';

class TabControllerScreen extends StatefulWidget {
  @override
  _TabControllerScreenState createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget _getTabBar() {
    return TabBar(
      tabs: <Widget>[
        Container(
            height: 7 * SizeConfig.heightMultiplier,
            child: Tab(icon: Icon(Icons.home, color: Colors.redAccent))),
        Container(
            height: 7 * SizeConfig.heightMultiplier,
            child: Tab(icon: Icon(Icons.settings, color: Colors.redAccent))),
        Container(
            height: 7 * SizeConfig.heightMultiplier,
            child: Tab(icon: Icon(Icons.ring_volume, color: Colors.redAccent))),
        Container(
            height: 7 * SizeConfig.heightMultiplier,
            child: Tab(icon: Icon(Icons.car_rental, color: Colors.redAccent))),
      ],
      controller: tabController,
    );
  }

  Widget _getTabBarView(tabs) {
    return Container(
      height: 100 * SizeConfig.heightMultiplier,
      child: TabBarView(
        children: tabs,
        controller: tabController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          _getTabBar(),
          SingleChildScrollView(
            child: Container(
              child: _getTabBarView(
                <Widget>[
                  ClassInfoScreen(),
                  QrClass(),
                  Icon(Icons.ring_volume),
                  Icon(Icons.car_rental),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
