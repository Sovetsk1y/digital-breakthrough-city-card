import 'package:city_card_novoros/features/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

const appTitle = 'Единая Карта Города';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: appTitle,
      home: WelcomePage(),
    );
  }
}

final theme = ThemeData(
  fontFamily: 'SF Pro Rounded',
  scaffoldBackgroundColor: Colors.white,
);
