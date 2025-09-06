import 'package:flutter/material.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';
import 'package:water_delivery_app/widgets/common_app_bar.dart';
import 'package:water_delivery_app/widgets/admin/system_stat_card.dart';
import 'package:water_delivery_app/widgets/status_chip.dart';

class OverallAdminProfile extends StatelessWidget {
  const OverallAdminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(
        title: 'Profile',
        showNotification: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileCard(),
              const SizedBox(height: 24),
              _buildContactInfoCard(),
              const SizedBox(height: 24),
              _buildSystemOverviewCard(),
              const SizedBox(height: 24),
              _buildSettingsCard(),
              const SizedBox(height: 24),
              _buildAppInfoCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.primaryLight,
                child: const Text(
                  'S',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Super Admin',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Overall Admin',
              style: AppTextStyles.cardTitle.copyWith(color: AppColors.primary),
            ),
          ),
          const SizedBox(height: 20),
          const StatusChip(
            text: 'Active',
            textColor: AppColors.success,
            backgroundColor: AppColors.successLight,
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Information',
            style: AppTextStyles.sectionTitle,
          ),
          const SizedBox(height: 24),
          _buildContactInfoRow(
            icon: Icons.email_outlined,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primaryLight,
            label: 'Email',
            value: 'admin@system.com',
          ),
          const SizedBox(height: 20),
          _buildContactInfoRow(
            icon: Icons.phone_outlined,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primaryLight,
            label: 'Phone',
            value: '+11111111111',
          ),
        ],
      ),
    );
  }

  Widget _buildSystemOverviewCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'System Overview',
            style: AppTextStyles.sectionTitle,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: SystemStatCard(
                  icon: Icons.business,
                  iconColor: AppColors.primary,
                  iconBgColor: AppColors.primaryLight,
                  value: '3',
                  title: 'Total Companies',
                  subtitle: 'Registered',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SystemStatCard(
                  icon: Icons.group,
                  iconColor: AppColors.success,
                  iconBgColor: AppColors.successLight,
                  value: '10',
                  title: 'System Users',
                  subtitle: 'All roles',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: SystemStatCard(
                  icon: Icons.pending_actions,
                  iconColor: AppColors.warning,
                  iconBgColor: AppColors.warningLight,
                  value: '1',
                  title: 'Pending Approvals',
                  subtitle: 'Need review',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SystemStatCard(
                  icon: Icons.attach_money,
                  iconColor: AppColors.primary,
                  iconBgColor: AppColors.primaryLight,
                  value: '\$105K',
                  title: 'Total Revenue',
                  subtitle: 'Monthly',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Settings & Actions',
            style: AppTextStyles.sectionTitle,
          ),
          const SizedBox(height: 24),
          _buildSettingsRow(
            icon: Icons.person,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primaryLight,
            title: 'Edit Profile',
            subtitle: 'Update your profile details',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          _buildSettingsRow(
            icon: Icons.business,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primaryLight,
            title: 'Manage Companies',
            subtitle: 'View and manage all companies',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          _buildSettingsRow(
            icon: Icons.group,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primaryLight,
            title: 'User Management',
            subtitle: 'Manage system users',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          _buildSettingsRow(
            icon: Icons.bar_chart,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primaryLight,
            title: 'System Reports',
            subtitle: 'View system analytics',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          _buildSettingsRow(
            icon: Icons.notifications,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primaryLight,
            title: 'Notifications',
            subtitle: 'Manage notification preferences',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          _buildSettingsRow(
            icon: Icons.help,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primaryLight,
            title: 'Help & Support',
            subtitle: 'Get help and contact support',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAppInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.water_drop,
              color: AppColors.primary,
              size: 32,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'AquaFlow',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'v1.0.0',
            style: AppTextStyles.cardTitle,
          ),
          const SizedBox(height: 4),
          Text(
            'Water Delivery Management System',
            style: AppTextStyles.bodyText.copyWith(
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfoRow({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.bodyText.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: AppTextStyles.cardTitle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsRow({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.cardTitle,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTextStyles.bodyText.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: AppColors.textTertiary,
            size: 24,
          ),
        ],
      ),
    );
  }
}