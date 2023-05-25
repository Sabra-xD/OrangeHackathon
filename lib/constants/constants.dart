import "package:flutter/material.dart";

Color myWhite = Colors.white;
Color textFieldTextColor = Colors.grey; //Color.fromARGB(193, 193, 193, 255);
const double contentPadding = 7;
const double errorFontSize = 10;
const double buttonRadius = 30;
const double textFieldRadius = 15;
const double textFieldheight = 51;
const double textFontSize = 16;
// const double uniformWidth = 5;
const double transactionFontSize = 14;
Color iconColor = const Color(0xFFEFF4FF);
Color buttonTextColor = Colors.white;

Color color1 = Color(0xFFE9056);
Color color2 = Color(0xFFF3862F);
Color color3 = Color(0xFFEB644A);
Color color4 = Color(0xFFE26473);

Color? c = Color.lerp(
  Color.lerp(color1, color2, 0.8),
  Color.lerp(color3, color4, 0.2),
  0.7,
);

Color splashScreenColor = c!;

String Balance = "5000";
