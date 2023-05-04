import "package:flutter/material.dart";

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static const routeName = '/SignInScreen';
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Login",style:TextStyle(
            fontSize:50,color:Colors.black,
        ),),
      ),
      /*Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    errorMaxLines: 1,
                    errorStyle: TextStyle(height: 1, fontSize: errorFontSize),
                    hintText: "Enter Your Email or Phone Number",
                    contentPadding: EdgeInsets.all(5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your Email or Phone Number";
                  } else {
                    // bool result = validatePassword(value);
                    // if (result) {
                    //   return null;
                    // } else {
                    //   //Return error here if the email is not registered.
                    //   return "Password should contain Capital,Small letters, Special Characters and numbers";
                    // }
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    errorMaxLines: 1,
                    errorStyle: TextStyle(height: 1, fontSize: errorFontSize),
                    hintText: "Enter Your Password",
                    contentPadding: EdgeInsets.all(5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                validator: (value) {
                  //In this function we must add the validation of given input.
                  if (value!.isEmpty) {
                    return "Please enter a Password!";
                  } else {
                    //Add a function here to validate if the password is indeed correct or not.
                    //   bool result = validatePassword(value);
                    //   if (result) {
                    //     return null;
                    //   } else {
                    //     return "Password should contain Capital,Small letters, Special Characters and numbers";
                    //   }
                  }
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _formKey.currentState!.validate();
                    });
                  },
                  child: const Text("Submit")),
            ],
          )),*/
    );
  }
}
