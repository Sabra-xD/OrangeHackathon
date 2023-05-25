import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/views/widgets/frequently_used_widgets.dart';

Stack servicesScreen(BuildContext context, PageController _pageController) {
  return Stack(children: [
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
        topName("Devin", context, _pageController),
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
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                // childAspectRatio: MediaQuery.of(context).size.height,
                children: <Widget>[
                  gridIconDisplay(context, 'assets/images/withdrawIcon.png',
                      "Wallet", "", _pageController, 2),
                  gridIconDisplay(context, 'assets/images/cardIcon.png',
                      "Virtual Card", "/VirtualCard", _pageController, 0),
                  gridIconDisplay(context, 'assets/images/requestIcon.png',
                      "Request", "/SendRequest", _pageController, 0),
                  gridIconDisplay(context, 'assets/images/securityIcon.png',
                      "Security", "", _pageController, 0),
                  gridIconDisplay(context, 'assets/images/shopIcon.png',
                      "Online Shopping", "", _pageController, 0),
                  gridIconDisplay(context, 'assets/images/manageIcon.png',
                      "Management", "", _pageController, 0),
                ],
              ),
            ),
          ),
        ),
      ],
    )
  ]);
}
