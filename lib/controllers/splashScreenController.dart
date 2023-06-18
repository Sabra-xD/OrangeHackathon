// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';

import 'checkConnection.dart' show checkConnectivity;
import 'package:get/get.dart';

class splashController extends GetxController {
  bool connect = false;
  int Navigated = 0;
  late Future<void> delayedNavigation;

  @override
  void dispose() {
    super.dispose();
    delayedNavigation = Future.error("Error");
  }

  void internetCheck(BuildContext context) async {
    bool hasInternet = await checkConnectivity();

    connect = hasInternet;

    if (connect && Navigated == 0) {
      print("REPEATED!");
      delayedNavigation = Future.delayed(const Duration(seconds: 5), () {
        if (Navigated == 0) {
          Get.offAllNamed("/FirstScreen");
        }
        Navigated++;
        delayedNavigation = Future.error("Error");
        print(Navigated);
        update();
      });
    }
    update();
  }
}
