import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/constants/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../controllers/create_account_controller.dart';
import '../widgets/frequently_used_widgets.dart';
import 'package:dob_input_field/dob_input_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({
    super.key,
  });
  static const routeName = '/ForgetPassword';
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/forgetPassword.png',
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.55),
                    phoneNumberInput(
                        "Enter your Phone Number", context, _phoneNumberInput),
                    unformSpacing(),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/SignInScreen");
                        },
                        child: Text(
                          "Back to Login",
                          style: TextStyle(fontSize: 16, color: Colors.black45),
                        )),
                    unformSpacing(),
                    submit(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.28,
                    )
                  ],
                ),
              )),
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
              if (_formKey.currentState!.validate()) {
                print("PAssed the bottleneck");
                Navigator.pushNamed(context, '/OneTimePassword');
              }
            },
          );
        },
        child: Text(
          "Send",
          style: TextStyle(
            fontSize: 20,
            color: myWhite,
          ),
        ),
      ),
    );
  }
}
