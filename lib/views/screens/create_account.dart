import 'dart:convert';

import 'package:flutter_cmp_developers/constants/apiBack.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/create_account_controller.dart';
import '../widgets/frequently_used_widgets.dart';

String token = '';

late SharedPreferences SignUpPrefs;
late int StatusCode = 0;

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
  String gender = 'Male';
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
                          Navigator.pushReplacementNamed(
                              context, '/SignUpChild');
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
                  Container(
                    height: textFieldheight,

                    // color: myWhite,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(textFieldRadius),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(textFieldRadius),
                        ),
                        filled: true,
                        fillColor: myWhite,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      borderRadius: BorderRadius.circular(textFieldRadius),
                      value: gender,
                      onChanged: (String? newValue) {
                        setState(() {
                          gender = newValue!;
                        });
                      },
                      items: <String>['Male', 'Female']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  unformSpacing(),
                  passwordInput(),
                  confirmPasswordTextField(),
                  unformSpacing(),

                  if (StatusCode == 400) ...[
                    const Text(
                      "E-mail or Phone nubmer are already in use",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                      ),
                    )
                  ],
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
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            final int result = await SignUpPost(
                _phoneNumberInput.text,
                _confirmPass.text,
                _firstNameInput.text,
                _email.text,
                _birthDayInput.text);
            setState(() {
              StatusCode = result;
              if (result == 201) {
                Navigator.pushReplacementNamed(context, '/HomeScreen');
              }
            });
          }
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

Future<int> SignUpPost(String phonenumber, String confirmpass, String name,
    String email, String birthday) async {
  // "2023-05-08T22:47:31.160Z" birthday format?
  var url = Uri.parse(signUPURL);
  // confirmpass = "123456";
  // phonenumber = "01159744240";

  print(phonenumber);
  print(confirmpass);
  print(name);
  print(email);
  print(birthday);
  // confirmpass = "12345678";
  String gender = 'male';

  var response = await http.post(url, body: {
    "email": email,
    "phoneNumber": phonenumber,
    "password": confirmpass,
    "name": name,
    "dateOfBirth": birthday,
    "role": "parent",
    'gender': gender
  });
  print(response.body);

  var jsonResponse = jsonDecode(response.body);
  String responsebody = response.body;

  Map<String, dynamic> data = json.decode(response.body);
  print("DATA FROM THE SIGN UP");
  print(data['accessToken']);
  token = data['accessToken'];
  print("Token stored in a variable");
  print(token);
  print(response.body);
  print(response.statusCode);

  // int? x = jsonResponse['statusCode'];
  if (response.statusCode == 201) {
    SignUpPrefs = await SharedPreferences.getInstance();
    SignUpPrefs.setString('accessToken', data['accessToken']);
    SignUpPrefs.setString('role', jsonEncode(jsonResponse['user']['role']));
    SignUpPrefs.setString('name', jsonEncode(jsonResponse['user']['name']));
    SignUpPrefs.setString(
        'phoneNumber', jsonEncode(jsonResponse['user']['phoneNumber']));
    SignUpPrefs.setString('gender', jsonEncode(jsonResponse['user']['gender']));
    print(
        "We're inside status code 200--------------------------------------------------");
  }

  return response.statusCode;
}
