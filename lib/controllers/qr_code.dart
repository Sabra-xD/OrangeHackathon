import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

//Using the GetBuilder method we have to use the Update method to update the screen
class QRController extends GetxController {
  String qrtest = "Error Capturing the QR";
  Future<void> scanQR() async {
    try {
      String value = await FlutterBarcodeScanner.scanBarcode(
        '#2A99CF',
        "Cancel",
        true,
        ScanMode.QR,
      );

      qrtest = value; // Use .value to assign the value
    } catch (e) {
      qrtest = "Nothing2"; // Use .value to assign the value
    }

    update();
  }
}
