import "package:flutter/material.dart";
import 'package:flutter_cmp_developers/constants/constants.dart';
import '../../controllers/create_account_controller.dart';
import '../widgets/frequently_used_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    super.key,
  });
  static const routeName = '/SignInScreen';
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _passowrdInput = TextEditingController();
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/login.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(
                        79,
                        76,
                        76,
                        255,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  emailInput(),
                  unformSpacing(),
                  passwordInput(),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 51,
                    child: TextButton(
                      key: const Key("LOGIN_Second_SCREEN"),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          '/HomeScreen',
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            return Theme.of(context).primaryColor;
                          },
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 20,
                            color: myWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                  unformSpacing(),
                  //Register Button
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 51,
                    child: TextButton(
                      key: const Key("Register_Second_SCREEN"),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          '/SignUp',
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            return myWhite;
                          },
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
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
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 51,
                    child: TextButton(
                      key: const Key("Forget_Password"),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          '/ForgetPasswordOne',
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
                          'Forget Password',
                          style: TextStyle(
                            fontSize: 20,
                            color: textFieldTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
}
