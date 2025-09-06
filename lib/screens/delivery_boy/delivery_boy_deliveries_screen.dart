import 'package:flutter/material.dart';
import 'package:water_delivery_app/utils/date_time_helper.dart';
import 'package:water_delivery_app/widgets/common_app_bar.dart';
import 'package:water_delivery_app/widgets/stat_card.dart';
import 'package:water_delivery_app/widgets/delivery_boy/delivery_card.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';

class DeliveriesPage extends StatefulWidget {
  final Function(int)? onNavigationTap;
  
  const DeliveriesPage({super.key, this.onNavigationTap});

  @override
  State<DeliveriesPage> createState() => _DeliveriesPageState();
}

class _DeliveriesPageState extends State<DeliveriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(title: "My Deliveries"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateHeaderCard(),
            const SizedBox(height: 24),
            _buildStatsRow(),
            const SizedBox(height: 24),
            ..._buildDeliveryItems(),
          ],
        ),
      ),
    );
  }

  Widget _buildDateHeaderCard() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppColors.primaryLight,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        const Icon(
          Icons.calendar_today,
          color: AppColors.primary,
          size: 20,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateTimeHelper.getCurrentDateLong(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Today\'s Deliveries',
              style: AppTextStyles.bodyText,
            ),
          ],
        ),
      ],
    ),
  );
}

  Widget _buildStatsRow() {
    return const Row(
      children: [
        Expanded(
          child: StatCard(
            icon: Icons.group,
            iconColor: AppColors.primary,
            value: '3',
            label: 'Total',
            iconBgColor: AppColors.primaryLight,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: StatCard(
            icon: Icons.check_circle,
            iconColor: AppColors.success,
            value: '1',
            label: 'Completed',
            iconBgColor: AppColors.successLight,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: StatCard(
            icon: Icons.access_time,
            iconColor: AppColors.warning,
            value: '2',
            label: 'Pending',
            iconBgColor: AppColors.warningLight,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: StatCard(
            icon: Icons.water_drop,
            iconColor: AppColors.primary,
            value: '5',
            label: 'Bottles',
            iconBgColor: AppColors.primaryLight,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildDeliveryItems() {
    return [
      DeliveryCard(
        name: 'Emily Chen',
        address: '123 Oak Street, Apartment 4B',
        bottles: '2',
        price: '\$25.00/bottle',
        phone: '+1234567897',
        status: 'COMPLETED',
        statusColor: AppColors.success,
        statusBgColor: AppColors.successLight,
        showActionButtons: true,
      ),
      const SizedBox(height: 16),
      DeliveryCard(
        name: 'Robert Taylor',
        address: '456 Pine Avenue, House ...',
        bottles: '3',
        price: '\$30.00/bottle',
        phone: '+1234567898',
        status: 'IN PROGRESS',
        statusColor: AppColors.warning,
        statusBgColor: AppColors.warningLight,
        showActionButtons: true,
      ),
      const SizedBox(height: 16),
      const DeliveryCard(
        name: 'Maria Rodriguez',
        address: '789 Elm Drive, Suite 5',
        price: '\$28.00/bottle',
        phone: '+1234567899',
        status: 'PENDING',
        statusColor: AppColors.textSecondary,
        statusBgColor: Color(0xFFF3F4F6),
        showActionButtons: true,
      ),
    ];
  }
}