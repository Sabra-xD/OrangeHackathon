import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/constants/constants.dart';
import 'package:flutter_cmp_developers/views/widgets/frequently_used_widgets.dart';

import '../../struct/model.dart';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class transactionHistory extends StatelessWidget {
  final History history;
  const transactionHistory({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(history.purchaseLocation!,
                        style: uniformTextStyle())),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    history.transactionType!
                        ? "-${history.amount}"
                        : "+${history.amount}",
                    style: uniformTextStyle(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  history.timeofTransaction!,
                  style: uniformTextStyle(),
                ),
                Text(
                  history.status! ? "APPROVED" : "FAILED",
                  style: TextStyle(
                    fontSize: transactionFontSize,
                    color: history.status! ? Colors.lightGreen : Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
