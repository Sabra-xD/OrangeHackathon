import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/constants/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../controllers/create_account_controller.dart';
import '../widgets/frequently_used_widgets.dart';
import 'package:dob_input_field/dob_input_field.dart';

class oneTimePassword extends StatefulWidget {
  const oneTimePassword({
    super.key,
  });
  static const routeName = '/OneTimePassword';
  @override
  State<oneTimePassword> createState() => _oneTimePassword();
}

class _oneTimePassword extends State<oneTimePassword> {
  final _formKey = GlobalKey<FormState>();
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
                    SizedBox(
                      // width: MediaQuery.of(context).size.width * 0.8,
                      // height: MediaQuery.of(context).size.height * 0.3,
                      child: PinCodeTextField(
                        keyboardType: TextInputType.number,
                        length: 6,
                        blinkWhenObscuring: true,
                        obscuringCharacter: '*',
                        // obscuringWidget: FlutterLogo(),
                        animationType: AnimationType.fade,
                        onChanged: (value) {
                          print(value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter the OTP";
                          } else {}
                        },
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        pinTheme: PinTheme(
                          fieldHeight: 50,
                          fieldWidth: 40,
                          shape: PinCodeFieldShape.circle,
                          selectedColor: Colors.amber,
                          activeColor: Colors.blue,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        appContext: context,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have not received the OTP?  ",
                          style: TextStyle(
                              fontSize: 16, color: textFieldTextColor),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Resend",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor),
                            ))
                      ],
                    ),
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
                Navigator.pushNamed(context, '/NewPasswordCreate');
              }
            },
          );
        },
        child: Text(
          "Verify",
          style: TextStyle(
            fontSize: 20,
            color: myWhite,
          ),
        ),
      ),
    );
  }
}
