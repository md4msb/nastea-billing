import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class ErrorToaster {
  static void showError(BuildContext context, {String? message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: NasteaText.body(
          message ?? "An error occurred",
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
