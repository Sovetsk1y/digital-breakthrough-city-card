import 'package:city_card_novoros/features/feedback/feedback_page.dart';
import 'package:city_card_novoros/utils/svg_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/app_tab_bar.dart';
import 'home/home_page.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  final tabItems = [
    settingsSvgPath,
    cardSvgPath,
    profileSvgPath,
  ];

  var _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _buildCurrentPage(),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppTabBar(
              items: tabItems,
              initialIndex: _currentIndex,
              onChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return Scaffold();
      case 1:
        return HomePage();
      case 2:
        return FeedbackPage();
      default:
        return Scaffold();
    }
  }
}
