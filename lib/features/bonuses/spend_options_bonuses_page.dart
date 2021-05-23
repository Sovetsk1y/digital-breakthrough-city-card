import 'package:city_card_novoros/features/bonuses/spend_bonuses_selected_option_page.dart';
import 'package:city_card_novoros/features/components/back_button.dart';
import 'package:city_card_novoros/features/components/bouncing_button.dart';
import 'package:city_card_novoros/features/components/gradient_container.dart';
import 'package:city_card_novoros/features/components/option_container.dart';
import 'package:city_card_novoros/features/components/role_provider.dart';
import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpendOptionsBonusesPage extends StatefulWidget {
  SpendOptionsBonusesPage({Key? key}) : super(key: key);

  @override
  _SpendBonusesPageState createState() => _SpendBonusesPageState();
}

class _SpendBonusesPageState extends State<SpendOptionsBonusesPage> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    final role = RoleProvider.of(context)!.role;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: AppBackButton(
                backgroundColor: AppColors.grey2,
              ),
            ),
          ],
        ),
        title: Text(
          'Бонусный счет',
          style: primaryTextSemiBold22,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                const SizedBox(width: 30),
                Text(
                  '134,32',
                  style: primaryTextBold34,
                ),
                const SizedBox(width: 8),
                Icon(
                  CupertinoIcons.money_rubl_circle_fill,
                  size: 28,
                )
              ],
            ),
          ),
          _buildOptions(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BouncingButton(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RoleProvider(
                      role: role, child: SpendBonusesSelectedOptionPage()))),
              child: RoleGradientContainer(
                borderRadius: BorderRadius.circular(14),
                roleGradient:
                    RoleGradientExt.fromRole(RoleProvider.of(context)!.role),
                child: SizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      'Продолжить',
                      style:
                          secondaryTextSemiBold17.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            'Как вы хотите воспользоваться бонусами?',
            style: primaryTextSemiBold22.copyWith(color: AppColors.grey2),
          ),
          const SizedBox(height: 16),
          OptionContainer(
            onTap: () {
              setState(() {
                _selectedIndex = 0;
              });
            },
            child: Center(
              child: Text(
                'Мобильный',
                style: secondaryTextSemiBold17.copyWith(
                    color: _selectedIndex == 0 ? Colors.white : Colors.black),
              ),
            ),
            isSelected: _selectedIndex == 0,
          ),
          const SizedBox(height: 8),
          OptionContainer(
            onTap: () {
              setState(() {
                _selectedIndex = 1;
              });
            },
            child: Center(
              child: Text(
                'Коммуналка',
                style: secondaryTextSemiBold17.copyWith(
                    color: _selectedIndex == 1 ? Colors.white : Colors.black),
              ),
            ),
            isSelected: _selectedIndex == 1,
          ),
          const SizedBox(height: 8),
          OptionContainer(
            onTap: () {
              setState(() {
                _selectedIndex = 2;
              });
            },
            child: Center(
              child: Text(
                'Интернет/Телевидение',
                style: secondaryTextSemiBold17.copyWith(
                    color: _selectedIndex == 2 ? Colors.white : Colors.black),
              ),
            ),
            isSelected: _selectedIndex == 2,
          ),
          const SizedBox(height: 8),
          OptionContainer(
            onTap: () {
              setState(() {
                _selectedIndex = 3;
              });
            },
            child: Center(
              child: Text(
                'Перевести на городскую карту',
                style: secondaryTextSemiBold17.copyWith(
                    color: _selectedIndex == 3 ? Colors.white : Colors.black),
              ),
            ),
            isSelected: _selectedIndex == 3,
          ),
        ],
      ),
    );
  }
}
