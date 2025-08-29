import 'package:flutter/material.dart';
import 'package:water_delivery_app/screens/customer/customer_home_widget.dart';
import 'package:water_delivery_app/screens/customer/customer_invoices.dart';
import 'package:water_delivery_app/screens/customer/customer_records.dart';

class CustomerDashboard extends StatelessWidget {
  const CustomerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: CommonHeader(title: 'My Account', fontSize: 20),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeCard(
                name: 'Emily Chen',
                company: 'AquaFlow Solutions',
                address: '123 Oak Street, Apartment 4B',
                avatar: 'E',
              ),
              SizedBox(height: 32),

              Text(
                'Account Summary',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.4,
                children: [
                  StatCard(
                    icon: Icons.water_drop,
                    iconColor: Color.fromARGB(255, 0, 89, 255),
                    iconBgColor: Color(0xFFE0E7FF),
                    title: 'This Month',
                    mainValue: '2 bottles',
                    subValue: '\$50.00',
                    mainColor: Color.fromARGB(255, 0, 89, 255),
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
                    iconColor: const Color.fromARGB(255, 214, 164, 0),
                    iconBgColor: const Color.fromARGB(255, 255, 232, 158),
                    title: 'Monthly Bill',
                    mainValue: '\$1125.00',
                    subValue: 'Current month',
                    mainColor: const Color.fromARGB(255, 214, 164, 0),
                  ),
                  StatCard(
                    icon: Icons.attach_money,
                    iconColor: Color.fromARGB(255, 0, 89, 255),
                    iconBgColor: Color(0xFFE0E7FF),
                    title: 'Rate per\nBottle',
                    mainValue: '\$25.00',
                    subValue: '1 pending',
                    mainColor: Color.fromARGB(255, 0, 89, 255),
                  ),
                ],
              ),

              SizedBox(height: 32),

              Text(
                'Next Delivery',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),

              NoUpcomingDeliveriesCard(onScheduleTap: () {}),
              SizedBox(height: 32),

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
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 89, 255),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              RecentActivityItem(
                title: '2 bottles delivered',
                deliveredBy: 'by Alex Wilson',
                date: 'Aug 18, 2025 • 08:31 AM',
                amount: '\$50.00',
                status: 'DELIVERED',
              ),
              SizedBox(height: 32),

              Text(
                'Quick Actions',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),

              GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.2,
            children: [
              _buildActionCard(
                icon: Icons.history,
                iconColor: Color.fromARGB(255, 0, 89, 255),
                title: 'Delivery',
                backgroundColor: Color(0xFFE0E7FF),
                onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeliveryRecordsScreen(),
                        ),
                      );
                    },
              ),
              _buildActionCard(
                icon: Icons.receipt_long,
                    iconColor: Color(0xFF10B981),
                   
                title: 'Pay Invoice',
                backgroundColor: Color(0xFFD1FAE5),
                onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomerInvoices(),
                        ),
                      );
                    },
              ),
              _buildActionCard(
                icon: Icons.headset_mic,
                    iconColor: Color.fromARGB(255, 0, 89, 255),
                    
                    title: 'Contact',
                backgroundColor: Color(0xFFE0E7FF),
                onTap: () {
                  
                },
              ),
              _buildActionCard(
                icon: Icons.person,
                    iconColor: Color(0xFFD97706),
                    
                    title: 'Update',
                backgroundColor: Color(0xFFFED7AA),
                onTap: () {
                  
                },
              ),
            ],
          ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
