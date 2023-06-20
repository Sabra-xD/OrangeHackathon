import 'package:flutter/material.dart';
import 'package:gesture_password_widget/gesture_password_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class expiredPasswordInput extends StatefulWidget {
  const expiredPasswordInput({super.key});

  @override
  State<expiredPasswordInput> createState() => _expiredPasswordInputState();
}

class _expiredPasswordInputState extends State<expiredPasswordInput> {
  List<int>? result;
  List<int>? answer = [0, 1, 2];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/Home.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Session has Expired =/"),
                  const Text("Please re-enter the pattern")
                ],
              ),
              GesturePasswordWidget(
                lineColor: Colors.white,
                errorLineColor: Colors.redAccent,
                singleLineCount: 3,
                identifySize: 80.0,
                minLength: 3,
                hitShowMilliseconds: 40,
                errorItem: Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                normalItem: Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                selectedItem: Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                hitItem: Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                answer: answer,
                color: Colors.transparent,
                onComplete: (data) {
                  setState(() {
                    result = data.cast<int>();

                    Get.offAllNamed("/HomeScreen");
                  });
                },
              )
            ],
          ),
        ),
      ]),
    );
  }
}
