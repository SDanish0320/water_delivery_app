import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';

class DeliverySummaryCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String value;
  final String label;
  final String? subValue;

  const DeliverySummaryCard({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.value,
    required this.label,
    this.subValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140, // Increased height to prevent overflow
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8), // Reduced padding
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(8), // Smaller radius
                ),
                child: Icon(icon, size: 18, color: iconColor), // Smaller icon
              ),
              const SizedBox(width: 8), // Reduced spacing
              Expanded(
                child: Text(
                  label,
                  style: AppTextStyles.smallText.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8), // Reduced spacing
          Text(
            value,
            style: TextStyle(
              fontSize: 24, // Reduced font size
              fontWeight: FontWeight.w600,
              color: iconColor,
            ),
          ),
          const Spacer(),
          if (subValue != null && subValue!.isNotEmpty)
            Text(
              subValue!,
              style: AppTextStyles.smallText.copyWith(
                color: AppColors.textTertiary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          else
            const SizedBox(height: 12), // Reduced placeholder space
        ],
      ),
    );
  }
}