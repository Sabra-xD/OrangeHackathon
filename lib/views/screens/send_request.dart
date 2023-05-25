import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/constants/constants.dart';
import 'package:flutter_cmp_developers/views/widgets/frequently_used_widgets.dart';

import '../../controllers/create_account_controller.dart';

class SendReceive extends StatefulWidget {
  @override
  _SendReceive createState() => _SendReceive();
  static const routeName = '/SendRequest';
}

class _SendReceive extends State<SendReceive> {
  final _formKey = GlobalKey<FormState>();
  final _amount = TextEditingController();
  final _phoneNumberInputController = TextEditingController();
  bool _pick = false; //False then we send, true we receive.
  bool _passwordVisible = false;
  final _pinInput = TextEditingController();

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/Home.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: _pick ? Colors.grey : myWhite,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _pick = !_pick;
                                        });
                                      },
                                      icon: Image.asset(
                                          'assets/images/sendIcon.png'),
                                    ),
                                  ),
                                  Text(
                                    'Send',
                                    style: uniformTextStyle(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: _pick ? myWhite : Colors.grey,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _pick = !_pick;
                                        });
                                      },
                                      icon: Image.asset(
                                          'assets/images/requestIcon.png'),
                                    ),
                                  ),
                                  Text(
                                    'Request',
                                    style: uniformTextStyle(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          amount("Enter the amount", "Please enter the amount",
                              TextInputType.number, .8, context, _amount),
                          const SizedBox(height: 20),
                          phoneNumberInput("Enter the phone number", context,
                              _phoneNumberInputController),
                          unformSpacing(),
                          if (!_pick) ...[
                            passwordInput(),
                          ],
                          // passwordInput(),
                          unformSpacing(),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: textFieldheight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(buttonRadius),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (!_pick) {
                                    final snackbar;
                                    final scaffoldMessanger =
                                        ScaffoldMessenger.of(context);
                                    int _xBalance = int.parse(Balance);
                                    int _xamount = int.parse(_amount.text);
                                    if (_xBalance >= _xamount) {
                                      setState(() {
                                        _xBalance = _xBalance - _xamount;
                                        Balance = _xBalance.toString();
                                      });
                                      snackbar = snackBarStatus(
                                          'assets/images/sucess.png',
                                          "Transaction has been processesed successfully!");
                                    } else {
                                      snackbar = snackBarStatus(
                                          'assets/images/error.jfif',
                                          "Transaction has failed!");
                                    }

                                    scaffoldMessanger.showSnackBar(snackbar);
                                  } else {
                                    final scaffoldMessanger =
                                        ScaffoldMessenger.of(context);
                                    final snackbar = snackBarStatus(
                                        'assets/images/sucess.png',
                                        "Request has been processed successfully!"); //SnackBar for Request Success.
                                    scaffoldMessanger.showSnackBar(snackbar);
                                  }
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    return Theme.of(context).primaryColor;
                                  },
                                ),
                              ),
                              child: Text(
                                'Submit',
                                style: TextStyle(color: myWhite),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SnackBar snackBarStatus(String image, String _Message) {
    String mess = "loading...";
    if (_Message != null) {
      setState(() {
        mess = _Message;
      });
    }
    String f = "FUDK";
    return SnackBar(
      content: Column(
        children: [
          Image.asset(
            image,
            width: 100,
            height: 100,
          ),
          Center(
            child: Text(mess),
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
    );
  }

  SizedBox passwordInput() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 71,
      child: TextFormField(
        cursorColor: textFieldTextColor,
        maxLength: 6,
        obscureText: !_passwordVisible,
        controller: _pinInput,
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
          hintText: "6 Digit Pin",
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
