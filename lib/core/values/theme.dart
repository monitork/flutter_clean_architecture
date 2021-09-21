import 'package:flutter/material.dart';
import 'colors.dart';
import 'font_family.dart';

final ThemeData themeData = ThemeData(
    fontFamily: FontFamily.productSans,
    brightness: Brightness.light,
    // primarySwatch: MaterialColor(AppColors.orange[500]!.value, AppColors.orange),
    primaryColor: AppColors.primaryColor,
    primaryColorBrightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.accentColor),
    appBarTheme: AppBarTheme(
        color: AppColors.backgroundColor,
        iconTheme: IconThemeData(color: AppColors.accentLightColor)),
    buttonTheme: ButtonThemeData(
        buttonColor: AppColors.accentLightColor,
        disabledColor: AppColors.primaryColorDark));
