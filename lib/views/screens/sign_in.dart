import "package:flutter/material.dart";
import 'package:flutter_cmp_developers/controllers/widgetFocus.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/frequently_used_widgets.dart';

import '../widgets/signInWidgets.dart';

late SharedPreferences SignInPref;

class SignIn extends StatelessWidget with WidgetsBindingObserver {
  final _passwordInput = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AppLifeCycle _Cycle = AppLifeCycle();
  final AppLifecycleState _currentState =
      AppLifecycleState.resumed; //initial value;
  late int StatusCode = 0;

  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addObserver(this);
    @override
    void didChangeAppLifecycleState(AppLifecycleState state) {
      super.didChangeAppLifecycleState(state);
      _Cycle.backGroundState(state);
    }

    didChangeAppLifecycleState(_currentState);

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
                  phoneNumber(StatusCode, context, _phoneNumber),
                  unformSpacing(),
                  passwordInput(_passwordInput, context),
                  unformSpacing(),
                  const SizedBox(
                    height: 8,
                  ),
                  loginButton(context, _formKey),
                  unformSpacing(),
                  registerButton(context),
                  const SizedBox(
                    height: 12,
                  ),
                  forgetPasswordbutton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
