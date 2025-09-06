import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../status_chip.dart';

class UserManagementCard extends StatelessWidget {
  final String initial;
  final String name;
  final String role;
  final String? company;
  final Color avatarColor;
  final bool isActive;
  final VoidCallback? onTap;

  const UserManagementCard({
    Key? key,
    required this.initial,
    required this.name,
    required this.role,
    this.company,
    this.avatarColor = AppColors.primary,
    this.isActive = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: avatarColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  initial,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: avatarColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppTextStyles.cardTitle),
                  const SizedBox(height: 2),
                  Text(
                    role,
                    style: AppTextStyles.bodyText.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (company != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      company!,
                      style: AppTextStyles.smallText,
                    ),
                  ],
                ],
              ),
            ),
            StatusChip(
              text: isActive ? 'Active' : 'Inactive',
              textColor: isActive ? AppColors.success : AppColors.danger,
              backgroundColor: isActive 
                  ? AppColors.successLight 
                  : AppColors.dangerLight,
            ),
          ],
        ),
      ),
    );
  }
}