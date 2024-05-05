import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/theme/custom_theme/appbar_theme.dart';
import 'package:flutter_store/app/config/common/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:flutter_store/app/config/common/theme/custom_theme/checkbox_theme.dart';
import 'package:flutter_store/app/config/common/theme/custom_theme/chip_theme.dart';
import 'package:flutter_store/app/config/common/theme/custom_theme/elevated_button_theme.dart';
import 'package:flutter_store/app/config/common/theme/custom_theme/outline_button_theme.dart';
import 'package:flutter_store/app/config/common/theme/custom_theme/text_field_theme.dart';
import 'package:flutter_store/app/config/common/theme/custom_theme/text_theme.dart';

class TAppTheme{
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lighElavatedButtonTheme,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData dartTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppBarTheme.darkAppTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElavatedButtonTheme,
        outlinedButtonTheme: TOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}