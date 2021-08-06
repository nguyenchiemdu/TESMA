import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tesma/constants/color.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:tesma/models/classinf.dart';

class AttendanceScreenTeacher extends StatefulWidget {
  final ClassInf classinf;
  const AttendanceScreenTeacher({Key key, @required this.classinf})
      : super(key: key);
  @override
  _AttendanceScreenTeacherState createState() =>
      _AttendanceScreenTeacherState();
}

class _AttendanceScreenTeacherState extends State<AttendanceScreenTeacher> {
  @override
  void initState() {
    super.initState();
    print(widget.classinf.classid);
    _classesStream = FirebaseFirestore.instance
        .collection('classes')
        .doc(widget.classinf.classid)
        .snapshots();
  }

  Stream<DocumentSnapshot> _classesStream;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Container(
          height: 61.1 * SizeConfig.heightMultiplier,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
          child: Column(
            children: [
              Container(
                height: 6.58 * SizeConfig.heightMultiplier,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      labelStyle: TextStyle(
                        height: 6.58 * SizeConfig.heightMultiplier,
                        fontFamily: 'SegoeUI',
                        color: greyColor,
                        fontSize: 2.10 * SizeConfig.textMultiplier,
                      ),
                      border: OutlineInputBorder(),
                      counterText: "",
                      hintText: 'Enter a name',
                      prefixIcon: Icon(Icons.search)),
                ),
              ),
              Container(
                height: 36 * SizeConfig.heightMultiplier,
                margin: EdgeInsets.only(
                  top: 3 * SizeConfig.heightMultiplier,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Expanded(
                  child: StreamBuilder<DocumentSnapshot>(
                    stream: _classesStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }
                      print(snapshot.data.data());
                      return ListView.builder(
                          itemCount: snapshot.data.data()['numberofstudents'],
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 6 * SizeConfig.heightMultiplier,
                              margin: EdgeInsets.only(
                                top: 2 * SizeConfig.heightMultiplier,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 2 * SizeConfig.widthMultiplier,
                                      right: 2 * SizeConfig.widthMultiplier,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '00',
                                          style: TextStyle(
                                            color: Color(0xffef4874),
                                            fontSize: 16,
                                            fontFamily: 'SegoeUI',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          'Absence',
                                          style: TextStyle(
                                            color: Color(0xff181a54),
                                            fontSize: 8,
                                            fontFamily: 'SegoeUI',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 2 * SizeConfig.widthMultiplier,
                                      right: 2 * SizeConfig.widthMultiplier,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      snapshot.data
                                          .data()['liststudent'][index]
                                          .toString()
                                          .substring(0, 10),
                                      style: TextStyle(
                                        color: Color(0xff181a54),
                                        fontFamily: 'SegoeUI',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 0),
                                    width: 5 * SizeConfig.heightMultiplier,
                                    height: 5 * SizeConfig.heightMultiplier,
                                    padding: EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: lightGreenColor,
                                        )),
                                    child: Icon(Icons.done),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x3f000000),
                                    offset: Offset(0.25, 1.75),
                                    blurRadius: 1,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 5 * SizeConfig.heightMultiplier,
                ),
                height: 4.1 * SizeConfig.heightMultiplier,
                width: 35 * SizeConfig.widthMultiplier,
                child: InkWell(
                  child: Container(
                    height: 4.1 * SizeConfig.heightMultiplier,
                    width: 35 * SizeConfig.widthMultiplier,
                    alignment: Alignment.center,
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                decoration: BoxDecoration(
                  color: redColor,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ],
          ),
        );
      });
    });
  }
}
