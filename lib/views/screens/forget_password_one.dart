import "package:flutter/material.dart";

class ForgetPasswordOne extends StatelessWidget {
  ///Route for Navigating
  static const routeName = '/ForgetPasswordOne';
  const ForgetPasswordOne({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Forget Password",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
