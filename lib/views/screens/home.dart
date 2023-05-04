import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  ///Route for Navigating
  static const routeName = '/HomeScreen';
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
