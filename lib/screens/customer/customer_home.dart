import 'package:flutter/material.dart';
import 'package:water_delivery_app/screens/customer/customer_home_widget.dart';

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
        title: CommonHeader(
          title: 'My Account',
          fontSize: 20, 
        ),
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

              
              NoUpcomingDeliveriesCard(
                onScheduleTap: () {
               
                },
              ),
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
                    onPressed: () {
                      
                    },
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
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
                children: [
                  QuickActionCard(
                    icon: Icons.history,
                    iconColor: Color.fromARGB(255, 0, 89, 255),
                    iconBgColor: Color(0xFFE0E7FF),
                    title: 'Delivery',
                    onTap: () {
                     
                    },
                  ),
                  QuickActionCard(
                    icon: Icons.receipt_long,
                    iconColor: Color(0xFF10B981),
                    iconBgColor: Color(0xFFD1FAE5),
                    title: 'Pay Invoice',
                    onTap: () {
                      
                    },
                  ),
                  QuickActionCard(
                    icon: Icons.headset_mic,
                    iconColor: Color.fromARGB(255, 0, 89, 255),
                    iconBgColor: Color(0xFFE0E7FF),
                    title: 'Contact',
                    onTap: () {
                     
                    },
                  ),
                  QuickActionCard(
                    icon: Icons.person,
                    iconColor: Color(0xFFD97706),
                    iconBgColor: Color(0xFFFED7AA),
                    title: 'Update',
                    onTap: () {
                     
                    },
                  ),
                ],
              ),
              SizedBox(height: 100), 
            ],
          ),
        ),
      ),
    );
  }
}
