import "package:flutter/material.dart";
import 'package:flutter_cmp_developers/controllers/widgetFocus.dart';
import 'package:get/get.dart';
import '../../constants/constants.dart';

class FirstScreen extends StatefulWidget {
  ///Route for Navigating
  static const routeName = '/FirstScreen';
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with WidgetsBindingObserver {
  final AppLifeCycle _Cycle = AppLifeCycle();
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    print("Initiated");
    super.initState();
  }

  //Embedded function that is called when Screen state is changed.

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    _Cycle.backGroundState(state);
  }

  @override
  Widget build(BuildContext context) {
    bool display = false;
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/first_screen.png',
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.35, // * screenHeightRatio,
                  ),
                  Text(
                    "Tap Cash",
                    style: TextStyle(
                      fontSize: 50,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 16, //* screenHeightRatio,
                  ),
                  const Text(
                    "Empower your money, Simplify ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "your life.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 24, // * screenHeightRatio,
                  ),
                  SizedBox(
                    width: width * 0.45, //328 * screenWidthRatio,
                    height: 51,
                    child: TextButton(
                      key: const Key("LOGIN_FIRST_SCREEN"),
                      onPressed: () {
                        Get.toNamed("/SignIn");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            return Theme.of(context).primaryColor;
                          },
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              buttonRadius,
                            ),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 25,
                            color: myWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: width * 0.45, //328 * screenWidthRatio,
                    height: 51,
                    child: TextButton(
                      key: const Key("SIGN_UP_FIRST_SCREEN"),
                      onPressed: () {
                        Get.toNamed("/SignUp");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            return Theme.of(context).primaryColor;
                          },
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              buttonRadius,
                            ),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 20,
                            color: myWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
