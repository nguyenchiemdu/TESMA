import 'package:flutter/material.dart';
import 'package:tesma/views/main_screens/notification_screen/notification_screen.dart';
import 'package:tesma/views/main_screens/user_profile_screen/user_profile_screen.dart';
import 'package:tesma/views/main_screens/qr_scan_screen/qr_scan_screen.dart';
import 'package:tesma/views/main_screens/search_screen/search_screen.dart';
import './home_screen/home_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //track the index of our currently selected tab
  int _currentIndex = 0;
  //a list of widgets that wewant to render based on the currently selected tab
  final List<Widget> _children = [
    // PlaceholderWidget(Colors.white),
    HomeScreen(),
    Search(),
    QrScan(),
    NotificationScreens(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
            child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: _children[_currentIndex],
            ),
          ],
        )),
        //color: Colors.yellow,
        //height: 40,
        //width: 20,
        //child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.black87,
        items: [
          //Expanded(child: child)
          new BottomNavigationBarItem(
            icon: Icon(Icons.house_rounded),
            label: 'Home',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.manage_search_rounded),
            label: 'Search',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_rounded),
            label: 'QR',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.doorbell_rounded),
            label: ('Notification'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'List',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
