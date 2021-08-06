import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tesma/constants/color.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:tesma/models/classinf.dart';
import 'dart:math';

class QrClass extends StatefulWidget {
  final ClassInf classinf;
  const QrClass({Key key, @required this.classinf}) : super(key: key);
  @override
  _QrClassState createState() => _QrClassState();
}

class _QrClassState extends State<QrClass> {
  ClassInf classinf;
  @override
  void initState() {
    super.initState();
    classinf = widget.classinf;
  }
  Color getbackgroudcolor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return lightPurpleColor;
    }
    return redColor;
  }

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    String _qrCode;
    String createQrCode(){
      DateTime startTime = DateTime.now();
      DateTime endTime = DateTime(startTime.hour + 3);
      DateTime time;
      if(_qrCode == null || time == endTime){
        return 'NO QR CODE';
      } else {
        return classinf.classid + (random.nextInt(900000) + 100000).toString();
      }
    }
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Scaffold(
          //resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
              child: Container(
                //height: 120 * SizeConfig.heightMultiplier,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 87),
                color: light_periwinkle,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: QrImage(
                        data: 'createQrCode',
                        version: QrVersions.auto,
                        size: 250.0,
                      ),
                    ),
                    Container(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: TextButton(
                          onPressed: createQrCode,
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(royalBlueColor),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Text(
                        'QR SCAN',
                        style: TextStyle(
                          fontFamily: 'SegoeUI',
                          color: royalBlueColor,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        "Give this code to your student to make a roll-call",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'SegoeUI',
                          color: royalBlueColor,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        );
      });
    });
  }
}
