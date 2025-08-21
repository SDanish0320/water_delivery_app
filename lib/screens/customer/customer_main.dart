import 'package:flutter/material.dart';
import 'package:water_delivery_app/screens/customer/customer_invoices.dart';
import 'package:water_delivery_app/screens/customer/customer_profile.dart';
import 'package:water_delivery_app/screens/customer/customer_records.dart';

import 'customer_home.dart';

class CustomerMain extends StatefulWidget {
  const CustomerMain({super.key});

  @override
  State<CustomerMain> createState() => _CustomerMainState();
}

class _CustomerMainState extends State<CustomerMain> {
  int _index = 0;

  final _pages = const [
    CustomerDashboard(),
    DeliveryRecordsScreen(),
    CustomerInvoices(),
    CustomerProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Color.fromARGB(255, 0, 89, 255), 
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              activeIcon: Icon(Icons.history),
              label: 'Records',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              activeIcon: Icon(Icons.receipt_long),
              label: 'Invoices',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      floatingActionButton: _index == 0 
        ? FloatingActionButton(
            onPressed: () {
             
            },
            backgroundColor: Color.fromARGB(255, 0, 89, 255), 
            elevation: 8,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 28,
            ),
          )
        : null,
    );
  }
}