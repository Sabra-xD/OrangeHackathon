import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_cmp_developers/controllers/qr_code.dart';
import 'package:get/get.dart';

class qrtetst extends StatefulWidget {
  const qrtetst({super.key});

  @override
  State<qrtetst> createState() => _qrtetstState();
}

class _qrtetstState extends State<qrtetst> {
  var qrtest = "Add data";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QRController>(
        init: QRController(),
        builder: (controller) {
          // QRController qrController = Get.find<QRController>();

          // print(controller.qrtest);

          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.qrtest,
                    style: TextStyle(color: Colors.blue),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.scanQR();
                      },
                      child: Text("Scan Now")),
                ],
              ),
            ),
          );
        });
  }

  // Future<void> scanQR2() async {
  //   print("WE are IN!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1");
  //   try {
  //     FlutterBarcodeScanner.scanBarcode('#2A99CF', "Cancel", true, ScanMode.QR)
  //         .then((value) {
  //       setState(() {
  //         qrtest = value;
  //       });
  //     });
  //   } catch (e) {
  //     setState(() {
  //       qrtest = "Unable to get it";
  //     });
  //   }
  // }
}
