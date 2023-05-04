// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../styles/colors/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    super.key,
    required this.hintText,
    required this.width,
    required this.keyName,
    required this.isPassword,
    required this.controller,
  });
  static const routeName = '/SignUp';
  final String hintText;
  final double width;
  final String keyName;
  final bool isPassword;
  final TextEditingController controller;
  @override
  // ignore: no_logic_in_create_state
  InputTextFieldState createState() => InputTextFieldState(
        hintText: hintText,
        keyName: keyName,
        isPassword: isPassword,
        width: width,
        controller: controller,
      );
}

class InputTextFieldState extends State {
  InputTextFieldState({
    required this.hintText,
    required this.width,
    required this.keyName,
    required this.isPassword,
    required this.controller,
  });
  bool _obscureText = true;
  final String hintText;
  final double width;
  final String keyName;
  final bool isPassword;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        key: Key(keyName),
        controller: controller,
        obscureText: _obscureText,
        textDirection: TextDirection.rtl,
        maxLines: 1,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true, //to can assign filled color
          fillColor: myWhite,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0x00adaaaa),
            fontSize: 16,
          ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        _obscureText = !_obscureText;
                      },
                    );
                  },
                )
              : null,
        ),
      ),
    );
  }
}

onPressedPasswordIcon() {}
