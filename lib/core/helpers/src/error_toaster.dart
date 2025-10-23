import 'package:flutter/material.dart';

import '../../extensions/nastea_text_styles.dart';

class ErrorToaster {
  static void showError(BuildContext context, {String? message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message ?? "An error occurred",
          style: NasteaTextStyles.body(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
