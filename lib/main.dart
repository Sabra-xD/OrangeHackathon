import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cmp_developers/views/screens/create_account_child.dart';
import 'package:flutter_cmp_developers/views/screens/forgot_password.dart';
import 'package:flutter_cmp_developers/views/screens/new_password_create.dart';
import 'package:flutter_cmp_developers/views/screens/otp_screen.dart';
import 'package:flutter_cmp_developers/views/screens/send_request.dart';
import 'package:flutter_cmp_developers/views/screens/services_screen.dart';
import 'package:flutter_cmp_developers/views/screens/settings.dart';
import 'views/screens/create_account.dart';
import 'views/screens/first_screen.dart';
import 'views/screens/forget_password_one.dart';
import 'views/screens/home.dart';
import 'views/screens/sign_in.dart';
import 'views/screens/splash_screen.dart';
import 'views/screens/virtualCard.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor:
            Colors.transparent // set the status bar color to transparent
        ),
  );
  runApp(
    const MyApp(),
  );
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
        CreateAccountChild.routeName: (ctx) => const CreateAccountChild(),
        ForgotPassword.routeName: (ctx) => const ForgotPassword(),
        NewPasswordCreate.routeName: (ctx) => const NewPasswordCreate(),
        OneTimePassword.routeName: (ctx) => const OneTimePassword(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        myServices.routeName: (ctx) => const myServices(),
        SendReceive.routeName: (ctx) => SendReceive(),
        CardScreen.routeName: (ctx) => CardScreen(),
        SettingsScreen.routeName: (ctx) => const SettingsScreen(),
      },
      home:
          FirstScreen(), //Use Outer home. We use Scaffold, since it has an AppBar.
    );
  }
}
