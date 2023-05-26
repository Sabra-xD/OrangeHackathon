import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/struct/model.dart';
import 'package:flutter_cmp_developers/views/widgets/frequently_used_widgets.dart';

import '../../constants/constants.dart';

List historyList = History.historyList();

class Notifications extends StatelessWidget {
  Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/Home.png',
              fit: BoxFit.cover,
            ),
          ),
          unformSpacing(),
          unformSpacing(),
          Center(
            child: Column(
              children: [
                for (History his in historyList.reversed)
                  purchaseNotiication(his, context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget purchaseNotiication(History histore, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: myWhite,
        borderRadius: BorderRadius.circular(15),
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.abc),
              Text(
                "Sucessful purchase from: ${histore.purchaseLocation}",
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
          Text(
            "Amount: ${histore.amount}",
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
