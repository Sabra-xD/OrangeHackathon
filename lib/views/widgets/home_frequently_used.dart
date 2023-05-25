import 'package:flutter/material.dart';

Container homeIcon(Color myWhite, String iconImage, BuildContext context) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: myWhite,
    ),
    child: IconButton(
        onPressed: () {
          if (iconImage == 'assets/images/requestIcon.png' ||
              iconImage == 'assets/images/sendIcon.png') {
            Navigator.pushNamed(context, '/SendRequest');
          }
        },
        icon: Image.asset(iconImage)),
  );
}
