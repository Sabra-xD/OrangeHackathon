import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/Styles/Fonts/Fonts.dart';
import 'package:flutter_cmp_developers/styles/colors/colors.dart';
import 'package:flutter_cmp_developers/styles/constants/constants.dart';

import '../../controllers/create_account_controller.dart';
import '../widgets/frequently_used_widgets.dart';

bool _passwordVisible = false;
bool _confirmPasswordVisibile = false;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _passowrdInput = TextEditingController();
  final _confirmPass = TextEditingController();
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/AdultSignUp.png'),
                  fit: BoxFit.cover),
            ),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/Icon.jfif',
                          ),
                          iconSize: 16,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/childrenIcon.jfif'),
                          iconSize: 75,
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormFieldInput(
                            "First Name",
                            "Please enter your first name",
                            TextInputType.name,
                            0.4,
                            context),
                        SizedBox(
                          width: 3,
                        ),
                        TextFormFieldInput(
                            "Last Name",
                            "Please enter your last name",
                            TextInputType.name,
                            0.4,
                            context),
                      ],
                    ),

                    unformSpacing(),

                    emailInput(),

                    unformSpacing(),

                    phoneNumberInput("Enter your Phone Number", context),

                    unformSpacing(),

                    TextFormFieldInput(
                        "DD/MM/YYYY",
                        "Please enter your birthday",
                        TextInputType.datetime,
                        0.8,
                        context),
                    unformSpacing(),
                    passwordInput(),
                    //Spacing
                    unformSpacing(),
                    _confirmPasswordTextField(),

                    unformSpacing(),

                    submit(),

                    unformSpacing(),

                    Text("Already have an account? Login"),

                    unformSpacing(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _confirmPasswordTextField() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      // height: MediaQuery.of(context).size.width * 0.8,
      height: 51,
      child: TextFormField(
        obscureText: !_confirmPasswordVisibile,
        controller: _confirmPass,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 1, fontSize: errorFontSize),
            hintText: "Confirm your password",
            contentPadding: const EdgeInsets.all(contentPadding),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            suffixIcon: IconButton(
              icon: Icon(_confirmPasswordVisibile
                  ? Icons.visibility
                  : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _confirmPasswordVisibile = !_confirmPasswordVisibile;
                });
              },
            )),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please confirm the Password";
          } else {
            if (confirmPassword(_passowrdInput.text, _confirmPass.text)) {
              return null;
            } else {
              return "Password is a mismatch";
            }
          }
        },
      ),
    );
  }

  Container submit() {
    return Container(
      width: 329,
      height: 51,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
          ),
          onPressed: () {
            setState(() {
              _formKey.currentState!.validate();
            });
          },
          child: const Text("Register")),
    );
  }

  Container passwordInput() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 51,
      child: TextFormField(
        obscureText: !_passwordVisible,
        controller: _passowrdInput,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                icon: Icon(_passwordVisible
                    ? Icons.visibility
                    : Icons.visibility_off)),
            filled: true,
            fillColor: Colors.white,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 1, fontSize: errorFontSize),
            hintText: "Enter Your Password",
            contentPadding: EdgeInsets.all(contentPadding),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter a Password";
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
      width: MediaQuery.of(context).size.width * 0.8,
      height: 51,
      child: TextFormField(
        controller: _email,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          errorStyle: TextStyle(height: 1, fontSize: errorFontSize),
          hintText: "Enter your email",
          contentPadding: EdgeInsets.all(contentPadding),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
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