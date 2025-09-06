import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../status_chip.dart';

class CustomerActivityItem extends StatelessWidget {
  final String title;
  final String deliveredBy;
  final String date;
  final String amount;
  final String status;

  const CustomerActivityItem({
    Key? key,
    required this.title,
    required this.deliveredBy,
    required this.date,
    required this.amount,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.successLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.check,
              color: AppColors.success,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.cardTitle,
                    ),
                    const Spacer(),
                    StatusChip(
                      text: status,
                      textColor: AppColors.success,
                      backgroundColor: AppColors.successLight,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  deliveredBy,
                  style: AppTextStyles.bodyText,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      date,
                      style: AppTextStyles.smallText,
                    ),
                    const Spacer(),
                    Text(
                      amount,
                      style: AppTextStyles.cardTitle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}