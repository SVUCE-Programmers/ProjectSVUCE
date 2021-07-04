import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

showInfoToast(String message, {ToastPosition toastPosition}) {
  showToast(message,
      position: toastPosition ?? ToastPosition.bottom,
      textStyle: TextStyle(
          color: Colors.orange, fontSize: 14, fontWeight: FontWeight.bold),
      backgroundColor: Colors.orange.withOpacity(0.2));
}

showSuccessToast(String message, {ToastPosition toastPosition}) {
  showToast(message,
      position: toastPosition ?? ToastPosition.bottom,
      textStyle: TextStyle(
          color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold),
      backgroundColor: Colors.green.withOpacity(0.2));
}

showWarningToast(String message, {ToastPosition toastPosition}) {
  showToast(message,
      position: toastPosition ?? ToastPosition.bottom,
      textStyle: TextStyle(
          color: Colors.orange, fontSize: 14, fontWeight: FontWeight.bold),
      backgroundColor: Colors.orange.withOpacity(0.2));
}

showErrorToast(String message, {ToastPosition toastPosition}) {
  showToast(message,
      position: toastPosition ?? ToastPosition.bottom,
      textStyle: TextStyle(
          color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold),
      backgroundColor: Colors.red.withOpacity(0.2));
}
