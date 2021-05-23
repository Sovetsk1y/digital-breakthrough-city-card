import 'package:city_card_novoros/features/components/role_provider.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:city_card_novoros/domain/role.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(29.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 88),
            Row(
              children: [
                Image.asset('assets/images/christian.png'),
                const SizedBox(width: 14),
                Text(
                  'Прокопенко Василий Аркадидевич',
                  style: primaryTextRegular13,
                ),
              ],
            ),
            const SizedBox(height: 33),
            Text(
              'Платежные способы',
              style: primaryTextSemiBold22,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Apple Pay',
                  style: primaryTextRegular13,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: Center(
                    child: Container(
                      width: 11,
                      height: 11,
                      decoration: BoxDecoration(
                          color: RoleProvider.of(context)!.role.color,
                          shape: BoxShape.circle),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Добавить',
                  style: primaryTextRegular13,
                ),
                Icon(CupertinoIcons.add_circled_solid)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
