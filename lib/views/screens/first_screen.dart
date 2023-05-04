import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import '../../styles/colors/colors.dart';

class FirstScreen extends StatelessWidget {
  ///Route for Navigating
  static const routeName = '/FirstScreen';
  const FirstScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    double screenHeightRatio = height / 926;
    double screenWidthRatio = width / 428;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: /*SvgPicture.asset(
              'assets/image.svg',
              semanticsLabel: 'My Image',
              fit: BoxFit.fill,
            )*/
            Image.asset(
              'assets/first_screen.jpg',
              fit: BoxFit.fill,
            )
            ,
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
                    "Wallet App",
                    style: TextStyle(
                      fontSize: 50,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 16 * screenHeightRatio,
                  ),
                  const Text(
                    "Empower your money, Simplify your life.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 24 * screenHeightRatio,
                  ),
                  SizedBox(
                    width: 328 * screenWidthRatio,
                    height: 51,
                    child: TextButton(
                      key: const Key("LOGIN_FIRST_SCREEN"),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          '/SignInScreen',
                        );
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
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 30,
                            color: myWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ButtonComponent(
                  //   hintText: 'LOGIN',
                  //   width: 328 * screenWidthRatio,
                  //   height: 51,
                  //   keyName: "LOGIN_FIRST_SCREEN",
                  //   onPressed: () {
                  //     Navigator.pushReplacementNamed(
                  //       context,
                  //       '/SignInScreen',
                  //     );
                  //   },
                  //   isWhite: false,
                  // ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: 328 * screenWidthRatio,
                    height: 51,
                    child: TextButton(
                      key: const Key("SIGN_UP_FIRST_SCREEN"),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          '/SignUp',
                        );
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
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 30,
                            color: myWhite,
                          ),
                        ),
                      ),
                    ),
                  )
                  // ButtonComponent(
                  //   hintText: 'SIGN UP',
                  //   width: 328 * screenWidthRatio,
                  //   height: 51,
                  //   keyName: "SIGN_UP_FIRST_SCREEN",
                  //   onPressed: () {
                  //     Navigator.pushReplacementNamed(
                  //       context,
                  //       '/SignUp',
                  //     );
                  //   },
                  //   isWhite: false,
                  // ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
