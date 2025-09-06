import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../status_chip.dart';

class CustomerDeliveryRecordCard extends StatelessWidget {
  final String date;
  final String time;
  final String bottlesDelivered;
  final String bottlesCollected;
  final String amount;
  final String deliveredBy;
  final String status;

  const CustomerDeliveryRecordCard({
    Key? key,
    required this.date,
    required this.time,
    required this.bottlesDelivered,
    required this.bottlesCollected,
    required this.amount,
    required this.deliveredBy,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: AppTextStyles.cardTitle,
              ),
              StatusChip(
                text: status,
                textColor: AppColors.success,
                backgroundColor: AppColors.successLight,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            time,
            style: AppTextStyles.smallText,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMiniStat(
                icon: Icons.water_drop,
                value: bottlesDelivered,
                label: "Bottles Delivered",
                color: AppColors.primary,
              ),
              _buildMiniStat(
                icon: Icons.recycling,
                value: bottlesCollected,
                label: "Bottles Collected",
                color: AppColors.warning,
              ),
              _buildMiniStat(
                icon: Icons.attach_money,
                value: amount,
                label: "Total Amount",
                color: AppColors.success,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(
                Icons.person,
                size: 16,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                "Delivered by: $deliveredBy",
                style: AppTextStyles.bodyText.copyWith(
                  fontSize: 13,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiniStat({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: color,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: AppTextStyles.smallText.copyWith(
            color: AppColors.textSecondary,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}