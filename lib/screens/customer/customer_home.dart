import 'package:flutter/material.dart';
import 'package:water_delivery_app/screens/customer/customer_home_widget.dart';

class CustomerDashboard extends StatelessWidget {
  const CustomerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      // AppBar added with CommonHeader
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: CommonHeader(
          title: 'My Account',
          fontSize: 20, // 👈 ab chhota kar diya
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header removed from here - now in AppBar
              // SizedBox(height: 24), // Reduced top spacing

              // Welcome Card
              WelcomeCard(
                name: 'Emily Chen',
                company: 'AquaFlow Solutions',
                address: '123 Oak Street, Apartment 4B',
                avatar: 'E',
              ),
              SizedBox(height: 32),

              // Account Summary Title
              Text(
                'Account Summary',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),

              // Account Summary Stats Grid
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.4, // Updated aspect ratio for compact cards
                children: [
                  StatCard(
                    icon: Icons.water_drop,
                    iconColor: Color(0xFF3B82F6),
                    iconBgColor: Color(0xFFE0E7FF),
                    title: 'This Month',
                    mainValue: '2 bottles',
                    subValue: '\$50.00',
                    mainColor: Color(0xFF3B82F6),
                  ),
                  StatCard(
                    icon: Icons.local_shipping,
                    iconColor: Color(0xFF10B981),
                    iconBgColor: Color(0xFFD1FAE5),
                    title: 'Total\nDelivered',
                    mainValue: '45',
                    subValue: 'All time',
                    mainColor: Color(0xFF10B981),
                  ),
                  StatCard(
                    icon: Icons.receipt_long,
                    iconColor: const Color.fromARGB(255, 214, 164, 0), // amber text/icon
                    iconBgColor: const Color.fromARGB(255, 255, 232, 158), // light amber bg
                    title: 'Monthly Bill',
                    mainValue: '\$1125.00',
                    subValue: 'Current month',
                    mainColor: const Color.fromARGB(255, 214, 164, 0),
                  ),
                  StatCard(
                    icon: Icons.attach_money,
                    iconColor: Color(0xFF3B82F6),
                    iconBgColor: Color(0xFFE0E7FF),
                    title: 'Rate per\nBottle',
                    mainValue: '\$25.00',
                    subValue: '1 pending',
                    mainColor: Color(0xFF3B82F6),
                  ),
                ],
              ),

              SizedBox(height: 32),

              // Next Delivery Title
              Text(
                'Next Delivery',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),

              // No Upcoming Deliveries Card (This appears when scrolled)
              NoUpcomingDeliveriesCard(
                onScheduleTap: () {
                  // Schedule delivery action
                },
              ),
              SizedBox(height: 32),

              // Recent Activity Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Activity',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // View all action
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xFF3B82F6),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Recent Activity Item
              RecentActivityItem(
                title: '2 bottles delivered',
                deliveredBy: 'by Alex Wilson',
                date: 'Aug 18, 2025 • 08:31 AM',
                amount: '\$50.00',
                status: 'DELIVERED',
              ),
              SizedBox(height: 32),

              // Quick Actions Title
              Text(
                'Quick Actions',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),

              // Quick Actions Grid
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
                children: [
                  QuickActionCard(
                    icon: Icons.history,
                    iconColor: Color(0xFF3B82F6),
                    iconBgColor: Color(0xFFE0E7FF),
                    title: 'Delivery',
                    onTap: () {
                      // Delivery action
                    },
                  ),
                  QuickActionCard(
                    icon: Icons.receipt_long,
                    iconColor: Color(0xFF10B981),
                    iconBgColor: Color(0xFFD1FAE5),
                    title: 'Pay Invoice',
                    onTap: () {
                      // Pay invoice action
                    },
                  ),
                  QuickActionCard(
                    icon: Icons.headset_mic,
                    iconColor: Color(0xFF3B82F6),
                    iconBgColor: Color(0xFFE0E7FF),
                    title: 'Contact',
                    onTap: () {
                      // Contact action
                    },
                  ),
                  QuickActionCard(
                    icon: Icons.person,
                    iconColor: Color(0xFFD97706),
                    iconBgColor: Color(0xFFFED7AA),
                    title: 'Update',
                    onTap: () {
                      // Update action
                    },
                  ),
                ],
              ),
              SizedBox(height: 100), // Space for FAB
            ],
          ),
        ),
      ),
    );
  }
}
