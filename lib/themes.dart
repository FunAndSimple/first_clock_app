import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
  
  static Decoration get cardGrad {
    return const BoxDecoration(
      backgroundBlendMode: BlendMode.screen,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(32)),
      // borderRadius: BorderRadius.only(
      // topLeft: Radius.circular(32), bottomLeft: Radius.circular(32)),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.1, 0.4, 0.9],
        colors: [
          Color(0xFFDAE9F1),
          Color(0xFF104066),
          Color(0xFF463A4E),
        ],
      ),
    );
  }

  static ThemeData get lightTheme {
    const lightTextColor = Colors.black;

    return ThemeData(
        textTheme: const TextTheme(
      headline1: TextStyle(
          color: lightTextColor,
          fontSize: 64,
          fontWeight: FontWeight.w900,
          fontFamily: 'SF Pro Display'),
      headline2: TextStyle(
          color: lightTextColor,
          fontSize: 36,
          fontWeight: FontWeight.w900,
          fontFamily: 'SF Pro Display'),
      bodyText1: TextStyle(
          color: lightTextColor,
          fontSize: 32,
          fontWeight: FontWeight.w800,
          fontFamily: 'SF Pro Display'),
      bodyText2: TextStyle(
          color: lightTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w800,
          fontFamily: 'SF Pro Display'),
      caption: TextStyle(
          color: lightTextColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          fontFamily: 'SF Pro Display'),
    ));
  }

  static ThemeData get darkTheme {
    const darkTextColor = Colors.white;

    return ThemeData(
        textTheme: const TextTheme(
      headline1: TextStyle(
          color: darkTextColor,
          fontSize: 64,
          fontWeight: FontWeight.w900,
          fontFamily: 'SF Pro Display'),
      headline2: TextStyle(
          color: darkTextColor,
          fontSize: 30,
          fontWeight: FontWeight.w900,
          fontFamily: 'SF Pro Display'),
      bodyText1: TextStyle(
          color: darkTextColor,
          fontSize: 32,
          fontWeight: FontWeight.w800,
          fontFamily: 'SF Pro Display'),
      bodyText2: TextStyle(
          color: darkTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w800,
          fontFamily: 'SF Pro Display'),
      caption: TextStyle(
          color: darkTextColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          fontFamily: 'SF Pro Display'),
    ));
  }
}
