import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';

final themeData = (BuildContext context) => ThemeData(
    fontFamily: 'Quicksand',
    primaryColor: primaryColor,
    primarySwatch: Colors.teal,
    errorColor: errorColor,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: surfaceColor,
      actionTextColor: textPrimaryColor,
    ),
    iconTheme: IconThemeData(color: primaryColor),
    textTheme: Theme.of(context)
        .textTheme
        .apply(bodyColor: textPrimaryColor, fontFamily: 'Quicksand'),
    scaffoldBackgroundColor: backgroundColor);
