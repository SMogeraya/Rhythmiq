import 'package:flutter/material.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/theme/widget_themes/appbar_theme.dart';
import 'package:soul_tunes/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:soul_tunes/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:soul_tunes/utils/theme/widget_themes/chip_theme.dart';
import 'package:soul_tunes/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:soul_tunes/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:soul_tunes/utils/theme/widget_themes/text_field_theme.dart';
import 'package:soul_tunes/utils/theme/widget_themes/text_theme.dart';
//import 'package:soul_tunes/utils/theme/widget_themes/appbar_theme.dart';


class SAppTheme {
  SAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: SColors.grey,
    brightness: Brightness.light,
    primaryColor: SColors.primary,
    textTheme: STextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: SColors.white,
    appBarTheme: SAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: SOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: STextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: SColors.grey,
    brightness: Brightness.dark,
    primaryColor: SColors.primary,
    textTheme: STextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: SColors.black,
    appBarTheme: SAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: SElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: SOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: STextFormFieldTheme.darkInputDecorationTheme,
  );
}
