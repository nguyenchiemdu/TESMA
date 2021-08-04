import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tesma/constants/color.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:tesma/models/notification.dart';

Widget notifcard(BuildContext context, DocumentSnapshot document) {
  final notif = Notif.fromSnapshot(document);

  return Container(
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: 5,
          )
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          child: Icon(
            Icons.access_time_filled,
            size: 40,
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 220,
              child: Text(
                "Please update your information!",
                style: TextStyle(
                  fontFamily: 'SegoeUI',
                  color: blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              height: 17,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_clock,
                    size: 10,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "15 minutes ago",
                    style: TextStyle(
                      fontFamily: 'SegoeUI',
                      color: blackColor,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}
