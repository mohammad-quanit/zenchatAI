import "package:flutter/material.dart";
import "package:zenchatai/utils/constants/colors.dart";
import "package:zenchatai/utils/theme/custom_themes/appbar_theme.dart";
import "package:zenchatai/utils/theme/custom_themes/bottom_sheet_theme.dart";
import "package:zenchatai/utils/theme/custom_themes/checkbox_theme.dart";
import "package:zenchatai/utils/theme/custom_themes/chip_theme.dart";
import 'package:zenchatai/utils/theme/custom_themes/elevated_button_theme.dart';
import "package:zenchatai/utils/theme/custom_themes/outlined_button_theme.dart";
import "package:zenchatai/utils/theme/custom_themes/text_theme.dart";
import "package:zenchatai/utils/theme/custom_themes/textform_field_theme.dart";

class ZAppTheme {
  // private constructor
  ZAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "PlayfairDisplay",
      disabledColor: ZColors.grey,
      brightness: Brightness.light,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.green.shade50,
      appBarTheme: ZAppBarTheme.lighAppBarTheme,
      textTheme: ZTextTheme.lightTextTheme,
      elevatedButtonTheme: ZElevationButtonTheme.elevatedBtnLightTheme,
      checkboxTheme: ZCheckboxTheme.lightCheckboxTheme,
      outlinedButtonTheme: ZOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: ZTextFormFieldTheme.lightInputDecorationTheme,
      bottomSheetTheme: ZBottomSheetTheme.lightBottomSheetTheme,
      chipTheme: ZChipTheme.lightChipTheme,
    );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "PlayfairDisplay",
      disabledColor: ZColors.grey,
      brightness: Brightness.dark,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: ZAppBarTheme.darkAppBarTheme,
      textTheme: ZTextTheme.darkTextTheme,
      elevatedButtonTheme: ZElevationButtonTheme.elevatedBtnDarkTheme,
      checkboxTheme: ZCheckboxTheme.darkCheckboxTheme,
      outlinedButtonTheme: ZOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: ZTextFormFieldTheme.darkInputDecorationTheme,
      bottomSheetTheme: ZBottomSheetTheme.darkBottomSheetTheme,
      chipTheme: ZChipTheme.darkChipTheme,
    );
}
