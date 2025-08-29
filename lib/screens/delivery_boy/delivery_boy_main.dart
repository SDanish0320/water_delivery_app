import 'package:flutter/material.dart';
import 'package:water_delivery_app/screens/delivery_boy/delivery_boy_deliveries_screen.dart';
import 'package:water_delivery_app/screens/delivery_boy/delivery_boy_delivery_history_screen.dart';
import 'package:water_delivery_app/screens/delivery_boy/delivery_boy_profile.dart';
import 'package:water_delivery_app/screens/delivery_boy/delivery_boy_route_map_screen.dart';
import 'package:water_delivery_app/utils/logout_helper.dart';
import 'package:water_delivery_app/utils/notification_screen.dart';

class DeliveryBoyMain extends StatefulWidget {
  const DeliveryBoyMain({super.key});

  @override
  State<DeliveryBoyMain> createState() => _DeliveryBoyMainState();
}

class _DeliveryBoyMainState extends State<DeliveryBoyMain> {
  int _currentIndex = 0;

  // Define all pages here
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      _buildTodayPage(), // Today page content
      DeliveriesPage(onNavigationTap: _onBottomNavTap), // Pass callback
      DeliveryBoyProfile(onNavigationTap: _onBottomNavTap), // Pass callback
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
      backgroundColor: Color(0xFFF8FAFC),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Today page content extracted as separate method
  Widget _buildTodayPage() {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Today's Deliveries", // yahan har page ka apna title dalna hai
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationsScreen(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.black87,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () => LogoutHelper.logout(context),
                  child: const Icon(
                    Icons.logout,
                    size: 24,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            _buildWelcomeCard(),
            SizedBox(height: 24),

            // Daily Summary
            _buildDailySummarySection(),
            SizedBox(height: 24),

            // Delivery Schedule
            _buildDeliveryScheduleSection(),
            SizedBox(height: 24),

            // Quick Actions
            _buildQuickActionsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Color(0xFFE6F3FF),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Icon(
              Icons.local_shipping,
              color: Color.fromARGB(255, 0, 89, 255),
              size: 32,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Alex Wilson!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'AquaFlow Solutions',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 0, 89, 255),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Saturday, Aug 23',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Color(0xFFD1FAE5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'ACTIVE',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF10B981),
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
        Text(
          'Daily Summary',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                icon: Icons.local_shipping,
                iconColor: Color.fromARGB(255, 0, 89, 255),
                iconBgColor: Color(0xFFE6F3FF),
                title: 'Total\nDeliveries',
                mainValue: '2',
                subValue: '1 completed',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                icon: Icons.water_drop,
                iconColor: Color.fromARGB(255, 0, 89, 255),
                iconBgColor: Color(0xFFE6F3FF),
                title: 'Bottles\nDelivered',
                mainValue: '5',
                subValue: '',
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                icon: Icons.more_horiz,
                iconColor: Color(0xFFFF8C00),
                iconBgColor: Color(0xFFFFF3CD),
                title: 'Pending',
                mainValue: '0',
                subValue: '',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                icon: Icons.local_shipping,
                iconColor: Color(0xFF10B981),
                iconBgColor: Color(0xFFD1FAE5),
                title: 'In Progress',
                mainValue: '1',
                subValue: '',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String mainValue,
    required String subValue,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 20, color: iconColor),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            mainValue,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: iconColor,
            ),
          ),
          if (subValue.isNotEmpty)
            Text(
              subValue,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDeliveryScheduleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Schedule',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Color(0xFFE6F3FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '2 stops',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 0, 89, 255),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        _buildDeliveryItem(
          number: 1,
          name: 'Robert Taylor',
          address: '456 Pine Avenue, House 12',
          bottles: '3 bottles',
          amount: '\$90.00',
          status: 'IN PROGRESS',
          statusColor: Color.fromARGB(255, 0, 89, 255),
          statusBgColor: Color(0xFFE6F3FF),
          showCompleteButton: true,
        ),
        SizedBox(height: 12),
        _buildDeliveryItem(
          number: 2,
          name: 'Emily Chen',
          address: '123 Oak Street, Apartment 4B',
          bottles: '2 bottles',
          amount: '\$50.00',
          status: 'DELIVERED',
          statusColor: Color(0xFF10B981),
          statusBgColor: Color(0xFFD1FAE5),
          showCompleteButton: false,
        ),
      ],
    );
  }

  Widget _buildDeliveryItem({
    required int number,
    required String name,
    required String address,
    required String bottles,
    required String amount,
    required String status,
    required Color statusColor,
    required Color statusBgColor,
    required bool showCompleteButton,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
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
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: statusColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: statusBgColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: statusColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      address,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.water_drop,
                size: 16,
                color: Color.fromARGB(255, 0, 89, 255),
              ),
              SizedBox(width: 4),
              Text(
                bottles,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
              SizedBox(width: 16),
              Icon(Icons.attach_money, size: 16, color: Color(0xFF10B981)),
              SizedBox(width: 4),
              Text(
                amount,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              if (showCompleteButton)
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.grey.shade700,
                    elevation: 0,
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: Text(
                    'Complete',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildQuickActionCard(
                icon: Icons.map,
                iconColor: Color.fromARGB(255, 0, 89, 255),
                iconBgColor: Color(0xFFE6F3FF),
                title: 'Route Map',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RouteMapScreen()),
                  );
                },
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildQuickActionCard(
                icon: Icons.history,
                iconColor: Color(0xFF10B981),
                iconBgColor: Color(0xFFD1FAE5),
                title: 'Delivery History',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeliveryHistoryScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildQuickActionCard(
                icon: Icons.phone,
                iconColor: Color(0xFFDC2626),
                iconBgColor: Color(0xFFFEE2E2),
                title: 'Emergency',
                onTap: () {},
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildQuickActionCard(
                icon: Icons.warning,
                iconColor: Color(0xFFFF8C00),
                iconBgColor: Color(0xFFFFF3CD),
                title: 'Report Issue',
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: Offset(0, -2),
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
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 0, 89, 255),
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        items: [
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
