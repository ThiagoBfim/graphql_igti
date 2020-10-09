import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {

  // const Color.fromRGBO(119, 209, 196, 1).withOpacity(0.7),
  // const Color.fromRGBO(9, 173, 162, 1).withOpacity(0.9),
  // const Color(0xFF00CCFF).withOpacity(0.9),

  static  MaterialColor primarySwatch = MaterialColor(
    5,
    <int, Color>{
      50: Color(0xFFEDE7F6),
      100: Color(0xFF77D1C4),
      200: Color(0xFF77D1C4),
      300: Color(0xFF77D1C4).withOpacity(0.7),
      400: Color(0xFF77D1C4),
      500: Color(0xFF77D1C4),
      600: Color(0xFF09ADA2).withOpacity(0.8),
      700: Color(0xFF09ADA2),
      800: Color(0xFF079191).withOpacity(0.9),
      900: Color(0xFF077391),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primaryColor: primarySwatch[500],
        accentColor: primarySwatch[600]
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
