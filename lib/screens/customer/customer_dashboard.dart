import 'package:flutter/material.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';
import 'package:water_delivery_app/widgets/common_app_bar.dart';
import 'package:water_delivery_app/widgets/stat_card.dart';
import 'package:water_delivery_app/widgets/quick_action_card.dart';
import 'package:water_delivery_app/widgets/customer/customer_welcome_card.dart';
import 'package:water_delivery_app/widgets/customer/customer_no_delivery_card.dart';
import 'package:water_delivery_app/widgets/customer/customer_activity_item.dart';
import 'package:water_delivery_app/screens/customer/customer_invoices.dart';
import 'package:water_delivery_app/screens/customer/customer_records.dart';

class CustomerDashboard extends StatelessWidget {
  const CustomerDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(title: 'My Account'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomerWelcomeCard(
                name: 'Emily Chen',
                company: 'AquaFlow Solutions',
                address: '123 Oak Street, Apartment 4B',
                avatar: 'E',
              ),
              const SizedBox(height: 32),
              
              Text(
                'Account Summary',
                style: AppTextStyles.sectionTitle,
              ),
              const SizedBox(height: 16),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
                children: const [
                  StatCard(
                    icon: Icons.water_drop,
                    iconColor: AppColors.primary,
                    iconBgColor: AppColors.primaryLight,
                    value: '2 bottles',
                    label: 'This Month',
                    subValue: '\$50.00',
                  ),
                  StatCard(
                    icon: Icons.local_shipping,
                    iconColor: AppColors.success,
                    iconBgColor: AppColors.successLight,
                    value: '45',
                    label: 'Total Delivered',
                    subValue: 'All time',
                  ),
                  StatCard(
                    icon: Icons.receipt_long,
                    iconColor: AppColors.warning,
                    iconBgColor: AppColors.warningLight,
                    value: '\$1125.00',
                    label: 'Monthly Bill',
                    subValue: 'Current month',
                  ),
                  StatCard(
                    icon: Icons.attach_money,
                    iconColor: AppColors.primary,
                    iconBgColor: AppColors.primaryLight,
                    value: '\$25.00',
                    label: 'Rate per Bottle',
                    subValue: '1 pending',
                  ),
                ],
              ),

              const SizedBox(height: 32),

              Text(
                'Next Delivery',
                style: AppTextStyles.sectionTitle,
              ),
              const SizedBox(height: 16),

              CustomerNoDeliveryCard(onScheduleTap: () {}),
              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Activity',
                    style: AppTextStyles.sectionTitle,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: AppTextStyles.buttonText.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              const CustomerActivityItem(
                title: '2 bottles delivered',
                deliveredBy: 'by Alex Wilson',
                date: 'Aug 18, 2025 • 08:31 AM',
                amount: '\$50.00',
                status: 'DELIVERED',
              ),
              const SizedBox(height: 32),

              Text(
                'Quick Actions',
                style: AppTextStyles.sectionTitle,
              ),
              const SizedBox(height: 16),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.2,
                children: [
                  QuickActionCard(
                    icon: Icons.history,
                    iconColor: AppColors.primary,
                    iconBgColor: AppColors.primaryLight,
                    title: 'Delivery Records',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DeliveryRecordsScreen(),
                        ),
                      );
                    },
                  ),
                  QuickActionCard(
                    icon: Icons.receipt_long,
                    iconColor: AppColors.success,
                    iconBgColor: AppColors.successLight,
                    title: 'Pay Invoice',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CustomerInvoices(),
                        ),
                      );
                    },
                  ),
                  QuickActionCard(
                    icon: Icons.headset_mic,
                    iconColor: AppColors.primary,
                    iconBgColor: AppColors.primaryLight,
                    title: 'Contact Support',
                    onTap: () {},
                  ),
                  QuickActionCard(
                    icon: Icons.person,
                    iconColor: AppColors.warning,
                    iconBgColor: AppColors.warningLight,
                    title: 'Update Profile',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}