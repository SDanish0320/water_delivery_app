import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../status_chip.dart';

class PendingApprovalCard extends StatelessWidget {
  final String companyName;
  final String adminName;
  final String address;
  final String registeredDate;
  final VoidCallback? onApprove;
  final VoidCallback? onReject;

  const PendingApprovalCard({
    Key? key,
    required this.companyName,
    required this.adminName,
    required this.address,
    required this.registeredDate,
    this.onApprove,
    this.onReject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.warningLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.business,
                  color: AppColors.warning,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(companyName, style: AppTextStyles.cardTitle),
                    const SizedBox(height: 2),
                    Text(
                      'Admin: $adminName',
                      style: AppTextStyles.bodyText,
                    ),
                  ],
                ),
              ),
              const StatusChip(
                text: 'PENDING',
                textColor: AppColors.warning,
                backgroundColor: AppColors.warningLight,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(address, style: AppTextStyles.bodyText),
          Text(
            'Registered: $registeredDate',
            style: AppTextStyles.smallText,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onApprove,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Approve',
                    style: AppTextStyles.buttonText.copyWith(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: onReject,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.danger,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Reject',
                    style: AppTextStyles.buttonText.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}