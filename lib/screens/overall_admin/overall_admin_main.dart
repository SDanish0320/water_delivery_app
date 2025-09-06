import 'package:flutter/material.dart';
import 'package:water_delivery_app/screens/overall_admin/overall_admin_dashboard.dart';
import 'package:water_delivery_app/screens/overall_admin/overall_admin_profile.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';

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
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(0, Icons.admin_panel_settings, 'Admin'),
            _buildNavItem(1, Icons.person, 'Profile'),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.primary,
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

  Widget _buildNavItem(int index, IconData icon, String label) {
    final bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.textTertiary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : AppColors.textSecondary,
              size: 20,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.smallText.copyWith(
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}