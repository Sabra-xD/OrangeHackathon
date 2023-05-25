import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter_cmp_developers/constants/apiBack.dart';

import 'package:flutter_cmp_developers/constants/constants.dart';
import 'package:flutter_cmp_developers/views/widgets/frequently_used_widgets.dart';
import 'package:flutter_cmp_developers/views/widgets/transaction_history.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../struct/model.dart';
import 'create_account.dart';
import 'package:http/http.dart' as http;

// late Future<String> Balance;

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  late String _accessToken = '';
  late String Response = '';
  late String Income = '';
  late String OutCome = '';

  Future getAccessToken() async {
    SignUpPrefs = await SharedPreferences.getInstance();
    String? accessToken = SignUpPrefs.getString("accessToken") ?? "";
    print("Inside the getAccessToken Function");
    print(accessToken);
    setState(() {
      _accessToken = accessToken;
    });
  }

  Future apiCall() async {
    // setState(() {
    //   _accessToken;
    // });

    print("API HAS BEEN CALLED");

    print("----------------------------");
    print(_accessToken);
    var response = await http.get(Uri.parse(walletBalanceURL), headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      'authorization': 'Bearer ${_accessToken}',
    });
    print("+++++++++++++++++++++++++++++++");

    print(_accessToken);

    // var income = await http.get(Uri.parse(IncomeUrl), headers: {
    //   "Content-Type": "application/json",
    //   'Accept': 'application/json',
    //   'authorization': 'Bearer ${_accessToken}',
    // });

    var body = response.body;
    print(body);
    Map<String, dynamic> data = json.decode(response.body);

    // Map<String, dynamic> Income2 = json.decode(income.body);

    if (response.statusCode == 200) {
      setState(() {
        double number = data["total"];

        // Income = Income2['total'];

        Response = number.toString();
      });
    } else {
      print("Balance getter failed");
    }
  }

  Future income() async {
    // setState(() {
    //   _accessToken;
    // });

    print("----------------------------");
    print(_accessToken);
    var response = await http.get(Uri.parse(IncomeUrl), headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      'authorization': 'Bearer ${_accessToken}',
    });
    print("This si the the accessTOKEN INSIDE INCOME!");

    print(_accessToken);

    var body = response.body;
    print(body);
    Map<String, dynamic> data = json.decode(response.body);

    // Map<String, dynamic> Income2 = json.decode(income.body);

    if (response.statusCode == 201) {
      setState(() {
        double number = data["total"];
        Income = number.toString();
      });
    } else {
      print("Income getter failed");
    }
  }

  Future outComeGet() async {
    var response = await http.get(Uri.parse(OutComeURL), headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      'authorization': 'Bearer ${_accessToken}'
    });
    print(response.body);
    var body = response.body;
    Map<String, dynamic> data = json.decode(response.body);

    if (response.statusCode == 200) {
      print("OutCome wallet get is a sucess");
      setState(() {
        double number = data["total"];
        print("This is the number");
        print(number);

        OutCome = number.toString();
      });
    } else {
      print("outCome getter failed.");
    }
  }

  void Trash() async {
    await getAccessToken();
    apiCall();
    income();
    outComeGet();
  }

  @override
  void initState() {
    // TODO: implement initState
    Trash();
    // outComeGet();
    // incomeget();
    controller = TabController(length: 4, vsync: this);
    controller.index = 3;

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final transactionList = History.historyList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: bottomNavigatiohBar(context, controller),
      body: homePage(context),
    );
  }

  Stack homePage(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/Home.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(children: [
          uniformtopSpacing(),
          // topName(SignUpPrefs.getString('name') ?? "David",
          //     context), //Pick and Chosoe between login and Sign Up Prefs.
          coursal_Slider(context, Response, Income,
              OutCome), //Slider get SharedPrefs of Sign Up OR Sign In.
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Most popular operations:",
                  style: TextStyle(
                    fontSize: textFontSize,
                    color: myWhite,
                  ),
                ),
              ],
            ),
          ),
          unformSpacing(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: myWhite,
                  ),
                  child: IconButton(
                      onPressed: () {
                        setState(() async {
                          // String balance = await fetchBalance(SignUpPrefs);
                        });
                        print("Pressed 1 ");
                      },
                      icon: Image.asset('assets/images/virtualCard.png')),
                ),
                uniformWidth(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: myWhite,
                  ),
                  child: IconButton(
                      onPressed: () {
                        print("Pressed 1 ");
                      },
                      icon: Image.asset('assets/images/virtualCard.png')),
                ),
                uniformWidth(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: myWhite,
                  ),
                  child: IconButton(
                      onPressed: () {
                        print("Pressed 1 ");
                      },
                      icon: Image.asset('assets/images/virtualCard.png')),
                ),
                uniformWidth(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: myWhite,
                  ),
                  child: IconButton(
                      onPressed: () {
                        print("Pressed 1 ");
                      },
                      icon: Image.asset('assets/images/virtualCard.png')),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Last Activity",
                      style: TextStyle(color: myWhite),
                    ),
                    ElevatedButton(
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
                        onPressed: () {},
                        child: Text(
                          "View All",
                          style: TextStyle(color: myWhite),
                        ))
                  ],
                ),
              ),
              unformSpacing(),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: transactionList.isNotEmpty
                      ? ListView(
                          children: [
                            for (History his in transactionList.reversed)
                              transactionHistory(history: his),
                          ],
                        )
                      : Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: const Text(
                              "You've no transactions",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ])
      ],
    );
  }
}
