import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/styles/constants/constants.dart';

import '../Styles/Fonts/Fonts.dart';
import '../controllers/create_account_controller.dart';

//We've created global controls in order to POST to the backend.

/// This function is used to return the TextField for the Phone number entry.
///  Checking if the i/p field is empty and if the given phone nubmer starts with 01 and is valid.
///
///
Widget phoneNumberInput(String hintText, BuildContext context) {
  TextEditingController phoneNumberInputController = TextEditingController();
  return Container(
    width: MediaQuery.of(context).size.width * 0.8,
    height: 51,
    child: TextFormField(
      keyboardType: TextInputType.number,
      controller: phoneNumberInputController,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        errorStyle: const TextStyle(
          height: 1,
          fontSize: errorFontSize,
        ),
        contentPadding: const EdgeInsets.all(contentPadding),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter the phone number";
        } else {
          if (!hasRequiredNumberOfDigits(phoneNumberInputController.text, 11)) {
            return "Please enter a valid phone number";
          }
        }
      },
    ),
  );
}

Widget TextFormFieldInput(String hintText, String emptyInputError,
    TextInputType keyBoardType, double width, BuildContext context) {
  TextEditingController genericTextFormInputController =
      TextEditingController();

  return SizedBox(
    //Also in this function we need to add a controller so that it would send it to the backend?
    width: MediaQuery.of(context).size.width * width,
    height: 51,
    child: TextFormField(
      controller: genericTextFormInputController,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(),
        filled: true,
        fillColor: Colors.white,
        errorStyle: const TextStyle(
          height: 1,
          fontSize: errorFontSize,
        ),
        contentPadding: const EdgeInsets.all(contentPadding),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return emptyInputError;
        } else {
          return null; //Here we are supposed to Post the First, last and birthday to each of its destinations.
        }
      },
    ),
  );
}

Widget unformSpacing() {
  return SizedBox(
    height: 17,
  );
}