import 'package:flutter/material.dart';
import 'package:nastea_billing/core/extensions/extensions.dart';

class NasteaText extends StatelessWidget {
  final String data;

  // --- shared text properties
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const NasteaText._(
    this.data, {
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  // --------------- FACTORY VARIANTS --------------- //

  factory NasteaText.body(
    String data, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return NasteaText._(
      data,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: NasteaTextStyles.body(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  factory NasteaText.title(
    String data, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return NasteaText._(
      data,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: NasteaTextStyles.title(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  factory NasteaText.heading(
    String data, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return NasteaText._(
      data,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: NasteaTextStyles.heading(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

