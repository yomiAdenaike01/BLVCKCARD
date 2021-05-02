import 'package:flutter/material.dart';

const kGray = Color(0xFF6E6E6E);
const kBlack = Color(0xFFF333333);
const kDeepBlack = Color(0xFF121212);
const kDefaultPadding = 20.0;
const kSmallPadding = 5.0;
const kWhiteOpacity = .3;
const kLineHeight = 1.6;
const kBorderRadiusData = 6.0;
const kWhiteBackground = Colors.white24;
const kBorderRadius = BorderRadius.all(
  Radius.circular(
    kBorderRadiusData,
  ),
);
const kRoundedWhiteButtonBackground = BoxDecoration(
  color: kWhiteBackground,
  borderRadius: kBorderRadius,
);
const kCircleRadiusData = 50.0;
const kCircleRadius = BorderRadius.all(
  Radius.circular(
    kCircleRadiusData,
  ),
);
const kIconSize = 15.0;
ThemeData kThemeData = ThemeData.dark().copyWith(
  primaryIconTheme: IconThemeData(
    size: kIconSize,
  ),
  accentIconTheme: IconThemeData(
    size: kIconSize,
  ),
  iconTheme: IconThemeData(
    size: kIconSize,
    color: Colors.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Colors.white,
    ),
  ),
  textTheme: TextTheme(
    bodyText1: const TextStyle(
      height: kLineHeight,
    ),
    bodyText2: const TextStyle(
      height: kLineHeight,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: kDeepBlack,
    selectedItemColor: Colors.white70,
    unselectedItemColor: Colors.white.withOpacity(.7),
    selectedIconTheme: IconThemeData(color: Colors.white),
    showUnselectedLabels: true,
  ),
);
