import 'package:city_card_novoros/domain/role.dart';
import 'package:city_card_novoros/features/components/bouncing_button.dart';
import 'package:city_card_novoros/features/components/gradient_container.dart';
import 'package:city_card_novoros/features/welcome/welcome_page_widget_model.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:city_card_novoros/utils/svg_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  static const title = 'Привет!';
  static const subtitle = 'Выбери наиболее подходищий тебе вариант';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  const Spacer(),
                  _buildWelcomeInfo(),
                  const Spacer(),
                  SvgPicture.asset(
                    waveSvgPath,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )
                ],
              )),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BouncingButton(
                    child: RoleGradientContainer(
                      borderRadius: BorderRadius.circular(20),
                      roleGradient: RoleGradient.citizen,
                      padding: const EdgeInsets.all(16),
                      child: _buildRoleButtonContent(
                          title: Role.citizen.title,
                          description: roleDescription(role: Role.citizen)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  BouncingButton(
                    child: RoleGradientContainer(
                      borderRadius: BorderRadius.circular(20),
                      roleGradient: RoleGradient.tourist,
                      padding: const EdgeInsets.all(16),
                      child: _buildRoleButtonContent(
                          title: Role.tourist.title,
                          description: roleDescription(role: Role.tourist)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  BouncingButton(
                    child: RoleGradientContainer(
                      borderRadius: BorderRadius.circular(20),
                      roleGradient: RoleGradient.student,
                      padding: const EdgeInsets.all(16),
                      child: _buildRoleButtonContent(
                          title: Role.student.title,
                          description: roleDescription(role: Role.student)),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleButtonContent({
    required String title,
    required String description,
  }) {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: primaryTextSemiBold22.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 2),
            Text(
              description,
              style: secondaryTextRegular13.copyWith(
                color: Colors.white.withOpacity(0.71),
              ),
            )
          ],
        )),
        Expanded(
          flex: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Icon(
              CupertinoIcons.arrow_right,
              size: 22,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/welcome_hand.png',
          height: 57,
          width: 57,
        ),
        const SizedBox(height: 16),
        Text(title, style: primaryTextBold34),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(subtitle,
              style: primaryTextBold20, textAlign: TextAlign.center),
        )
      ],
    );
  }
}
