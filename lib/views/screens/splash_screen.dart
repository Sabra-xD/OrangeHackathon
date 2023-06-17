import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter_cmp_developers/constants/constants.dart';

import 'package:flutter_cmp_developers/controllers/splashScreenController.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          return GetBuilder<splashController>(
              init: splashController(),
              builder: (controller) {
                //initializing the connection check.

                controller.internetCheck();
                return EasySplashScreen(
                  title: const Text(
                    "Tap Cash\n\ Dealing with Money has never been easier! =)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        // color: Theme.of(context).primaryColor,
                        color: Colors.white),
                  ),
                  logo: Image.asset("assets/images/splashIcon.jfif"),
                  backgroundColor: splashScreenColor,
                  logoWidth: 70,
                  showLoader: true,
                  loadingText: controller.connect
                      ? snapshot.data != ConnectivityResult.none
                          ? const Text("Loading... Please wait")
                          : const Text("Please check your internet connection")
                      : const Text("Please check your internet conenction"),
                  durationInSeconds: 5,
                );
              });
        });
  }
}
