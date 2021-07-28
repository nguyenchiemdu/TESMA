import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:tesma/models/classinf.dart';

Widget classCard(BuildContext context, DocumentSnapshot document) {
  final _class = ClassInf.fromSnapshot(document);

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
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    left: 8.5 * SizeConfig.widthMultiplier,
                    top: 2.5 * SizeConfig.widthMultiplier),
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
    //height: 25 * SizeConfig.heightMultiplier,
    //width: 77.2 * SizeConfig.widthMultiplier,
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
