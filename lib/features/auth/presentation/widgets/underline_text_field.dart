import 'package:flutter/material.dart';
import 'package:nastea_billing/core/extensions/extensions.dart';

class UnderlineTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool autofocus;
  final bool readOnly;
  final bool canRequestFocus;
  final String? initialValue;
  final String? hintText;

  const UnderlineTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.maxLength,
    this.autofocus = false,
    this.readOnly = false,
    this.canRequestFocus = true,
    this.initialValue,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: 1,
      maxLength: maxLength,
      autofocus: autofocus,
      cursorColor: Colors.black,
      cursorHeight: 26,
      cursorWidth: 1.5,
      readOnly: readOnly,
      canRequestFocus: canRequestFocus,
      initialValue: initialValue,
      style: NasteaTextStyles.body(fontSize: 24, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.all(0),
        isDense: true,
        counterText: '',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
      ),
    );
  }
}
