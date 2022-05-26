import 'package:flutter/material.dart';


const bgGrad = BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.0, 0.3, 0.7, 1],
  colors: [
    Color(0xFF5F516F),
    Color(0xFF062C43),
    Color(0xFF5591A9),
    Color(0xFFB88D7C),
  ],
));

const alarmGrad = BoxDecoration(
  backgroundBlendMode: BlendMode.screen,
  shape: BoxShape.rectangle,
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(32), bottomLeft: Radius.circular(32)),
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


MaterialApp(
  theme: ThemeData(
    // splashColor: Colors.amber,
    textTheme: TextTheme(
      // 64 36 32 16 10
      // black  heavy bold
      headline1: const TextStyle(fontSize: 64, fontWeight: FontWeight.w900, fontFamily: 'SF Pro Display'),
      headline2: const TextStyle(fontSize: 36, fontWeight: FontWeight.w900, fontFamily: 'SF Pro Display'),
      bodyText1: const TextStyle(fontSize: 32, fontWeight: FontWeight.w800, fontFamily: 'SF Pro Display'),
      bodyText2: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, fontFamily: 'SF Pro Display'),
      labelSmall: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, fontFamily: 'SF Pro Display'),
    ),
  ),
)
