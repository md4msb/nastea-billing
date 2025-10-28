import 'package:flutter/material.dart';
import 'package:nastea_billing/core/extensions/nastea_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Widget? prefixIcon;
  final Color? fillColor;
  final bool? obscureText;
  final double? topMargin;

  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.keyboardType,
    this.maxLines,
    this.prefixIcon,
    this.fillColor = const Color(0xFFF6F8FA),
    this.obscureText,
    this.topMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topMargin ?? 8.0,
        bottom: 12,
      ), // Add margin here
      child: TextFormField(
        obscureText: obscureText ?? false,
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          hintText: hintText,
          hintStyle: NasteaTextStyles.body(fontSize: 14, color: Colors.black54),
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 24),
          fillColor: fillColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFFD8DADC), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFFD8DADC), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFFD8DADC), width: 1),
          ),
        ),
      ),
    );
  }
}
