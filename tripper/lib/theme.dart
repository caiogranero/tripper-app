import 'package:flutter/material.dart';

class CustomColors {
  static Color mainColor = Color.fromRGBO(0, 55, 207, 1);
  static Color mainColorSoft = Color.fromRGBO(30, 90, 255, 1);
  static Color secondaryColor = Color.fromRGBO(255, 140, 32, 1);
}

ThemeData applicationTheme(BuildContext context) {
  return Theme.of(context).copyWith(
    textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
    primaryTextTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
    accentTextTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
    primaryColor: CustomColors.mainColor,
    accentColor: CustomColors.secondaryColor,
    buttonColor: CustomColors.mainColor,
    scaffoldBackgroundColor: Colors.white,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        onSurface: Colors.yellow,
        padding: EdgeInsets.symmetric(vertical: 15),
        backgroundColor: CustomColors.mainColor,
        primary: Colors.white,
        textStyle: TextStyle(color: Colors.white),
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        letterSpacing: 0.25,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
      ),
      labelColor: Colors.white,
    ),
    inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
          contentPadding: EdgeInsets.only(left: 10),
          isCollapsed: true,
        ),
  );
}
