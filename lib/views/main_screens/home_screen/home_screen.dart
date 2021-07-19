import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesma/views/classes_screen/InputClass_screen.dart';
import '../../../models/firebase_authen.dart';
import 'package:tesma/views/regis_screens/size_config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> listClass = [];
  void reRender(Map<String, dynamic> classItem) {
    List<Widget> temp = listClass;
    temp.add(

        //---------------------
        Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: new DecorationImage(
                image: AssetImage(
                  'images/montoan.png',
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            height: 12.5 * SizeConfig.heightMultiplier,
            width: 77.2 * SizeConfig.widthMultiplier,
          ),
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 8.5 * SizeConfig.widthMultiplier,
                      top: 1.3 * SizeConfig.heightMultiplier),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tues.Thus.Sat - 15:00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'SegoeUI',
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      EdgeInsets.only(left: 8.5 * SizeConfig.widthMultiplier),
                  child: Text(
                    classItem['className'],
                    style: TextStyle(
                      color: Color(0xff181a54),
                      fontSize: 24,
                      fontFamily: 'SegoeUI',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 8.5 * SizeConfig.widthMultiplier,
                      ),
                      child: Text(
                        'Next lesson:',
                        style: TextStyle(
                          color: Color(0xffef4874),
                          fontSize: 8,
                          fontFamily: 'SegoeUI',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 1.84 * SizeConfig.widthMultiplier),
                      child: Text(
                        'Sat, 17 Jul, 2021',
                        style: TextStyle(
                          color: Color(0xffef4874),
                          fontSize: 8,
                          fontFamily: 'SegoeUI',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      height: 25 * SizeConfig.heightMultiplier,
      width: 77.2 * SizeConfig.widthMultiplier,
      margin: EdgeInsets.only(
        bottom: 1.5 * SizeConfig.heightMultiplier,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
    ));
    //---------------------

    setState(() {
      listClass = temp;
    });
    print(listClass);
  }

  Widget singleClass() {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: new DecorationImage(
                image: AssetImage(
                  'images/montoan.png',
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            height: 12.5 * SizeConfig.heightMultiplier,
            width: 77.2 * SizeConfig.widthMultiplier,
          ),
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 8.5 * SizeConfig.widthMultiplier,
                      top: 1.3 * SizeConfig.heightMultiplier),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tues.Thus.Sat - 15:00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'SegoeUI',
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      EdgeInsets.only(left: 8.5 * SizeConfig.widthMultiplier),
                  child: Text(
                    'Class 12 Physics',
                    style: TextStyle(
                      color: Color(0xff181a54),
                      fontSize: 24,
                      fontFamily: 'SegoeUI',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 8.5 * SizeConfig.widthMultiplier,
                      ),
                      child: Text(
                        'Next lesson:',
                        style: TextStyle(
                          color: Color(0xffef4874),
                          fontSize: 8,
                          fontFamily: 'SegoeUI',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 1.84 * SizeConfig.widthMultiplier),
                      child: Text(
                        'Sat, 17 Jul, 2021',
                        style: TextStyle(
                          color: Color(0xffef4874),
                          fontSize: 8,
                          fontFamily: 'SegoeUI',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      height: 25 * SizeConfig.heightMultiplier,
      width: 77.2 * SizeConfig.widthMultiplier,
      margin: EdgeInsets.only(
        bottom: 1.5 * SizeConfig.heightMultiplier,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
    );
  }

  Color getbackgroudcolor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Color(0xff7243cf);
    }
    return (Colors.orangeAccent);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return Scaffold(
              body: Container(
                color: Color(0xff45228b),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 4.5 * SizeConfig.heightMultiplier),
                      decoration: BoxDecoration(
                        color: Color(0xff181a54),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(35)),
                      ),
                      height: 83 * SizeConfig.heightMultiplier,
                      margin: EdgeInsets.only(
                          top: 16 * SizeConfig.heightMultiplier),
                      child: ListView(
                        padding: EdgeInsets.only(
                          left: 11.4 * SizeConfig.widthMultiplier,
                          right: 11.4 * SizeConfig.widthMultiplier,
                        ),
                        children: listClass,
                        // children: [
                        //   singleClass(),
                        //   singleClass(),
                        //   singleClass(),
                        //   singleClass(),
                        // ],
                      ),
                    ),
                    Positioned(
                      height: 4.2 * SizeConfig.heightMultiplier,
                      top: 13.9 * SizeConfig.heightMultiplier,
                      left: 11.4 * SizeConfig.widthMultiplier,
                      child: Container(
                        width: 36 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                          color: Color(0xff181a54),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Center(
                          child: Text(
                            'My Class',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'SegoeUI',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      height: 4.2 * SizeConfig.heightMultiplier,
                      top: 13.9 * SizeConfig.heightMultiplier,
                      right: 11.4 * SizeConfig.widthMultiplier,
                      child: Container(
                        alignment: Alignment.center,
                        width: 36 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                          color: Color(0xffef4874),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      InputClassScreen(reRender)),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'New Class',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'SegoeUI',
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 4 * SizeConfig.heightMultiplier,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
