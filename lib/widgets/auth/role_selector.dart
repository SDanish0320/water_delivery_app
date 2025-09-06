import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class AuthRoleSelector extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onRoleSelected;

  const AuthRoleSelector({
    super.key,
    required this.selectedIndex,
    required this.onRoleSelected,
  });

  final List<Map<String, dynamic>> roles = const [
    {'icon': Icons.admin_panel_settings, 'label': 'Overall Admin'},
    {'icon': Icons.apartment, 'label': 'Company Admin'},
    {'icon': Icons.delivery_dining, 'label': 'Delivery Boy'},
    {'icon': Icons.person, 'label': 'Customer'},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(roles.length, (index) {
        bool isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () => onRoleSelected(index),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.textTertiary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Icon(
                  roles[index]['icon'],
                  color: isSelected ? Colors.white : AppColors.textSecondary,
                ),
                const SizedBox(height: 4),
                Text(
                  roles[index]['label'],
                  style: AppTextStyles.statusText.copyWith(
                    color: isSelected ? Colors.white : AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}