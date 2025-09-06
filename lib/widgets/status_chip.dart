import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';

class StatusChip extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;

  const StatusChip({
    Key? key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: AppTextStyles.statusText.copyWith(color: textColor),
      ),
    );
  }
}