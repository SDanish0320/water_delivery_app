import 'package:flutter/material.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';
import 'package:water_delivery_app/widgets/common_app_bar.dart';
import 'package:water_delivery_app/widgets/stat_card.dart';
import 'package:water_delivery_app/widgets/customer/customer_delivery_record_card.dart';

class DeliveryRecordsScreen extends StatelessWidget {
  const DeliveryRecordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        title: 'Delivery Records',
        showNotification: false,
        showLogout: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_list,
              color: AppColors.primary,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search deliveries..",
                  hintStyle: AppTextStyles.bodyText.copyWith(
                    color: AppColors.textTertiary,
                  ),
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: AppColors.textTertiary,
                    size: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: StatCard(
                    icon: Icons.local_shipping,
                    iconColor: AppColors.primary,
                    iconBgColor: AppColors.primaryLight,
                    value: '1',
                    label: 'Total Deliveries',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    icon: Icons.water_drop,
                    iconColor: AppColors.primary,
                    iconBgColor: AppColors.primaryLight,
                    value: '2',
                    label: 'Total Bottles',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    icon: Icons.attach_money,
                    iconColor: AppColors.success,
                    iconBgColor: AppColors.successLight,
                    value: '\$50.00',
                    label: 'Total Amount',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            const CustomerDeliveryRecordCard(
              date: 'Saturday, August 16, 2025',
              time: '05:14 PM',
              bottlesDelivered: '2',
              bottlesCollected: '2',
              amount: '\$50.00',
              deliveredBy: 'Ubaid',
              status: 'DELIVERED',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompactStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 26, color: color),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
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
      ),
    );
  }
}