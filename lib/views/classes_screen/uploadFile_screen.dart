import 'package:flutter/material.dart';
// import 'package:tesma/constants/size_config.dart';
import 'package:tesma/constants/color.dart';
import 'package:tesma/models/classinf.dart';

class UploadFileScreen extends StatefulWidget {
  final ClassInf classinf;
  const UploadFileScreen({Key key, @required this.classinf}) : super(key: key);
  @override
  _UploadFileScreen createState() => _UploadFileScreen();
}

class _UploadFileScreen extends State<UploadFileScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Coming soon',
          style: TextStyle(
            color: redColor,
            fontSize: 40,
            fontFamily: 'SegoeUI',
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
