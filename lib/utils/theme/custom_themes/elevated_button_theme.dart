import 'package:flutter/material.dart';
import 'package:zenchatai/utils/constants/colors.dart';

class ZElevationButtonTheme {
  ZElevationButtonTheme._();

  static ElevatedButtonThemeData elevatedBtnLightTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: ZColors.white,
              backgroundColor: ZColors.primary,
              disabledForegroundColor: Colors.grey,
              disabledBackgroundColor: Colors.grey,
              side: const BorderSide(color: ZColors.primary),
              padding: const EdgeInsets.symmetric(vertical: 12),
              textStyle: const TextStyle(
                  // fontFamily: "PlayfairDisplay",
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))));

  static ElevatedButtonThemeData elevatedBtnDarkTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: ZColors.white,
          backgroundColor: ZColors.primary,
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey,
          side: const BorderSide(color: ZColors.primary),
          padding: const EdgeInsets.symmetric(vertical: 12),
          textStyle: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))));
}
