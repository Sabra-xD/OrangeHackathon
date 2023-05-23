import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/views/widgets/frequently_used_widgets.dart';

import '../../constants/constants.dart';

// ignore: camel_case_types
class myServices extends StatefulWidget {
  static const routeName = "/myServices";
  const myServices({super.key});

  @override
  State<myServices> createState() => _myServicesState();
}

class _myServicesState extends State<myServices>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    controller = TabController(length: 4, vsync: this);
    controller.index = 1;

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigatiohBar(context, controller),
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/Home.png',
            fit: BoxFit.fill,
          ),
        ),
        Column(
          children: [
            uniformtopSpacing(),
            topName("Devin", context),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              "My Services",
              style: uniformTextStyle(),
            ),
            unformSpacing(),
            Expanded(
              child: Center(
                child: SizedBox(
                  // width: MediaQuery.of(context).size.width * 0.5,
                  // height: MediaQuery.of(context).size.height * 0.5,
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // childAspectRatio: MediaQuery.of(context).size.height,
                    children: <Widget>[
                      gridIconDisplay(context, 'assets/images/withdrawIcon.png',
                          "Wallet", ""),
                      gridIconDisplay(context, 'assets/images/cardIcon.png',
                          "Virtual Card", "/VirtualCard"),
                      gridIconDisplay(context, 'assets/images/requestIcon.png',
                          "Request", "/SendRequest"),
                      gridIconDisplay(context, 'assets/images/securityIcon.png',
                          "Security", ""),
                      gridIconDisplay(context, 'assets/images/shopIcon.png',
                          "Online Shopping", ""),
                      gridIconDisplay(context, 'assets/images/manageIcon.png',
                          "Management", ""),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
