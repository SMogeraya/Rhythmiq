import 'package:flutter/material.dart';
import 'package:soul_tunes/utils/constants/colors.dart';


class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: SColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: SColors.black),
    selectedColor: SColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: SColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: SColors.darkerGrey,
    labelStyle: TextStyle(color: SColors.white),
    selectedColor: SColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: SColors.white,
  );
}
