import "package:flutter/material.dart";
import "package:zenchatai/utils/theme/custom_themes/appbar_theme.dart";
import 'package:zenchatai/utils/theme/custom_themes/elevated_button_theme.dart';
import "package:zenchatai/utils/theme/custom_themes/text_theme.dart";

class ZAppTheme {
  // private constructor
  ZAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Poppins",
      brightness: Brightness.light,
      primaryColor: Colors.yellow,
      scaffoldBackgroundColor: Colors.amber.shade50,
      appBarTheme: ZAppBarTheme.lighAppBarTheme,
      textTheme: ZTextTheme.lightTextTheme,
      elevatedButtonTheme: ZElevationButtonTheme.elevatedBtnLightTheme,
      // checkboxTheme: ZCheckboxTheme.lightCheckboxTheme,
      // bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
      // outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
      // inputDecorationTheme: ZTextFormFieldTheme.lightInputDecorationTheme,
    );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "poppins",
      brightness: Brightness.dark,
      primaryColor: Colors.yellow,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: ZAppBarTheme.darkAppBarTheme,
      textTheme: ZTextTheme.darkTextTheme,
      elevatedButtonTheme: ZElevationButtonTheme.elevatedBtnDarkTheme
    );
}
