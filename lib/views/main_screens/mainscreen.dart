// ở đây mình sẽ viết cái khung của màn hình chính, và thanh điều hướng, .....
import 'package:flutter/material.dart';
import 'package:tesma/views/classes_screen/qr_class.dart';
import 'package:tesma/views/login_screens/home_screen_logintest.dart';
import './home_screen/home_screen.dart';
import 'placeholder_widget.dart';
import 'user_profile_screen/user_profile_screen.dart';

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
    PlaceholderWidget(Colors.deepOrange),
    QrClass(),
    PlaceholderWidget(Colors.red),
    UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.black87,
        items: [
          //Expanded(child: child)
          new BottomNavigationBarItem(
            icon: Icon(Icons.house_rounded),
            title: Text('home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.manage_search_rounded),
            title: Text('search'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_rounded),
            title: Text('qr'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.doorbell_rounded),
            title: Text('notification'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            title: Text('list'),
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
