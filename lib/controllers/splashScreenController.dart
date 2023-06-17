// ignore_for_file: file_names

import 'checkConnection.dart' show checkConnectivity;
import 'package:get/get.dart';

class splashController extends GetxController {
  bool connect = false;

  void internetCheck() async {
    bool hasInternet = await checkConnectivity();

    connect = hasInternet;

    if (connect) {
      Future.delayed(const Duration(seconds: 5), () {
        Get.offAllNamed("/FirstScreen");
      });
    }
    update();
  }
}
