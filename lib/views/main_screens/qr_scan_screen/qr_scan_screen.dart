import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Scaffold(
            body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => QRView(),
              ));
            },
            child: Text('qrView'),
          ),
        ));
      });
    });
  }
}

class QRView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewState();
}

class _QRViewState extends State<QRView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
