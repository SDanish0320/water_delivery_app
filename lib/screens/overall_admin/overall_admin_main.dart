import 'package:flutter/material.dart';
import 'package:water_delivery_app/screens/overall_admin/overall_admin_dashboard.dart';
import 'package:water_delivery_app/screens/overall_admin/overall_admin_profile.dart';

class OverallAdminMain extends StatefulWidget {
  const OverallAdminMain({super.key});

  @override
  State<OverallAdminMain> createState() => _OverallAdminMainState();
}

class _OverallAdminMainState extends State<OverallAdminMain> {
  int _currentIndex = 0;
  
  final List<Widget> _pages = [
    const OverallAdminDashboard(),
    const OverallAdminProfile(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _onTabTapped(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _currentIndex == 0 
                          ? const Color.fromARGB(255, 0, 89, 255)
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.admin_panel_settings,
                      color: _currentIndex == 0 
                          ? Colors.white 
                          : Colors.grey[600],
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Admin',
                    style: TextStyle(
                      fontSize: 12,
                      color: _currentIndex == 0 
                          ? const Color.fromARGB(255, 0, 89, 255)
                          : Colors.grey[600],
                      fontWeight: _currentIndex == 0 
                          ? FontWeight.w600 
                          : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _onTabTapped(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _currentIndex == 1 
                          ? const Color.fromARGB(255, 0, 89, 255)
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.person,
                      color: _currentIndex == 1 
                          ? Colors.white 
                          : Colors.grey[600],
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 12,
                      color: _currentIndex == 1 
                          ? const Color.fromARGB(255, 0, 89, 255)
                          : Colors.grey[600],
                      fontWeight: _currentIndex == 1 
                          ? FontWeight.w600 
                          : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: _currentIndex == 0 
              ? const Color.fromARGB(255, 0, 89, 255)
              : const Color.fromARGB(255, 0, 89, 255),
          borderRadius: BorderRadius.circular(16),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}