import 'package:flutter/material.dart';

import 'archievements_body/archievements_body.dart';
import 'home_body/home_body.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _pageController = PageController();
  late final _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            HomeBody(),
            ArchievementsBody(),
          ],
        ),
      ),
      // body: PageView(
      //   controller: _pageController,
      //   children: [
      //     HomeBody(),
      //     ArchievementsBody(),
      //   ],
      // ),
    );
  }
}
