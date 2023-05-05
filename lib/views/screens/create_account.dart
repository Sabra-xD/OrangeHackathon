import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/constants/constants.dart';
import '../../controllers/create_account_controller.dart';
import '../widgets/frequently_used_widgets.dart';
//import 'package:dob_input_field/dob_input_field.dart';

bool _passwordVisible = false;
bool _confirmPasswordVisibile = false;

class SignUp extends StatefulWidget {
  const SignUp({
    super.key,
  });
  static const routeName = '/SignUp';
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _passowrdInput = TextEditingController();
  final _confirmPass = TextEditingController();
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberInput = TextEditingController();
  final _firstNameInput = TextEditingController();
  final _lastNameInput = TextEditingController();
  final _birthDayInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    height: MediaQuery.of(context).size.height * 0.22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/Icon.jfif',
                        ),
                        iconSize: 50,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/SignUpChild');
                        },
                        icon: Image.asset(
                          'assets/images/childrenIcon.jfif',
                        ),
                        iconSize: 15,
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
                        _firstNameInput,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      textFormFieldInput(
                        "Last Name",
                        "Please enter your last name",
                        TextInputType.name,
                        0.4,
                        context,
                        _lastNameInput,
                      ),
                    ],
                  ),
                  unformSpacing(),
                  emailInput(),
                  unformSpacing(),
                  phoneNumberInput(
                    "Enter your Phone Number",
                    context,
                    _phoneNumberInput,
                  ),
                  unformSpacing(),
                  textFormFieldInput(
                    "Enter your birthday",
                    "Please Enter your birthday",
                    TextInputType.datetime,
                    0.8,
                    context,
                    _birthDayInput,
                  ),
                  unformSpacing(),
                  passwordInput(),
                  confirmPasswordTextField(),
                  const SizedBox(
                    height: 8,
                  ),
                  submit(),
                  const SizedBox(
                    height: 48,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Text(
                        "Already have an account?    ",
                        style: TextStyle(
                          fontSize: 16,
                          color: textFieldTextColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/SignInScreen',
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              return myWhite;
                            },
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //alreadyHaveAccount(context),
                  unformSpacing(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container submit() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: textFieldheight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(buttonRadius),
      ),
      child: ElevatedButton(
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
            color: textFieldTextColor,
          ),
        ),
      ),
    );
  }

  SizedBox passwordInput() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 71,
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
          hintText: "Enter Your Password",
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

  SizedBox confirmPasswordTextField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 71,
      child: TextFormField(
        maxLength: 6,
        obscureText: !_confirmPasswordVisibile,
        controller: _confirmPass,
        decoration: InputDecoration(
          suffixIcon: IconButton(

            onPressed: () {
              setState(
                () {
                  _confirmPasswordVisibile = !_confirmPasswordVisibile;
                },
              );
            },
            icon: Icon(
              _confirmPasswordVisibile
                  ? Icons.visibility
                  : Icons.visibility_off,
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
          hintText: "Enter Your 6 digit pin",
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

  SizedBox emailInput() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: textFieldheight,
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
