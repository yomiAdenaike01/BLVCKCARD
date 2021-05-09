import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData kThemeData = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: kDeepBlack,
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
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: kBorderRadius,
    ),
    fillColor: kWhiteBackground,
    filled: true,
    contentPadding: EdgeInsets.zero,
    focusedBorder: OutlineInputBorder(
      borderRadius: kBorderRadius,
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: kBorderRadius,
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
