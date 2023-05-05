import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../controllers/create_account_controller.dart';

//We've created global controls in order to POST to the backend.

/// This function is used to return the TextField for the Phone number entry.
///  Checking if the i/p field is empty and if the given phone nubmer starts with 01 and is valid.
///
///
Widget phoneNumberInput(String hintText, BuildContext context,
    TextEditingController phoneNumberInputController) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.8,
    height: textFieldheight,
    child: TextFormField(
      keyboardType: TextInputType.phone,
      controller: phoneNumberInputController,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: myWhite,
        errorStyle: const TextStyle(
          height: 1,
          fontSize: errorFontSize,
        ),
        hintStyle: TextStyle(
          color: textFieldTextColor,
          fontSize: 16,
        ),
        contentPadding: const EdgeInsets.all(contentPadding),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              textFieldRadius,
            ),
          ),
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter the phone number";
        } else {
          if (hasRequiredNumberOfDigits(phoneNumberInputController.text, 11)) {
            return "Please enter a valid phone number";
          }
        }
        return null;
      },
    ),
  );
}

///In this function we get First, last names on create
///
///

Widget textFormFieldInput(
    String hintText,
    String emptyInputError,
    TextInputType keyBoardType,
    double width,
    BuildContext context,
    TextEditingController genericTextFormInputController) {
  return SizedBox(
    //Also in this function we need to add a controller so that it would send it to the backend?
    width: MediaQuery.of(context).size.width * width,
    height: textFieldheight,
    child: TextFormField(
      controller: genericTextFormInputController,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: textFieldTextColor,
          fontSize: 16,
        ),
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
  return const SizedBox(
    height: 12,
  );
}

Widget alreadyHaveAccount(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Already have an account?   ",
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      TextButton(
        key: const Key("LOGIN_FIRST_SCREEN"),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/SignInScreen',
          );
        },
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    ],
  );
}
