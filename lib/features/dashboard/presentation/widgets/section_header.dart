import 'package:flutter/material.dart';
import 'package:nastea_billing/core/widgets/widgets.dart'
;

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NasteaText.body(
          title,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),

        GestureDetector(
          onTap: onTap,
          child: NasteaText.body(
            actionText,
            color: Color(0xFF146356),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
