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
                  margin: EdgeInsets.only(
                      top: 3 * SizeConfig.heightMultiplier,
                      right: 7 * SizeConfig.widthMultiplier,
                      left: 7 * SizeConfig.widthMultiplier),
                  height: 122,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0xff181a54),
                      width: 0.25,
                    ),
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
