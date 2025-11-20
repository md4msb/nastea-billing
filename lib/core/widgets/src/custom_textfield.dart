import 'package:flutter/material.dart';
import '../../extensions/extensions.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final double borderRadius;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Color? fillColor;
  final Color borderColor;

  final EdgeInsetsGeometry? margin;

  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.keyboardType,
    this.maxLines,
    this.borderRadius = 10,
    this.prefixIcon,
    this.obscureText,
    this.fillColor = const Color(0xFFF6F8FA),
    this.borderColor = const Color(0xFFD8DADC),
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        cursorColor: Colors.black,
        cursorWidth: 1,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: NasteaTextStyles.body(fontSize: 14, color: Colors.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          hintText: hintText,
          hintStyle: NasteaTextStyles.body(fontSize: 14, color: Colors.black54),
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 24),
          fillColor: fillColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
        ),
      ),
    );
  }
}
