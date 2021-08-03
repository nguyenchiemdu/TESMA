import 'package:flutter/material.dart';
import 'package:tesma/views/main_screens/home_screen/tab_controller.dart';

import 'package:tesma/constants/size_config.dart';

class MyClassPage extends StatefulWidget {
  @override
  _MyClassPageState createState() => _MyClassPageState();
}

class _MyClassPageState extends State<MyClassPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Scaffold(
          body: Container(
              // height: 100 * SizeConfig.heightMultiplier,
              // width: 100 * SizeConfig.widthMultiplier,
              child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(children: [
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
                height: 21.2 * SizeConfig.heightMultiplier,
                //width: 77.2 * SizeConfig.widthMultiplier,
              ),
              Container(
                height: 10.7 * SizeConfig.heightMultiplier,
                child: Center(
                  child: Text(
                    'Class 10 Math',
                    style: TextStyle(
                      color: Color(0xff181a54),
                      fontSize: 32,
                      fontFamily: 'SegoeUI',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: TabControllerScreen(),
                  height: 100 * SizeConfig.heightMultiplier,
                ),
              ),
              // Container(
              //   child: TabControllerScreen(),
              //   height: 7 * SizeConfig.heightMultiplier,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     border: Border.all(
              //       color: Color(0xfffff35f),
              //       // width: 1,
              //     ),
              //   ),
              // ),
            ]),
          )),
        );
      });
    });
  }
}
