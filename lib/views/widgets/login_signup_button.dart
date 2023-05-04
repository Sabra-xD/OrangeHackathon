import 'package:flutter/material.dart';

import '../../styles/colors/colors.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    super.key,
    required this.hintText,
    required this.width,
    required this.height,
    required this.keyName,
    required this.onPressed,
    required this.isWhite,
  });

  final String hintText;
  final double width;
  final double height;

  ///Key to be used in testing
  final String keyName;
  final Function onPressed;
  //if the buton is white==>it is true
  final bool isWhite;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        key: Key(keyName),
        onPressed: (){
          Navigator.pushReplacementNamed(
            context,
            '/SignInScreen',
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              return isWhite ? myWhite : Theme.of(context).primaryColor;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
        child: Center(
          child: Text(
            hintText,
            style: TextStyle(
              fontSize: 30,
              color: isWhite ? Theme.of(context).primaryColor : myWhite,
            ),
          ),
        ),
      ),
    );
  }
}
