import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:tesma/constants/color.dart';
import 'package:tesma/models/classinf.dart';

class UploadFileScreen extends StatefulWidget {
  final ClassInf classinf;
  final String userType;
  const UploadFileScreen(
      {Key key, @required this.classinf, @required this.userType})
      : super(key: key);
  @override
  _UploadFileScreen createState() => _UploadFileScreen();
}

class _UploadFileScreen extends State<UploadFileScreen> {
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                Container(
                  height: 50 * SizeConfig.heightMultiplier,
                  color: redColor,
                  padding: EdgeInsets.only(
                    top: 3 * SizeConfig.heightMultiplier,
                    right: 7 * SizeConfig.widthMultiplier,
                    left: 7 * SizeConfig.widthMultiplier,
                  ),
                  child: Column(
                    children: [
                      DottedBorder(
                        color: Colors.black,
                        strokeWidth: 1,
                        dashPattern: [10, 6],
                        child: Container(
                          alignment: Alignment.topCenter,
                          height: 16 * SizeConfig.heightMultiplier,
                          width: 86 * SizeConfig.widthMultiplier,
                          child: Column(
                            children: [
                              InkWell(
                                child: Container(
                                  height: 5 * SizeConfig.heightMultiplier,
                                  width: 20 * SizeConfig.widthMultiplier,
                                  margin: EdgeInsets.only(
                                    top: 4 * SizeConfig.heightMultiplier,
                                    bottom: 2 * SizeConfig.heightMultiplier,
                                  ),
                                  child: Icon(
                                    Icons.arrow_upward,
                                    color: whiteColor,
                                  ),
                                  decoration: BoxDecoration(
                                    color: mediumPink,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              Text(
                                'Select your file to upload',
                                style: TextStyle(
                                  color: royalBlueColor,
                                  fontFamily: 'SegoeUI',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 3 * SizeConfig.heightMultiplier,
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
          ),
        );
      });
    });
  }
}
