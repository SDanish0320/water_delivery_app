import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../status_chip.dart';

class DeliveryCard extends StatelessWidget {
  final String name;
  final String address;
  final String? bottles;
  final String? price;
  final String? phone;
  final String? amount;
  final String status;
  final Color statusColor;
  final Color statusBgColor;
  final bool showCompleteButton;
  final bool showActionButtons;
  final int? number;
  final VoidCallback? onComplete;
  final VoidCallback? onTap;

  const DeliveryCard({
    Key? key,
    required this.name,
    required this.address,
    this.bottles,
    this.price,
    this.phone,
    this.amount,
    required this.status,
    required this.statusColor,
    required this.statusBgColor,
    this.showCompleteButton = false,
    this.showActionButtons = false,
    this.number,
    this.onComplete,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (number != null)
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: statusBgColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        number.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: statusColor,
                        ),
                      ),
                    ),
                  )
                else
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        name.isNotEmpty ? name[0].toUpperCase() : 'U',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              name,
                              style: AppTextStyles.cardTitle.copyWith(
                                fontSize: number != null ? 14 : 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          StatusChip(
                            text: status,
                            textColor: statusColor,
                            backgroundColor: statusBgColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: AppColors.textTertiary,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              address,
                              style: AppTextStyles.bodyText,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (bottles != null && bottles!.isNotEmpty) ...[
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.water_drop,
                              size: 16,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(bottles!, style: AppTextStyles.bodyText),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (showActionButtons || showCompleteButton) ...[
              const SizedBox(height: 16),
              if (showActionButtons)
                Row(
                  children: [
                    if (price != null)
                      Expanded(
                        flex: 2,
                        child: _buildInfoCard(
                          Icons.water_drop,
                          AppColors.primary,
                          AppColors.primaryLight,
                          price!,
                        ),
                      ),
                    if (price != null && phone != null) const SizedBox(width: 8),
                    if (phone != null)
                      Expanded(
                        flex: 2,
                        child: _buildInfoCard(
                          Icons.phone,
                          AppColors.primary,
                          AppColors.primaryLight,
                          phone!,
                        ),
                      ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                )
              else if (showCompleteButton)
                Row(
                  children: [
                    if (bottles != null) ...[
                      const Icon(
                        Icons.water_drop,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$bottles bottles',
                        style: AppTextStyles.bodyText,
                      ),
                    ],
                    if (amount != null) ...[
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.attach_money,
                        size: 16,
                        color: AppColors.success,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        amount!,
                        style: AppTextStyles.smallText.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                    const Spacer(),
                    ElevatedButton(
                      onPressed: onComplete,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.cardBackground,
                        foregroundColor: Colors.grey.shade700,
                        elevation: 0,
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        'Complete',
                        style: AppTextStyles.buttonText,
                      ),
                    ),
                  ],
                ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, Color iconColor, Color bgColor, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: iconColor),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              text,
              style: AppTextStyles.smallText.copyWith(
                fontWeight: FontWeight.w600,
                color: iconColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}