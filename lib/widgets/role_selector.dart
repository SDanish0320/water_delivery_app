import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RoleSelector extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onRoleSelected;

  const RoleSelector({
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
              color: isSelected ? AppTheme.primaryColor : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Icon(
                  roles[index]['icon'],
                  color: isSelected ? Colors.white : Colors.black54,
                ),
                const SizedBox(height: 4),
                Text(
                  roles[index]['label'],
                  style: TextStyle(
                    fontSize: 10,
                    color: isSelected ? Colors.white : Colors.black87,
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
