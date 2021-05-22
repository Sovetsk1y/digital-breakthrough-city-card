import 'dart:ui';

import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppTabBar extends StatefulWidget {
  final List<String> items;
  final int initialIndex;
  final void Function(int)? onChanged;

  const AppTabBar({
    Key? key,
    required this.items,
    this.initialIndex = 0,
    this.onChanged,
  }) : super(key: key);

  @override
  _AppTabBarState createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> {
  final double tabBarHeight = 70;

  late int _currentIndex;

  @override
  void initState() {
    super.initState();

    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(16),
      height: tabBarHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.tabBarGrey,
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widget.items
                .map(
                  (item) => Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = widget.items.indexOf(item);
                        });
                        if (widget.onChanged != null) {
                          widget.onChanged!(_currentIndex);
                        }
                      },
                      child: Container(
                        height: tabBarHeight,
                        color: Colors.transparent,
                        child: Center(
                          child: SvgPicture.asset(
                            item,
                            width: 44,
                            height: 44,
                            fit: BoxFit.cover,
                            color: _currentIndex == widget.items.indexOf(item)
                                ? Colors.black
                                : AppColors.grey2,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
