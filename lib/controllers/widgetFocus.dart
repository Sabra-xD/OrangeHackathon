import 'package:flutter/material.dart';

class AppLifeCycle extends WidgetsBindingObserver {
  bool backGroundState(AppLifecycleState state) {
    print("Inside the function!");
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
}
