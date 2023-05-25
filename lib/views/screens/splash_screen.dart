import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter_cmp_developers/constants/constants.dart';
import 'dart:async';
import 'package:flutter_cmp_developers/controllers/checkConnection.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/SplashScreen';

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late bool connect;
  @override
  void initState() {
    super.initState();
    internetCheck();
  }

  void internetCheck() async {
    bool hasInternet = await checkConnectivity();
    setState(() {
      connect = hasInternet;
    });
    if (connect) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushReplacementNamed(context, "/FirstScreen");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
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
            loadingText: connect
                ? snapshot.data != ConnectivityResult.none
                    ? const Text("Loading... Please wait")
                    : const Text("Please check your internet connection")
                : const Text("Please check your internet conenction"),
            durationInSeconds: 5,
          );
        });
  }

//This is used to check if there is internet conenction when starting the application.
}
