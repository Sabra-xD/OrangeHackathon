import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/constants/constants.dart';
import '../../controllers/create_account_controller.dart';
import '../widgets/frequently_used_widgets.dart';

class NewPasswordCreate extends StatefulWidget {
  static const routeName = '/NewPasswordCreate';
  const NewPasswordCreate({
    super.key,
  });
  @override
  State<NewPasswordCreate> createState() => _NewPasswordCreate();
}

class _NewPasswordCreate extends State<NewPasswordCreate> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisibile = false;
  final _passowrdInput = TextEditingController();
  final _confirmPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/newPassword.png',
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
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),

                    const SizedBox(
                      height: 24,
                    ),

                    const Text(
                      "New Password",
                      style: TextStyle(fontSize: 20, color: Colors.black45),
                    ),

                    unformSpacing(),

                    unformSpacing(),

                    passwordInput(),

                    //Spacing
                    unformSpacing(),
                    confirmPasswordTextField(),

                    const SizedBox(
                      height: 24,
                    ),

                    submit(),

                    const SizedBox(
                      height: 48,
                    ),

                    unformSpacing(),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
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
              _formKey.currentState!.validate();
              print(_confirmPasswordVisibile);
            },
          );
        },
        child: Text(
          "Confirm",
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
      height: textFieldheight,
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
          hintText: "Enter Your 6 digit pin",
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
      height: textFieldheight,
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

  /*SizedBox confirmPasswordTextField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: textFieldheight,
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
          hintText: "Confirm your pin",
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
              setState() {
                _confirmPasswordVisibile = !_confirmPasswordVisibile;
                print(_confirmPasswordVisibile);
              }
            },
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
}*/
}
