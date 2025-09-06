import 'package:flutter/material.dart';
import 'package:water_delivery_app/screens/delivery_boy/delivery_boy_deliveries_screen.dart';
import 'package:water_delivery_app/screens/delivery_boy/delivery_boy_delivery_history_screen.dart';
import 'package:water_delivery_app/screens/delivery_boy/delivery_boy_profile.dart';
import 'package:water_delivery_app/screens/delivery_boy/delivery_boy_route_map_screen.dart';
import 'package:water_delivery_app/utils/date_time_helper.dart';
import 'package:water_delivery_app/widgets/common_app_bar.dart';
import 'package:water_delivery_app/widgets/delivery_boy/delivery_summary_card.dart';
import 'package:water_delivery_app/widgets/delivery_boy/delivery_card.dart';
import 'package:water_delivery_app/widgets/quick_action_card.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';

class DeliveryBoyMain extends StatefulWidget {
  const DeliveryBoyMain({super.key});

  @override
  State<DeliveryBoyMain> createState() => _DeliveryBoyMainState();
}

class _DeliveryBoyMainState extends State<DeliveryBoyMain> {
  int _currentIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      _buildTodayPage(),
      DeliveriesPage(onNavigationTap: _onBottomNavTap),
      DeliveryBoyProfile(onNavigationTap: _onBottomNavTap),
    ];
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTodayPage() {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(title: "Today's Deliveries"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeCard(),
            const SizedBox(height: 24),
            _buildDailySummarySection(),
            const SizedBox(height: 24),
            _buildDeliveryScheduleSection(),
            const SizedBox(height: 24),
            _buildQuickActionsSection(),
          ],
        ),
      ),
    );
  }

 Widget _buildWelcomeCard() {
  return Container(
    padding: const EdgeInsets.all(20),
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
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(32),
          ),
          child: const Icon(
            Icons.local_shipping,
            color: AppColors.primary,
            size: 28,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello, Alex Wilson!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'AquaFlow Solutions',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 14,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    DateTimeHelper.getCurrentDate(),
                    style: AppTextStyles.smallText,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.successLight,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'ACTIVE',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: AppColors.success,
            ),
          ),
        ),
      ],
    ),
  );
}

  Widget _buildDailySummarySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Daily Summary', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: DeliverySummaryCard(
                icon: Icons.local_shipping,
                iconColor: AppColors.primary,
                iconBgColor: AppColors.primaryLight,
                value: '2',
                label: 'Total Deliveries',
                subValue: '1 completed',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DeliverySummaryCard(
                icon: Icons.water_drop,
                iconColor: AppColors.primary,
                iconBgColor: AppColors.primaryLight,
                value: '5',
                label: 'Bottles Delivered',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: DeliverySummaryCard(
                icon: Icons.more_horiz,
                iconColor: AppColors.warning,
                iconBgColor: AppColors.warningLight,
                value: '0',
                label: 'Pending',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DeliverySummaryCard(
                icon: Icons.local_shipping,
                iconColor: AppColors.success,
                iconBgColor: AppColors.successLight,
                value: '1',
                label: 'In Progress',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDeliveryScheduleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Delivery Schedule', style: AppTextStyles.sectionTitle),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '2 stops',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        DeliveryCard(
          number: 1,
          name: 'Robert Taylor',
          address: '456 Pine Avenue, House 12',
          bottles: '3',
          amount: '\$90.00',
          status: 'IN PROGRESS',
          statusColor: AppColors.primary,
          statusBgColor: AppColors.primaryLight,
          showCompleteButton: true,
          onComplete: () {},
        ),
        const SizedBox(height: 12),
        const DeliveryCard(
          number: 2,
          name: 'Emily Chen',
          address: '123 Oak Street, Apartment 4B',
          bottles: '2',
          amount: '\$50.00',
          status: 'DELIVERED',
          statusColor: AppColors.success,
          statusBgColor: AppColors.successLight,
        ),
      ],
    );
  }

  Widget _buildQuickActionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Quick Actions', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: QuickActionCard(
                icon: Icons.map,
                iconColor: AppColors.primary,
                iconBgColor: AppColors.primaryLight,
                title: 'Route Map',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RouteMapScreen(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: QuickActionCard(
                icon: Icons.history,
                iconColor: AppColors.success,
                iconBgColor: AppColors.successLight,
                title: 'Delivery History',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeliveryHistoryScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: QuickActionCard(
                icon: Icons.phone,
                iconColor: AppColors.danger,
                iconBgColor: AppColors.dangerLight,
                title: 'Emergency',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: QuickActionCard(
                icon: Icons.warning,
                iconColor: AppColors.warning,
                iconBgColor: AppColors.warningLight,
                title: 'Report Issue',
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.cardBackground,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.today), label: 'Today'),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Deliveries',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}