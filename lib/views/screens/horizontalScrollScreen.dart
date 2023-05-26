import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/views/widgets/homePage.dart';
import 'package:flutter_cmp_developers/views/widgets/servicesScreen.dart';
import 'package:flutter_cmp_developers/views/widgets/settingScreen.dart';

import '../widgets/frequently_used_widgets.dart';
import '../widgets/virtualCard.dart';

class horizontalScroll extends StatefulWidget {
  horizontalScroll({super.key});
  static const routeName = '/horizontalScroll';

  @override
  State<horizontalScroll> createState() => _horizontalScroll();
}

class _horizontalScroll extends State<horizontalScroll>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(initialPage: 0);
    return Scaffold(
      bottomNavigationBar:
          bottomNavigatiohBar(context, _tabController, _pageController),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (int pageIndex) {
          setState(() {
            _tabController.index = pageIndex;
            print(_tabController.index);
          });
          print("Current page index ${pageIndex}");
        },
        children: [
          homePage(context, "150", "1050", "750", _pageController),
          servicesScreen(context, _pageController),
          virtualCard(context),
          settings(context, _pageController),
        ],
      ),
    );
  }
}