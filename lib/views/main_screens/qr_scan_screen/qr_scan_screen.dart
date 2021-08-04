import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tesma/constants/color.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: IconButton(
                          icon: FutureBuilder<bool>(
                            future: controller?.getFlashStatus(),
                            builder: (context, snapshot) {
                              if(snapshot.data != null){
                                return Icon(snapshot.data ? Icons.flash_on : Icons.flash_off);
                              } else{

                              }
                              return Text('Flash: ${snapshot.data}');
                            },
                          ),
                          onPressed: () async {
                            await controller?.toggleFlash();
                            setState(() {});
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: IconButton(
                          icon: FutureBuilder(
                            future: controller?.getCameraInfo(),
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                return Icon(Icons.switch_camera);
                              } else {
                                return Container();
                              }
                            },
                          ),
                          onPressed: () async {
                            await controller?.flipCamera();
                            setState(() {});
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
                  else
                    Text('Scan a code'),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: Text(
                          'QR SCAN',
                          style: TextStyle(
                            color: royalBlueColor,
                            fontSize: 40,
                            fontFamily: 'SegoeUI',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          margin: EdgeInsets.all(8),
                          width: 200,
                          child: Text(
                            'Place your teacher code inside the frame to scan ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: royalBlueColor,
                              fontSize: 16,
                              fontFamily: 'SegoeUI',
                            ),
                          ),
                        ),
                      ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                        padding: EdgeInsets.symmetric(
                            horizontal: 120),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(20)),
                      ),
                      child: Container(
                        child: Center(
                          child: Text(
                            'Back',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'SegoeUI',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                    ],
                  ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 500.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
