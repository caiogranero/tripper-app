import 'package:flutter/material.dart';

ThemeData ApplicationTheme(BuildContext context) {
  // const Color mainColor = Color.fromRGBO(30, 90, 255, 1);
  const Color mainColor = Color.fromRGBO(0, 55, 207, 1);

  return Theme.of(context).copyWith(
    textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
    primaryTextTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
    accentTextTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
    primaryColor: mainColor,
    accentColor: Color.fromRGBO(255, 140, 32, 1),
    buttonColor: mainColor,
    scaffoldBackgroundColor: Colors.white,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        backgroundColor: mainColor,
        primary: Colors.white,
        textStyle: TextStyle(color: Colors.white),
      ),
    ),
    inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
          contentPadding: EdgeInsets.only(left: 10),
          isCollapsed: true,
        ),
  );
}
