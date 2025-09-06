import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';

class CustomerPricingCard extends StatelessWidget {
  final String customerName;
  final String address;
  final String price;
  final VoidCallback onEditPressed;

  const CustomerPricingCard({
    Key? key,
    required this.customerName,
    required this.address,
    required this.price,
    required this.onEditPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customerName,
                  style: AppTextStyles.sectionTitle,
                ),
                const SizedBox(height: 6),
                Text(
                  address,
                  style: AppTextStyles.bodyText,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: AppTextStyles.sectionTitle.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: onEditPressed,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: Text(
                    'Edit',
                    style: AppTextStyles.buttonText,
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