import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

Future<void> scanQR() async {
  String X = "What?";
  print("WE are IN!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1");
  try {
    await FlutterBarcodeScanner.scanBarcode(
            '#2A99CF', "Cancel", true, ScanMode.QR)
        .then((value) {
      setState() {
        X = value;
        print(
            "----------------------------------------------------------------------------");
        print(value);
        print(
            "----------------------------------------------------------------------------");
      }
    });
  } catch (e) {
    setState() {
      print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
      X = "Unable to read";
      print(X);
      print("+++++++++++++++++++++++++++++++++++++++++");
    }
  }
}
