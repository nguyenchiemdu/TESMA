import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tesma/models/class.dart';

Widget classCard(BuildContext context, DocumentSnapshot document) {
  final _class = Class.fromSnapshot(document);

  return Container(
    child: Card(
      child: Column(
        children: [],
      ),
    ),
  );
}
