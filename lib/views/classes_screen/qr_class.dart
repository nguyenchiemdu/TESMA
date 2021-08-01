import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tesma/constants/color.dart';
import 'package:tesma/constants/size_config.dart';

class QrClass extends StatefulWidget {
  @override
  _QrClassState createState() => _QrClassState();
}

class _QrClassState extends State<QrClass> {
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

  String _qrCode;

  @override
  Widget build(BuildContext context) {
    Future<void> qrCodeSetup(
        String qrcode,
        String timestart,
        String timeend,
    ) async{

      String hostID = FirebaseAuth.instance.currentUser.uid;
    }
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Scaffold(
          //resizeToAvoidBottomInset: false,
          body: Container(
            padding: EdgeInsets.fromLTRB(0, 124, 0, 87),
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
                    data: "Xem cái gì mà xem",
                    version: QrVersions.auto,
                    size: 250.0,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
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
                ),
                Expanded(
                  flex: 2,
                  child: Container(
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
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                      getbackgroudcolor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ))),
                          child: Container(
                              width: 49.74 * SizeConfig.widthMultiplier,
                              height: 5.66 * SizeConfig.heightMultiplier,
                              child: Center(
                                  child: Text(
                                "Back",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'SegoeUI',
                                    color: whiteColor,
                                    fontSize: 2.10 * SizeConfig.textMultiplier,
                                    fontWeight: FontWeight.w900),
                              )))),
                    ],
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
