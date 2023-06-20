import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/constants/constants.dart';
import 'package:flutter_cmp_developers/views/widgets/frequently_used_widgets.dart';
import 'package:flutter_cmp_developers/views/widgets/home_frequently_used.dart';
import 'package:flutter_cmp_developers/views/widgets/transaction_history.dart';

import '../../struct/model.dart';

// ignore: non_constant_identifier_names
Stack homePage(BuildContext context, String Balance, String Income,
    String OutCome, PageController _pageController) {
  final transactionList = History.historyList();
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
        topName("David", context,
            _pageController), //Pick and Chosoe between login and Sign Up Prefs.
        coursal_Slider(context, Balance, Income,
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
              homeIcon(myWhite, 'assets/images/virtualCard.png', context),
              uniformWidth(),
              homeIcon(myWhite, 'assets/images/requestIcon.png', context),
              uniformWidth(),
              homeIcon(myWhite, 'assets/images/sendIcon.png', context),
              uniformWidth(),
              homeIcon(myWhite, 'assets/images/shopIcon.png', context),
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
