import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'dart:async';
import 'package:flutter_cmp_developers/controllers/checkConnection.dart';
import 'package:flutter_cmp_developers/views/screens/first_screen.dart';

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
            title: Text(
              "Tap Cash",
              style: TextStyle(
                fontSize: 50,
                color: Theme.of(context).primaryColor,
              ),
            ),
            logo: Image.network(
                'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
            backgroundColor: Colors.blueGrey,
            logoWidth: 170,
            showLoader: true,
            loadingText: connect
                ? snapshot.data != ConnectivityResult.none
                    ? const Text("Loading...")
                    : const Text("Please check your internet connection")
                : const Text("Please check your internet conenction"),
            durationInSeconds: 5,
          );
        });
  }

//This is used to check if there is internet conenction when starting the application.
}
