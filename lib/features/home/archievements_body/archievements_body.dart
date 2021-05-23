import 'package:city_card_novoros/domain/archievements/archievement.dart';
import 'package:city_card_novoros/domain/restaurants/restaurant.dart';
import 'package:city_card_novoros/features/components/blur_overlay.dart';
import 'package:city_card_novoros/features/components/bouncing_button.dart';
import 'package:city_card_novoros/features/components/role_provider.dart';
import 'package:city_card_novoros/features/home/archievements_body/archievements_body_model.dart';
import 'package:city_card_novoros/features/home/archievements_body/components/archievement_detailed_bottom_sheet.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'components/archievement_container.dart';

class ArchievementsBody extends StatefulWidget {
  ArchievementsBody({Key? key}) : super(key: key);

  @override
  _ArchievementsBodyState createState() => _ArchievementsBodyState();
}

class _ArchievementsBodyState extends State<ArchievementsBody> {
  bool _showingArchievement = false;

  void _navigateToArchievement(Archievement archievement) {
    final role = RoleProvider.of(context)!.role;
    showMaterialModalBottomSheet(
        animationCurve: Curves.easeInOut,
        context: context,
        backgroundColor: Colors.transparent,
        expand: true,
        builder: (context) => RoleProvider(
            role: role,
            child: ArchievementDetailedBottomSheet(
              archievement: archievement,
            )));
  }

  @override
  Widget build(BuildContext context) {
    final role = RoleProvider.of(context)!.role;
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/diamond.png'),
                      const SizedBox(height: 16),
                      Text(
                        'Выполняй задания и получай за них награды и бонусы',
                        textAlign: TextAlign.center,
                        style: secondaryTextSemiBold17.copyWith(
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Собери все достижения и получи награду!',
                        textAlign: TextAlign.center,
                        style: primaryTextSemiBold20,
                      ),
                      const SizedBox(height: 33),
                      Text(
                        'Достижения',
                        style: primaryTextSemiBold20,
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: GridView.builder(
                            shrinkWrap: true,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16).add(
                              EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.3),
                            ),
                            itemCount: archievements.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 1.33,
                            ),
                            itemBuilder: (context, index) {
                              return BouncingButton(
                                  onTap: () => _navigateToArchievement(
                                      archievements[index]),
                                  child: ArchievementContainer(
                                    role: role,
                                    archievement: archievements[index],
                                  ));
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        BlurOverlay(show: _showingArchievement),
      ],
    );
  }
}
