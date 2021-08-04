import 'package:flutter/material.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:tesma/views/main_screens/home_screen/home_screen.dart';

class ClassInfoScreen extends StatefulWidget {
  @override
  _ClassInfoScreenState createState() => _ClassInfoScreenState();
}

class _ClassInfoScreenState extends State<ClassInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Scaffold(
          body: SingleChildScrollView(
              child: Container(
                  height: 120 * SizeConfig.heightMultiplier,
                  // width: 100 * SizeConfig.widthMultiplier,
                  child: Column(children: [
                    // Container(
                    //   height: 38.9,
                    // ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15),
                    //     image: new DecorationImage(
                    //       image: AssetImage(
                    //         'images/montoan.png',
                    //       ),
                    //       fit: BoxFit.fitWidth,
                    //     ),
                    //   ),
                    //   height: 21.2 * SizeConfig.heightMultiplier,
                    //   //width: 77.2 * SizeConfig.widthMultiplier,
                    // ),
                    // Container(
                    //   height: 10.7 * SizeConfig.heightMultiplier,
                    //   child: Center(
                    //     child: Text(
                    //       'Class 10 Math',
                    //       style: TextStyle(
                    //         color: Color(0xff181a54),
                    //         fontSize: 32,
                    //         fontFamily: 'SegoeUI',
                    //         fontWeight: FontWeight.w900,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         child: Container(
                    //           child: Icon(
                    //             Icons.add,
                    //             color: Colors.white,
                    //             size: 4 * SizeConfig.heightMultiplier,
                    //           ),
                    //           height: 3.68 * SizeConfig.heightMultiplier,
                    //           margin: EdgeInsets.only(
                    //             left: 8 * SizeConfig.widthMultiplier,
                    //             right: 9.1 * SizeConfig.widthMultiplier,
                    //           ),
                    //         ),
                    //         width: 25 * SizeConfig.widthMultiplier,
                    //         height: 7 * SizeConfig.heightMultiplier,
                    //         decoration: BoxDecoration(
                    //           color: Color(0xfffff35f),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: Icon(
                    //           Icons.add,
                    //           color: Colors.redAccent,
                    //           size: 4 * SizeConfig.heightMultiplier,
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: Icon(
                    //           Icons.add,
                    //           color: Colors.redAccent,
                    //           size: 4 * SizeConfig.heightMultiplier,
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: Icon(
                    //           Icons.add,
                    //           color: Colors.redAccent,
                    //           size: 4 * SizeConfig.heightMultiplier,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    //   height: 7 * SizeConfig.heightMultiplier,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     border: Border.all(
                    //       color: Color(0xfffff35f),
                    //       width: 1,
                    //     ),
                    //   ),
                    // ),
                    Container(
                      height: 7.5 * SizeConfig.heightMultiplier,
                      width: 55.6 * SizeConfig.widthMultiplier,
                      margin: EdgeInsets.only(
                          left: 16.4 * SizeConfig.widthMultiplier,
                          top: 2.9 * SizeConfig.heightMultiplier,
                          right: 28 * SizeConfig.widthMultiplier),
                      child: Text(
                        'Already starts Jun 21, 2021',
                        style: TextStyle(
                          color: Color(0xff181a54),
                          fontSize: 16,
                          fontFamily: 'SegoeUI',
                        ),
                      ),
                    ),
                    Container(
                      width: 100 * SizeConfig.widthMultiplier,
                      height: 4.6 * SizeConfig.heightMultiplier,
                      child: Row(
                        children: [
                          Container(
                            height: 2.6 * SizeConfig.heightMultiplier,
                            width: 8.3 * SizeConfig.widthMultiplier,
                          ),
                          Container(
                            height: 2.6 * SizeConfig.heightMultiplier,
                            width: 5.6 * SizeConfig.widthMultiplier,
                            //margin: EdgeInsets.only(left: 8.3 * SizeConfig.widthMultiplier),
                            child: Icon(
                              Icons.add,
                              color: Colors.red,
                              size: 4 * SizeConfig.heightMultiplier,
                            ),
                          ),
                          Container(
                            height: 2.6 * SizeConfig.heightMultiplier,
                            width: 3.9 * SizeConfig.widthMultiplier,
                          ),
                          Container(
                            width: 73.3 * SizeConfig.widthMultiplier,
                            height: 2.8 * SizeConfig.heightMultiplier,
                            // margin:
                            //     EdgeInsets.only(left: 17.8 * SizeConfig.widthMultiplier),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Created by',
                                    style: TextStyle(
                                      color: Color(0xff181a54),
                                      fontSize: 16,
                                      fontFamily: 'SegoeUI',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '  ',
                                    style: TextStyle(
                                      color: Color(0xff181a54),
                                      fontSize: 16,
                                      fontFamily: 'SegoeUI',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Le Dinh Nhat',
                                    style: TextStyle(
                                      color: Color(0xff181a54),
                                      fontSize: 16,
                                      fontFamily: 'SegoeUI',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              style: TextStyle(
                                color: Color(0xff181a54),
                                fontSize: 16,
                                fontFamily: 'SegoeUI',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100 * SizeConfig.widthMultiplier,
                      height: 4.6 * SizeConfig.heightMultiplier,
                      child: Row(
                        children: [
                          Container(
                            height: 2.6 * SizeConfig.heightMultiplier,
                            width: 8.3 * SizeConfig.widthMultiplier,
                          ),
                          Container(
                            height: 2.6 * SizeConfig.heightMultiplier,
                            width: 5.6 * SizeConfig.widthMultiplier,
                            //margin: EdgeInsets.only(left: 8.3 * SizeConfig.widthMultiplier),
                            child: Icon(
                              Icons.add,
                              color: Colors.red,
                              size: 4 * SizeConfig.heightMultiplier,
                            ),
                          ),
                          Container(
                            height: 2.6 * SizeConfig.heightMultiplier,
                            width: 3.9 * SizeConfig.widthMultiplier,
                          ),
                          Container(
                            width: 73.3 * SizeConfig.widthMultiplier,
                            height: 2.8 * SizeConfig.heightMultiplier,
                            // margin:
                            //     EdgeInsets.only(left: 17.8 * SizeConfig.widthMultiplier),
                            child: Text(
                              'Mon.Wed.Fri - 19:00',
                              style: TextStyle(
                                color: Color(0xff181a54),
                                fontSize: 16,
                                fontFamily: 'SegoeUI',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100 * SizeConfig.widthMultiplier,
                      height: 4.6 * SizeConfig.heightMultiplier,
                      child: Row(
                        children: [
                          Container(
                            height: 2.6 * SizeConfig.heightMultiplier,
                            width: 8.3 * SizeConfig.widthMultiplier,
                          ),
                          Container(
                            height: 2.6 * SizeConfig.heightMultiplier,
                            width: 5.6 * SizeConfig.widthMultiplier,
                            //margin: EdgeInsets.only(left: 8.3 * SizeConfig.widthMultiplier),
                            child: Icon(
                              Icons.add,
                              color: Colors.red,
                              size: 4 * SizeConfig.heightMultiplier,
                            ),
                          ),
                          Container(
                            height: 2.6 * SizeConfig.heightMultiplier,
                            width: 3.9 * SizeConfig.widthMultiplier,
                          ),
                          Container(
                            width: 73.3 * SizeConfig.widthMultiplier,
                            height: 2.8 * SizeConfig.heightMultiplier,
                            // margin:
                            //     EdgeInsets.only(left: 17.8 * SizeConfig.widthMultiplier),
                            child: Text(
                              '250.000VND/month',
                              style: TextStyle(
                                color: Color(0xffef4874),
                                fontSize: 16,
                                fontFamily: 'SegoeUI',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100 * SizeConfig.widthMultiplier,
                      height: 4.6 * SizeConfig.heightMultiplier,
                      child: Row(
                        children: [
                          Container(
                            height: 2.6 * SizeConfig.heightMultiplier,
                            width: 8.3 * SizeConfig.widthMultiplier,
                          ),
                          Container(
                            height: 2.6 * SizeConfig.heightMultiplier,
                            width: 5.6 * SizeConfig.widthMultiplier,
                            //margin: EdgeInsets.only(left: 8.3 * SizeConfig.widthMultiplier),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Colors.red,
                              size: 4 * SizeConfig.heightMultiplier,
                            ),
                          ),
                          Container(
                            height: 2.6 * SizeConfig.heightMultiplier,
                            width: 3.9 * SizeConfig.widthMultiplier,
                          ),
                          Container(
                            width: 73.3 * SizeConfig.widthMultiplier,
                            height: 2.8 * SizeConfig.heightMultiplier,
                            // margin:
                            //     EdgeInsets.only(left: 17.8 * SizeConfig.widthMultiplier),
                            child: Text(
                              '235 Tran Cao Van street, An Son ward',
                              style: TextStyle(
                                color: Color(0xff181a54),
                                fontSize: 16,
                                fontFamily: 'SegoeUI',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 3.8 * SizeConfig.heightMultiplier,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 8.3 * SizeConfig.widthMultiplier,
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 4.47 * SizeConfig.widthMultiplier),
                          child: Text(
                            'Feedback Rating',
                            style: TextStyle(
                              color: Color(0xff181a54),
                              fontSize: 16,
                              fontFamily: 'SegoeUI',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 1.98 * SizeConfig.heightMultiplier,
                    ),
                    Container(
                      height: 4.6 * SizeConfig.heightMultiplier,
                      child: Row(
                        children: [
                          Container(
                            width: 8.3 * SizeConfig.widthMultiplier,
                          ),
                          Container(
                            child: Icon(
                              Icons.person,
                              color: Colors.red,
                              size: 4 * SizeConfig.heightMultiplier,
                            ),
                            height: 4.6 * SizeConfig.heightMultiplier,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffe5e8fb),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(3.5),
                            ),
                          ),
                          Container(
                            width: 3.6 * SizeConfig.widthMultiplier,
                          ),
                          Container(
                            child: Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 4 * SizeConfig.heightMultiplier,
                            ),
                            height: 3.3 * SizeConfig.heightMultiplier,
                            width: 6.9 * SizeConfig.widthMultiplier,
                            // margin: EdgeInsets.only(
                            //   left: 48,
                            //   right: 48,
                            // ),
                            decoration: BoxDecoration(
                              color: Color(0xffc4c4c4),
                            ),
                          ),
                          Container(
                            width: 0.83 * SizeConfig.widthMultiplier,
                          ),
                          Container(
                            child: Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 4 * SizeConfig.heightMultiplier,
                            ),
                            height: 3.3 * SizeConfig.heightMultiplier,
                            width: 6.9 * SizeConfig.widthMultiplier,
                            // margin: EdgeInsets.only(
                            //   left: 48,
                            //   right: 48,
                            // ),
                            decoration: BoxDecoration(
                              color: Color(0xffc4c4c4),
                            ),
                          ),
                          Container(
                            width: 0.83 * SizeConfig.widthMultiplier,
                          ),
                          Container(
                            child: Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 4 * SizeConfig.heightMultiplier,
                            ),
                            height: 3.3 * SizeConfig.heightMultiplier,
                            width: 6.9 * SizeConfig.widthMultiplier,
                            // margin: EdgeInsets.only(
                            //   left: 48,
                            //   right: 48,
                            // ),
                            decoration: BoxDecoration(
                              color: Color(0xffc4c4c4),
                            ),
                          ),
                          Container(
                            width: 0.83 * SizeConfig.widthMultiplier,
                          ),
                          Container(
                            child: Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 4 * SizeConfig.heightMultiplier,
                            ),
                            height: 3.3 * SizeConfig.heightMultiplier,
                            width: 6.9 * SizeConfig.widthMultiplier,
                            // margin: EdgeInsets.only(
                            //   left: 48,
                            //   right: 48,
                            // ),
                            decoration: BoxDecoration(
                              color: Color(0xffc4c4c4),
                            ),
                          ),
                          Container(
                            width: 0.83 * SizeConfig.widthMultiplier,
                          ),
                          Container(
                            child: Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 4 * SizeConfig.heightMultiplier,
                            ),
                            height: 3.3 * SizeConfig.heightMultiplier,
                            width: 6.9 * SizeConfig.widthMultiplier,
                            // margin: EdgeInsets.only(
                            //   left: 48,
                            //   right: 48,
                            // ),
                            decoration: BoxDecoration(
                              color: Color(0xffc4c4c4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 3 * SizeConfig.heightMultiplier,
                    ),
                    Row(
                      children: [
                        Container(width: 8.3 * SizeConfig.widthMultiplier),
                        Container(
                          height: (21 / 7.6) * SizeConfig.heightMultiplier,
                          //margin: EdgeInsets.only(left: 3.94 * SizeConfig.widthMultiplier),
                          child: Text(
                            'Comment',
                            style: TextStyle(
                              color: Color(0xff181a54),
                              fontSize: 16,
                              fontFamily: 'SegoeUI',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 3.8 * SizeConfig.heightMultiplier,
                    ),
                    Container(
                      height: (35 / 7.6) * SizeConfig.heightMultiplier,
                      child: Row(
                        children: [
                          Container(
                            width: 8.3 * SizeConfig.widthMultiplier,
                          ),
                          Container(
                            height: (35 / 7.6) * SizeConfig.heightMultiplier,
                            width: (35 / 3.6) * SizeConfig.widthMultiplier,
                            child: Icon(Icons.person),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffe5e8fb),
                                //width: 1 * SizeConfig.widthMultiplier,
                              ),
                              borderRadius: BorderRadius.circular(3.5),
                            ),
                          ),
                          Container(
                            width: 13 / 3.6 * SizeConfig.widthMultiplier,
                          ),
                          Container(
                            height: (30 / 7.6) * SizeConfig.heightMultiplier,
                            width: 250 / 3.6 * SizeConfig.widthMultiplier,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(
                                color: Color(0xffc4c4c4),
                                //width: 1 * SizeConfig.widthMultiplier,
                              ),
                              borderRadius: BorderRadius.circular(3.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 39.9 / 7.6 * SizeConfig.heightMultiplier,
                    ),
                    Container(
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              'Back',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'SegoeUI',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      height: 32 / 7.6 * SizeConfig.heightMultiplier,
                      width: 126 / 3.6 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                        color: Color(0xfff74b46),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ]))),
        );
      });
    });
  }
}
