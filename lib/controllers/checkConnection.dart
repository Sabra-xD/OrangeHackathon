import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

Future<bool> checkConnectivity() async {
  var result = await Connectivity().checkConnectivity();
  return result.name != "none";
}

void adjustTabBarControllerIndex(TabController controller, int newIndex) {
  controller.animateTo(newIndex);
}
