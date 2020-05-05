import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';

final themeData = ThemeData(
    fontFamily: 'Quicksand',
    primaryColor: primaryColor,
    primarySwatch: Colors.teal,
    errorColor: errorColor,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: surfaceColor,
      actionTextColor: textPrimaryColor,
    ),
    scaffoldBackgroundColor: backgroundColor);
