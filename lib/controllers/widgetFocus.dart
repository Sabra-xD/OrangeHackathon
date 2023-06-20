import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

//This function works properly for Stateful and Stateless widgets.

class AppLifeCycle extends WidgetsBindingObserver {
  bool backGroundState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      return false;
    }

    if (state == AppLifecycleState.paused) {
      return true;
    } else {
      return false;
    }
  }

  void removeObserver() {
    WidgetsBinding.instance.removeObserver(this);
  }

  void checkfivesecondsPass(AppLifecycleState state) {
    // ignore: unrelated_type_equality_checks
    if (state == AppLifecycleState.paused) {
      Get.offAllNamed("/ExpiredScreen");
      //Should close session here.
    }
  }
}
