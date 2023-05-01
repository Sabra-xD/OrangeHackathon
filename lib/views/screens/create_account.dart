import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/Styles/Fonts/Fonts.dart';

import '../../functions/create_account_functions.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final passowrdInput = TextEditingController();
  final _email = TextEditingController();
  // late bool _NotValid = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              emailInput(),
              passwordInput(),
              submit(),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton submit() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
        onPressed: () {
          setState(() {
            _formKey.currentState!.validate();
          });
        },
        child: const Text("Sign up"));
  }

  Container passwordInput() {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      // color: Colors.white,
      width: 400,
      child: TextFormField(
        decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 1, fontSize: ErrorFontSize),
            hintText: "Enter Your Password!",
            contentPadding: EdgeInsets.all(5),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter a Password!";
          } else {
            bool result = validatePassword(value);
            if (result) {
              return null;
            } else {
              return "Password should contain Capital,Small letters, Special Characters and numbers";
            }
          }
        },
      ),
    );
  }

  Container emailInput() {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: 400,
      child: TextFormField(
        controller: _email,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          errorStyle: TextStyle(height: 1, fontSize: ErrorFontSize),
          hintText: "Enter your E-mail or Phone Number",
          contentPadding: EdgeInsets.all(5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "You must enter a valid Account!";
          } else {
            if (isEmailValid(_email.text)) {
              return null;
            } else {
              return "You must enter a valid E-mail!";
            }
          }
        },
      ),
    );
  }
}
