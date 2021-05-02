import 'package:flutter/material.dart';
export './theme.dart';

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
const kDebounceDuration = 500;
