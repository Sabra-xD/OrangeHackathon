import 'package:flutter/material.dart';
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
                    style: const TextStyle(color: Colors.blue),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.scanQR();
                      },
                      child: const Text("Scan Now")),
                ],
              ),
            ),
          );
        });
  }
}
