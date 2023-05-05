import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/constants/constants.dart';
import '../../controllers/create_account_controller.dart';
import '../widgets/frequently_used_widgets.dart';
//import 'package:dob_input_field/dob_input_field.dart';

class CreateAccountChild extends StatefulWidget {
  const CreateAccountChild({
    super.key,
  });
  static const routeName = '/SignUpChild';
  @override
  State<CreateAccountChild> createState() => CreateAccountChildState();
}

class CreateAccountChildState extends State<CreateAccountChild> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisibile = false;
  final _passowrdInput = TextEditingController();
  final _confirmPass = TextEditingController();
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberInput = TextEditingController();
  final _firstNameInput = TextEditingController();
  final _lastNameInput = TextEditingController();
  final _birthDayInput = TextEditingController();
  final _parentPhoneNumberInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final width = size.width;
    final height = size.height;
    // double screenHeightRatio = height / 926;
    // double screenWidthRatio = width / 428;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/AdultSignUp.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/SignUp');
                        },
                        icon: Image.asset(
                          'assets/images/Icon.jfif',
                        ),
                        iconSize: 5,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/childrenIcon.jfif',
                        ),
                        iconSize: 70,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textFormFieldInput(
                          "First Name",
                          "Please enter your first name",
                          TextInputType.name,
                          0.4,
                          context,
                          _firstNameInput),
                      const SizedBox(
                        width: 3,
                      ),
                      textFormFieldInput(
                          "Last Name",
                          "Please enter your last name",
                          TextInputType.name,
                          0.4,
                          context,
                          _lastNameInput),
                    ],
                  ),

                  unformSpacing(),

                  emailInput(),

                  unformSpacing(),

                  phoneNumberInput(
                      "Enter your Phone Number", context, _phoneNumberInput),

                  unformSpacing(),

                  phoneNumberInput("Enter parent Phone Number", context,
                      _parentPhoneNumberInput),

                  unformSpacing(),

                  textFormFieldInput(
                      "Enter your birthday",
                      "Please Enter your birthday",
                      TextInputType.datetime,
                      0.8,
                      context,
                      _birthDayInput),

                  unformSpacing(),
                  passwordInput(),
                  //Spacing
                  unformSpacing(),
                  _confirmPasswordTextField(),

                  const SizedBox(
                    height: 24,
                  ),

                  submit(),

                  const SizedBox(
                    height: 48,
                  ),

                  alreadyHaveAccount(context),
                  unformSpacing(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _confirmPasswordTextField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      // height: MediaQuery.of(context).size.width * 0.8,
      height: 51,
      child: TextFormField(
        maxLength: 6,
        obscureText: !_confirmPasswordVisibile,
        controller: _confirmPass,
        decoration: InputDecoration(
          filled: true,
          fillColor: myWhite,
          errorMaxLines: 1,
          errorStyle: const TextStyle(
            height: 1,
            fontSize: errorFontSize,
          ),
          hintText: "Confirm your pin",
          hintStyle: TextStyle(
            color: textFieldTextColor,
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.all(
            contentPadding,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                textFieldRadius,
              ),
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _confirmPasswordVisibile
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: textFieldTextColor,
            ),
            onPressed: () {
              setState(
                () {
                  _confirmPasswordVisibile = !_confirmPasswordVisibile;
                },
              );
            },
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please confirm your pin";
          } else {
            if (confirmPassword(_passowrdInput.text, _confirmPass.text)) {
              return null;
            } else {
              return "Pin is a mismatch";
            }
          }
        },
      ),
    );
  }

  SizedBox submit() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 51,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          setState(
            () {
              _formKey.currentState!.validate();
            },
          );
        },
        child: Text(
          "Register",
          style: TextStyle(
            fontSize: 20,
            color: myWhite,
          ),
        ),
      ),
    );
  }

  SizedBox passwordInput() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 51,
      child: TextFormField(
        maxLength: 6,
        obscureText: !_passwordVisible,
        controller: _passowrdInput,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(
                () {
                  _passwordVisible = !_passwordVisible;
                },
              );
            },
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
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
          hintText: "Enter your 6 digit pin",
          hintStyle: TextStyle(
            color: textFieldTextColor,
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.all(
            contentPadding,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                textFieldRadius,
              ),
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter a 6 digit pin";
          } else {
            bool result = validatePassword(value, 6);
            if (result) {
              return null;
            } else {
              return "Pin Code must consist of 6 numbers";
            }
          }
        },
      ),
    );
  }

  SizedBox emailInput() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 51,
      child: TextFormField(
        controller: _email,
        decoration: InputDecoration(
          filled: true,
          fillColor: myWhite,
          errorStyle: const TextStyle(
            height: 1,
            fontSize: errorFontSize,
          ),
          hintText: "Enter your email",
          hintStyle: TextStyle(
            color: textFieldTextColor,
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.all(
            contentPadding,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                textFieldRadius,
              ),
            ),
          ),
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
