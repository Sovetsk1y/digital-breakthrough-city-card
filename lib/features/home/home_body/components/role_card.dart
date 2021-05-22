import 'dart:math';

import 'package:city_card_novoros/domain/role.dart';
import 'package:city_card_novoros/features/components/bouncing_button.dart';
import 'package:city_card_novoros/features/components/gradient_container.dart';
import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:city_card_novoros/utils/svg_paths.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RoleCard extends StatelessWidget {
  final Role role;
  const RoleCard({
    Key? key,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FlipCard(
        back: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 32,
              color: Colors.black.withOpacity(.16),
            )
          ]),
          child: RoleGradientContainer(
            borderRadius: BorderRadius.circular(20),
            roleGradient: RoleGradientExt.fromRole(role),
            child: _buildBack(context),
          ),
        ),
        front: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 32,
              color: Colors.black.withOpacity(.16),
            )
          ]),
          child: RoleGradientContainer(
            borderRadius: BorderRadius.circular(20),
            roleGradient: RoleGradientExt.fromRole(role),
            child: _buildFront(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBack(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.5),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Center(
                child: Text(
                  '2345 2523 4548 0923',
                  style: secondaryTextRegular13.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: const SizedBox(width: 16),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Image.asset(
                'assets/images/barcode.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/qrcode.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }

  Column _buildFront(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SvgPicture.asset(
            doubleWaveSvgPath,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Expanded(
          child: _buildBalanceRow(),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 16, bottom: 18),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Бонусы',
                        style: secondaryTextRegular13.copyWith(
                            color: Colors.black),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            '134,32',
                            style: primaryTextSemiBold15.copyWith(
                                color: Colors.white),
                          ),
                          const SizedBox(width: 2),
                          Icon(
                            CupertinoIcons.money_rubl_circle_fill,
                            color: Colors.white,
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: BouncingButton(
                    child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Использовать бонусы',
                          style: secondaryTextRegular13.copyWith(
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding _buildBalanceRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '17 534,73',
                style: primaryTextBold25.copyWith(color: Colors.white),
              ),
              const SizedBox(width: 2),
              Icon(
                CupertinoIcons.money_rubl_circle_fill,
                color: Colors.white,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Пополнить',
                style: secondaryTextRegular13.copyWith(color: Colors.black),
              ),
              const SizedBox(width: 6),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.25),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Icon(
                    CupertinoIcons.add_circled_solid,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
