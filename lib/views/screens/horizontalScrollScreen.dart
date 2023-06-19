// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/controllers/widgetFocus.dart';
import 'package:flutter_cmp_developers/views/widgets/homePage.dart';
import 'package:flutter_cmp_developers/views/widgets/servicesScreen.dart';
import 'package:flutter_cmp_developers/views/widgets/settingScreen.dart';

import '../widgets/frequently_used_widgets.dart';
import '../widgets/virtualCard.dart';

class horizontalScroll extends StatefulWidget {
  const horizontalScroll({super.key});
  static const routeName = '/horizontalScroll';

  @override
  State<horizontalScroll> createState() => _horizontalScroll();
}

class _horizontalScroll extends State<horizontalScroll>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  // ignore: non_constant_identifier_names
  final AppLifeCycle _Cycle = AppLifeCycle();
  late TabController _tabController;
  late bool _paused;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    _paused = _Cycle.backGroundState(state);
    print(_paused);
    if (_paused) {
      await Future.delayed(Duration(seconds: 10));
      print("PASSED THE 5 SECONDS WAITING");
      if (state == AppLifecycleState.paused) {
        print("STOPPED WAITING AND FUCKED UP");
        _Cycle.checkfivesecondsPass(state);
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    WidgetsBinding.instance.removeObserver(this);

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
