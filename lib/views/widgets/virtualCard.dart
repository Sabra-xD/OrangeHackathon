import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/constants/constants.dart';
import 'package:flutter_cmp_developers/views/widgets/frequently_used_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

final _formKey = GlobalKey<FormState>();
int lastthreedigits = 123;
double balance = 2789.12;
bool success = false;
bool failed = false;
int errorCount = 0;
String _pinCode = '';

SingleChildScrollView virtualCard(BuildContext context) {
  return SingleChildScrollView(
    child: Expanded(
      child: Form(
        key: _formKey,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/Home.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  uniformtopSpacing(),
                  unformSpacing(),
                  Container(
                    padding: const EdgeInsets.all(25),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/balance.png'),
                            fit: BoxFit.fill)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Balance",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "Master Card",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("EGP ${Balance}"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("**** **** **** *${lastthreedigits}"),
                            ],
                          ),
                          unformSpacing(),
                        ]),
                  ),
                  unformSpacing(),
                  uniformtopSpacing(),
                  const Center(
                    child: Text("Enter your Pin Code"),
                  ),
                  uniformtopSpacing(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: PinCodeTextField(
                      keyboardType: TextInputType.number,
                      length: 4,
                      blinkWhenObscuring: true,
                      obscuringCharacter: '*',
                      obscuringWidget: const Icon(
                        Icons.one_x_mobiledata,
                      ),
                      animationType: AnimationType.fade,
                      onChanged: (value) {},
                      validator: (value) {
                        if (value!.isEmpty && value.length < 4) {
                          return "Enter the OTP";
                        } else {
                          return null; //Here we should post the OTP to the backend.
                        }
                      },
                      pastedTextStyle: const TextStyle(
                        // color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      pinTheme: PinTheme(
                        fieldHeight: 50,
                        fieldWidth: 50,
                        inactiveColor: myWhite,
                        shape: PinCodeFieldShape.box,
                        selectedColor: Colors.amber,
                        activeColor: Colors.blue,
                        // borderRadius: BorderRadius.circular(30),
                      ),
                      appContext: context,
                    ),
                  ),
                  unformSpacing(),
                  // emailInput(),
                  unformSpacing(),
                  if (errorCount < 3) ...[
                    // pinInput(errorCount, success, failed),
                  ] else ...[
                    const Text(
                      "You have exceeded the number of tries, please try again later",
                      style: TextStyle(color: Colors.redAccent, fontSize: 16),
                    ),
                  ],

                  unformSpacing(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.76,
                    height: 51,
                    child: ElevatedButton(
                      // key: const Key("LOGIN_Second_SCREEN"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
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
                          'Submit',
                          style: TextStyle(
                            fontSize: 20,
                            color: buttonTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
