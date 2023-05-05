import "package:flutter/material.dart";
import '../../constants/constants.dart';

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
                        Navigator.pushNamed(
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
                    width: width * 0.45, //328 * screenWidthRatio,
                    height: 51,
                    child: TextButton(
                      key: const Key("SIGN_UP_FIRST_SCREEN"),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/SignUpChild',
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
