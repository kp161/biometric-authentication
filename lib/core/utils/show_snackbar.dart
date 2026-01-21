import 'package:biometric_login/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(content)));
}

void showErrorSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text(content), backgroundColor: AppColors.errorColor),
    );
}

void showFlushBar({
  required BuildContext context,
  required String message,
  bool isError = true,
}) {
  if (!context.mounted) return;
  Flushbar(
    message: message,
    backgroundColor: isError ? AppColors.errorColor : Colors.green,
    duration: Duration(seconds: 3),
    margin: EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(8),
    flushbarPosition: FlushbarPosition.TOP,
    icon: Icon(
      isError ? Icons.error_outline : Icons.check_circle_outline,
      color: Colors.white,
    ),
  ).show(context);
}
