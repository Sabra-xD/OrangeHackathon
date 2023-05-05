import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cmp_developers/views/screens/create_account_child.dart';
import 'views/screens/create_account.dart';
import 'views/screens/first_screen.dart';
import 'views/screens/sign_in.dart';
import 'views/screens/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Colors.transparent // set the status bar color to transparent
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap Cash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xffe26477),
        fontFamily: 'Roboto', // set default font family
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // set default text color
        ),
      ),
      initialRoute: '/',
      routes: {
        SplashScreen.routeName: (ctx) => const SplashScreen(),
        FirstScreen.routeName: (ctx) => const FirstScreen(),
        SignIn.routeName: (ctx) => const SignIn(),
        SignUp.routeName: (ctx) => const SignUp(),
        createAccountChild.routeName: (ctx) => const createAccountChild(),
      },
      home:
          const SplashScreen(), //Use Outer home. We use Scaffold, since it has an AppBar.
    );
  }
}
