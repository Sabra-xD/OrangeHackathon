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
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: /*SvgPicture.asset(
              'assets/image.svg',
              semanticsLabel: 'My Image',
              fit: BoxFit.fill,
            )*/
                Image.asset(
              'assets/images/first_screen.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                  ),
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  emailInput(),
                  unformSpacing(),
                  passwordInput(),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.76,
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
                              buttonRadius,
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
                    width: MediaQuery.of(context).size.width * 0.76,
                    height: 51,
                    child: TextButton(
                      key: const Key("Register_Second_SCREEN"),
                      onPressed: () {
                        Navigator.pushNamed(
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
                              buttonRadius,
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
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.76,
                    height: 20,
                    child: TextButton(
                      key: const Key("Forget_Password"),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/ForgetPassword',
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
                          'Forget Password?',
                          style: TextStyle(
                            fontSize: 16,
                            color: textFieldTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox emailInput() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.76,
      height: 51,
      child: TextFormField(
        controller: _email,
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
      width: MediaQuery.of(context).size.width * 0.76,
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
              return "Password should be 6 digits";
            }
          }
        },
      ),
    );
  }
}
