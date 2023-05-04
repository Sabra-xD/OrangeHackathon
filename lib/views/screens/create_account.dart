import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/constants/constants.dart';
import '../../controllers/create_account_controller.dart';
import '../widgets/frequently_used_widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    const SizedBox(
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
                          icon: Image.asset(
                            'assets/images/childrenIcon.jfif',
                          ),
                          iconSize: 75,
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
                        ),
                      ],
                    ),

                    unformSpacing(),

                    emailInput(),

                    unformSpacing(),

                    phoneNumberInput(
                      "Enter your Phone Number",
                      context,
                    ),

                    unformSpacing(),

                    textFormFieldInput(
                      "DD/MM/YYYY",
                      "Please enter your birthday",
                      TextInputType.datetime,
                      0.8,
                      context,
                    ),
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

                    Row(
                      children: [
                        const Text(
                          "Already have an account?   ",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    //unformSpacing(),
                  ],
                ),
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
          hintText: "Confirm your password",
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
          hintText: "Enter Your Password",
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
