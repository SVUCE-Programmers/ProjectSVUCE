import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

showInfoToast(String message) {
  showToast(message,
      textPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      textStyle: TextStyle(
          color: Colors.orange, fontSize: 14, fontWeight: FontWeight.bold),
      backgroundColor: Colors.orange.withOpacity(0.2));
}

showSuccessToast(String message) {
  showToast(message,
      textPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      textStyle: TextStyle(
          color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold),
      backgroundColor: Colors.green.withOpacity(0.2));
}

showWarningToast(String message) {
  showToast(message,
      textPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      textStyle: TextStyle(
          color: Colors.orange, fontSize: 14, fontWeight: FontWeight.bold),
      backgroundColor: Colors.orange.withOpacity(0.2));
}

showErrorToast(String message) {
  showToast(message,
      textPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      textStyle: TextStyle(
          color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold),
      backgroundColor: Colors.red.withOpacity(0.2));
}
