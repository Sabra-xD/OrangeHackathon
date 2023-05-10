import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter_cmp_developers/constants/apiBack.dart';
import 'package:flutter_cmp_developers/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/create_account_controller.dart';
import '../widgets/frequently_used_widgets.dart';
import 'package:http/http.dart' as http;

late SharedPreferences SignInPref;

class SignIn extends StatefulWidget {
  const SignIn({
    super.key,
  });
  static const routeName = '/SignInScreen';
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late int StatusCode = 0;
  final _passwordInput = TextEditingController();
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
                'assets/images/first_screen.jpg',
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
                    height: MediaQuery.of(context).size.height * 0.52,
                  ),
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  emailInput(StatusCode),
                  unformSpacing(),
                  passwordInput(),
                  unformSpacing(),

                  if (StatusCode == 400) ...[
                    const Text(
                      "User already logged in",
                      style: TextStyle(color: Colors.red, fontSize: 10),
                    )
                  ] else ...[
                    if (StatusCode == 401) ...[
                      const Text(
                        "Wrong Credentials",
                        style: TextStyle(color: Colors.red, fontSize: 10),
                      ),
                    ]
                  ],
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.76,
                    height: 51,
                    child: TextButton(
                      key: const Key("LOGIN_Second_SCREEN"),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          print("Entering the login");
                          final int result =
                              await loginPost(_email.text, _passwordInput.text);
                          print("Stuck?");
                          if (result == 400) {
                            StatusCode = result;
                            print("Result is finally 400");
                            StatusCode = result;
                          } else {
                            if (result == 201) {
                              print("We're status code 200, SUCCESS");
                            }
                          }
                          setState(() {
                            print(result);
                            print("We're inside the set State");
                            print(_formKey.currentState!.validate());
                            if (result == 201) {
                              Navigator.pushNamed(context, "/HomeScreen");
                            }

                            Navigator.pushNamed(context, "/HomeScreen");
                          });
                        }
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
                            color: buttonTextColor,
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
                                color: Theme.of(context).primaryColor),
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
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<int> loginPost(
    String phonenumber,
    String password,
  ) async {
    var url = Uri.parse(loginURL);

    var response = await http.post(url, body: {
      'phoneNumber': phonenumber,
      'password': password,
    });
    print(phonenumber);
    print(response.body);
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 201) {
      // SignInPrefs = await SharedPreferences.getInstance();
      // SignInPrefs.setString('accessToken', jsonResponse['accesToken']);
      // SignInPrefs.setString('role', jsonResponse['role']);
      // SignInPrefs.setString('name', jsonResponse['name']);
      // SignInPrefs.setString('phoneNumber', jsonResponse['phoneNumber']);
      // SignInPrefs.setString('gender', jsonResponse['gender']);
      print(
          "We're inside status code 200--------------------------------------------------");
    }
    var body = jsonDecode(response.body);
    return response.statusCode;
  }

  Text errorText() {
    return Text(
      "Error 400",
      style: TextStyle(color: Colors.black),
    );
  }

  SizedBox emailInput(final int StatusCode) {
    Future<String> login;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.76,
      height: 51,
      child: TextFormField(
        maxLength: 11,
        cursorColor: textFieldTextColor,
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

  SizedBox passwordInput() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.76,
      height: 71,
      child: TextFormField(
        cursorColor: textFieldTextColor,
        maxLength: 6,
        obscureText: !_passwordVisible,
        controller: _passwordInput,
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
              return "Enter a valid password";
            }
          }
        },
      ),
    );
  }
}
