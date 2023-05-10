import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String loginURL =
    'https://tabcash.switzerlandnorth.cloudapp.azure.com/backend/api/auth/login';

String signUPURL =
    'https://tabcash.switzerlandnorth.cloudapp.azure.com/backend/api/auth/signup';

String walletBalanceURL =
    "https://tabcash.switzerlandnorth.cloudapp.azure.com/backend/api/wallet/balance";

String IncomeUrl =
    "https://tabcash.switzerlandnorth.cloudapp.azure.com/backend/api/wallet/income";

String OutComeURL =
    "https://tabcash.switzerlandnorth.cloudapp.azure.com/backend/api/wallet/outcome";

// // Future<int> SignUpPost(String phonenumber, String confirmpass, String name,
//     String email, String birthday, SharedPreferences SignUpPrefs) async {
//   // "2023-05-08T22:47:31.160Z" birthday format?
//   var url = Uri.parse(signUPURL);
//   confirmpass = "123456";
//   phonenumber = "01159744240";

//   print(phonenumber);
//   print(confirmpass);
//   print(name);
//   print(email);
//   print(birthday);
//   // confirmpass = "12345678";
//   String gender = 'male';

//   var response = await http.post(url, body: {
//     "email": email,
//     "phoneNumber": phonenumber,
//     "password": confirmpass,
//     "name": name,
//     "dateOfBirth": birthday,
//     "role": "parent",
//     'gender': gender
//   });
//   print(response.body);

//   var jsonResponse = jsonDecode(response.body);
//   String responsebody = response.body;
//   print(response.body);
//   print(response.statusCode);

//   // int? x = jsonResponse['statusCode'];
//   if (response.statusCode == 201) {
//     SignUpPrefs = await SharedPreferences.getInstance();
//     SignUpPrefs.setString(
//         'accessToken', jsonEncode(jsonResponse['accessToken']));
//     SignUpPrefs.setString('role', jsonEncode(jsonResponse['user']['role']));
//     SignUpPrefs.setString('name', jsonEncode(jsonResponse['user']['name']));
//     SignUpPrefs.setString(
//         'phoneNumber', jsonEncode(jsonResponse['user']['phoneNumber']));
//     SignUpPrefs.setString('gender', jsonEncode(jsonResponse['user']['gender']));
//     print(
//         "We're inside status code 200--------------------------------------------------");
//   }

//   return response.statusCode;
// }

Future<int> loginPost(
    String phonenumber, String password, SharedPreferences SignInPrefs) async {
  var url = Uri.parse(loginURL);
  String password = '12345678';
  String phonenumber = "01033304427";

  var response = await http.post(url, body: {
    'phoneNumber': phonenumber,
    'password': password,
  });
  print(response.body);
  var jsonResponse = jsonDecode(response.body);
  if (response.statusCode == 200) {
    SignInPrefs = await SharedPreferences.getInstance();
    SignInPrefs.setString('accessToken', jsonResponse['accesToken']);
    SignInPrefs.setString('role', jsonResponse['role']);
    SignInPrefs.setString('name', jsonResponse['name']);
    SignInPrefs.setString('phoneNumber', jsonResponse['phoneNumber']);
    SignInPrefs.setString('gender', jsonResponse['gender']);
    print(
        "We're inside status code 200--------------------------------------------------");
  }
  var body = jsonDecode(response.body);
  return response.statusCode;
}
