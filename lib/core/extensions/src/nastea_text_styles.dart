import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension NasteaTextStyles on TextStyle {
  static TextStyle heading({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) => GoogleFonts.playfairDisplay(
    fontSize: fontSize ?? 22,
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color,
    fontStyle: fontStyle,
  );

  static TextStyle body({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) => GoogleFonts.inter(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontStyle: fontStyle,
  );

  static TextStyle title({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) => GoogleFonts.poppins(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontStyle: fontStyle,
  );
}
