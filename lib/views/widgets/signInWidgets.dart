import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/controllers/widgetFocus.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../controllers/create_account_controller.dart';
import '../../controllers/obsecurityController.dart';

//Password Input, Must be 6 digit number.
SizedBox passwordInput(
    TextEditingController _passwordInput, BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.76,
    height: 71,
    child: GetBuilder<obsecurityController>(
      init: obsecurityController(),
      builder: (controller) => TextFormField(
        cursorColor: textFieldTextColor,
        maxLength: 6,
        obscureText: controller.obsecure,
        controller: _passwordInput,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              controller.invertObsecurity();
            },
            icon: Icon(
              !controller.obsecure ? Icons.visibility : Icons.visibility_off,
              color: textFieldTextColor,
            ),
          ),
          filled: true,
          fillColor: myWhite,
          errorMaxLines: 1,
          errorStyle: const TextStyle(
            height: 1,
            fontSize: errorFontSize,
          ),
          hintText: "Password",
          hintStyle: TextStyle(
            color: textFieldTextColor,
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.all(
            contentPadding,
          ),
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
            borderRadius: const BorderRadius.all(
              Radius.circular(
                textFieldRadius,
              ),
            ),
            borderSide: BorderSide(
              color: textFieldTextColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                textFieldRadius,
              ),
            ),
            borderSide: BorderSide(
              color: textFieldTextColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                textFieldRadius,
              ),
            ),
            borderSide: BorderSide(
              color: textFieldTextColor,
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter a Password";
          } else {
            bool result = validatePassword(value, 6);
            if (result) {
              return null;
            } else {
              return "Enter a valid password";
            }
          }
        },
      ),
    ),
  );
}

//Phone Number input, must be 11 numbers and an Egyptian phone number.
SizedBox phoneNumber(final int StatusCode, BuildContext context,
    TextEditingController _phoneNumber) {
  Future<String> login;
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.76,
    height: 71,
    child: TextFormField(
      keyboardType: TextInputType.phone,
      maxLength: 11,
      cursorColor: textFieldTextColor,
      controller: _phoneNumber,
      decoration: InputDecoration(
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
          borderRadius: const BorderRadius.all(
            Radius.circular(
              textFieldRadius,
            ),
          ),
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              textFieldRadius,
            ),
          ),
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              textFieldRadius,
            ),
          ),
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
        filled: true,
        fillColor: myWhite,
        errorStyle: const TextStyle(
          height: 1,
          fontSize: errorFontSize,
        ),
        hintText: "Phone number",
        hintStyle: TextStyle(
          color: textFieldTextColor,
          fontSize: 16,
        ),
        contentPadding: const EdgeInsets.all(
          contentPadding,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "You must enter a valid Phone number";
        } else {
          if (!hasRequiredNumberOfDigits(value, 11)) {
            return null;
          } else {
            return "You must enter a valid Phone number!";
          }
        }
      },
    ),
  );
}

//Register button guiding to the Sign UP screen and deleting the previous page.
SizedBox registerButton(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.76,
    height: 51,
    child: TextButton(
      key: const Key("Register_Second_SCREEN"),
      onPressed: () {
        Get.offNamed("/SignUp");
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            return myWhite;
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              buttonRadius,
            ),
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      child: Center(
        child: Text(
          'REGISTER',
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    ),
  );
}

//Forget PAssword Button guding to the forgot password screen.
SizedBox forgetPasswordbutton(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.76,
    height: 50,
    child: TextButton(
      key: const Key("Forget_Password"),
      onPressed: () {
        Navigator.pushNamed(
          context,
          '/ForgetPassword',
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            return myWhite;
          },
        ),
      ),
      child: Center(
        child: Text(
          'Forgot Your Password?',
          style: TextStyle(
            fontSize: 16,
            color: textFieldTextColor,
          ),
        ),
      ),
    ),
  );
}

//Login Button that initiates all neccessary validations to make sure the requirements are met before moving to the HomeScreen.
SizedBox loginButton(BuildContext context, GlobalKey<FormState> _formKey) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.76,
    height: 51,
    child: TextButton(
      key: const Key("LOGIN_Second_SCREEN"),
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          Get.offAllNamed("/horizontalScroll");
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            return Theme.of(context).primaryColor;
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              buttonRadius,
            ),
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      child: Center(
        child: Text(
          'LOGIN',
          style: TextStyle(
            fontSize: 20,
            color: buttonTextColor,
          ),
        ),
      ),
    ),
  );
}
