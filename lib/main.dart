import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/screens/CreateAccount.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUp(), //Use Outer home. We use Scaffold, since it has an AppBar.
    );
  }
}
