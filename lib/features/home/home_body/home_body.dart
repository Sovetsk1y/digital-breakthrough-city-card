import 'package:city_card_novoros/features/components/role_provider.dart';
import 'package:flutter/material.dart';

import 'components/role_card.dart';

class HomeBody extends StatefulWidget {
  HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.734,
            child: RoleCard(
              role: RoleProvider.of(context)!.role,
            ),
          ),
          Expanded(
            flex: 0,
            child: Placeholder(
              color: Colors.orange[800]!,
            ),
          ),
          Expanded(
            child: Placeholder(
              color: Colors.orange[800]!,
            ),
          ),
        ],
      ),
    );
  }
}
