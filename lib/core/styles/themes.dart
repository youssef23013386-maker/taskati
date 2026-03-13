import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskati/core/constants/app_fonts.dart';
import 'package:taskati/core/styles/colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class AppThemes {
  static ThemeData get light => ThemeData(
    fontFamily: AppFonts.LexendDeca,
    scaffoldBackgroundColor: Colors.transparent,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
        minimumSize: Size.zero,
        foregroundColor: AppColors.primaryColor,
      ),
    ),
    dividerColor: Colors.transparent,
    dividerTheme: DividerThemeData(color: AppColors.borderColor),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyles.title.copyWith(
        color: AppColors.blackColor,
        fontFamily: AppFonts.LexendDeca,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.blackColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.backgroundColor,
      filled: true,
      hintStyle: TextStyles.caption1.copyWith(color: AppColors.sacndaryColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    ), 
  );
}
