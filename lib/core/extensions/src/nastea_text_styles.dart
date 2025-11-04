import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension NasteaTextStyles on TextStyle {
  static TextStyle heading({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) => GoogleFonts.playfairDisplay(
    fontSize: fontSize ?? 22,
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color,
  );

  static TextStyle body({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) => GoogleFonts.inter(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );

  static TextStyle title({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) => GoogleFonts.poppins(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
