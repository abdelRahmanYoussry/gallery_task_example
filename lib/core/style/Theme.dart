import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/mangers/color_manager.dart';
import '../shared/mangers/styles_manager.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.white,
  // useMaterial3: true,
  fontFamily: 'IBMPlexSansArabic',
  primarySwatch: Colors.teal,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light),
    color: Colors.white,
    elevation: 0,
    titleTextStyle: const TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(color: ColorManager.mainPrimaryColor4),
  ),
  textTheme: TextTheme(
      headlineLarge: getBoldBlack24Style(),
      headlineMedium: getBoldBlack24Style(),
      titleLarge: getBoldBlack18Style()),
  datePickerTheme: DatePickerThemeData(
    backgroundColor: ColorManager.white,
    surfaceTintColor: Colors.white,
    cancelButtonStyle: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        ColorManager.mainPrimaryColor4,
      ),
      alignment: AlignmentDirectional.bottomCenter,
      foregroundColor: MaterialStateProperty.all<Color>(
        ColorManager.white,
      ),
      textStyle: MaterialStateProperty.all(getBoldWhite14Style()),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    ),
    confirmButtonStyle: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        ColorManager.mainPrimaryColor4,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      textStyle: MaterialStateProperty.all(getBoldWhite14Style()),
      foregroundColor: MaterialStateProperty.all<Color>(
        ColorManager.mainPrimaryColor4,
      ),
    ),
  ),
);
