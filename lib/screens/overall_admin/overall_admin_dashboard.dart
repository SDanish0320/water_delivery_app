import 'package:flutter/material.dart';
import 'package:water_delivery_app/screens/overall_admin/dashboard_reports_analytics.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';
import 'package:water_delivery_app/utils/date_time_helper.dart';
import 'package:water_delivery_app/widgets/admin/system_overview_card.dart';
import 'package:water_delivery_app/widgets/common_app_bar.dart';
import 'package:water_delivery_app/widgets/quick_action_card.dart';
import 'package:water_delivery_app/widgets/admin/company_card.dart';
import 'package:water_delivery_app/widgets/admin/user_management_card.dart';
import 'package:water_delivery_app/widgets/admin/pending_approval_card.dart';

class OverallAdminDashboard extends StatefulWidget {
  const OverallAdminDashboard({super.key});

  @override
  State<OverallAdminDashboard> createState() => _OverallAdminDashboardState();
}

class _OverallAdminDashboardState extends State<OverallAdminDashboard> {
  bool showPendingDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(title: "Admin Dashboard"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildWelcomeCard(),
              const SizedBox(height: 24),
              _buildSectionTitle('System Overview'),
              const SizedBox(height: 16),
              _buildSystemOverview(),
              const SizedBox(height: 24),
              _buildPendingApprovals(),
              const SizedBox(height: 24),
              _buildActiveCompanies(),
              const SizedBox(height: 24),
              _buildQuickActions(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeCard() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    padding: const EdgeInsets.all(20),
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
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.admin_panel_settings,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome back, Super Admin!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'System Administrator',
                style: AppTextStyles.cardTitle.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Last login: ${DateTimeHelper.getLastLoginFormat()}',
                style: AppTextStyles.smallText,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(title, style: AppTextStyles.sectionTitle),
    );
  }

  Widget _buildSystemOverview() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SystemOverviewCard(
                  icon: Icons.business,
                  iconColor: AppColors.primary,
                  iconBgColor: AppColors.primaryLight,
                  value: '3',
                  label: 'Companies',
                  subValue: '2 active',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SystemOverviewCard(
                  icon: Icons.group,
                  iconColor: AppColors.success,
                  iconBgColor: AppColors.successLight,
                  value: '10',
                  label: 'Users',
                  subValue: 'System wide',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: SystemOverviewCard(
                  icon: Icons.person,
                  iconColor: AppColors.primary,
                  iconBgColor: AppColors.primaryLight,
                  value: '4',
                  label: 'Customers',
                  subValue: 'All companies',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SystemOverviewCard(
                  icon: Icons.attach_money,
                  iconColor: AppColors.warning,
                  iconBgColor: AppColors.warningLight,
                  value: '\$105,000',
                  label: 'Revenue',
                  subValue: 'Monthly total',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPendingApprovals() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showPendingDetails) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pending Approvals', style: AppTextStyles.sectionTitle),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.warning,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          PendingApprovalCard(
            companyName: 'Crystal Clear Waters',
            adminName: 'Mike Davis',
            address: '789 Fresh Lane, Suburb',
            registeredDate: 'Aug 14, 2025',
            onApprove: () {},
            onReject: () {},
          ),
        ] else ...[
          GestureDetector(
            onTap: () {
              setState(() {
                showPendingDetails = true;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pending Approvals', style: AppTextStyles.sectionTitle),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.warning,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildActiveCompanies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Active Companies'),
        const SizedBox(height: 16),
        CompanyCard(
          name: 'AquaFlow Solutions',
          details: '150 customers • 8 delivery boys',
          revenue: '\$45,000/month',
          isActive: true,
          onTap: () {},
        ),
        CompanyCard(
          name: 'Pure Water Co.',
          details: '200 customers • 12 delivery boys',
          revenue: '\$60,000/month',
          isActive: true,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Quick Actions'),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: QuickActionCard(
                      icon: Icons.bar_chart,
                      iconColor: AppColors.primary,
                      iconBgColor: AppColors.primaryLight,
                      title: 'System Reports',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReportsAnalyticsPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: QuickActionCard(
                      icon: Icons.business,
                      iconColor: AppColors.success,
                      iconBgColor: AppColors.successLight,
                      title: 'Manage Companies',
                      onTap: () => _showCompanyManagementBottomSheet(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: QuickActionCard(
                      icon: Icons.group,
                      iconColor: AppColors.primary,
                      iconBgColor: AppColors.primaryLight,
                      title: 'User Management',
                      onTap: () => _showUserManagementBottomSheet(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: QuickActionCard(
                      icon: Icons.settings,
                      iconColor: AppColors.warning,
                      iconBgColor: AppColors.warningLight,
                      title: 'System Settings',
                      onTap: () => _showSystemSettingsBottomSheet(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showCompanyManagementBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 14),
                  Text('Company Management', style: AppTextStyles.sectionTitle),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          CompanyCard(
                            name: 'AquaFlow Solutions',
                            details: '150 customers • 8 delivery boys',
                            revenue: '\$45,000/month',
                            isActive: true,
                          ),
                          CompanyCard(
                            name: 'Pure Water Co.',
                            details: '200 customers • 12 delivery boys',
                            revenue: '\$60,000/month',
                            isActive: true,
                          ),
                          CompanyCard(
                            name: 'Crystal Clear Waters',
                            details: '0 customers • 0 delivery boys',
                            revenue: '\$0/month',
                            isActive: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showUserManagementBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 14),
                  Text('User Management', style: AppTextStyles.sectionTitle),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          UserManagementCard(
                            initial: 'S',
                            name: 'Super Admin',
                            role: 'Overall Admin',
                            avatarColor: AppColors.primary,
                          ),
                          UserManagementCard(
                            initial: 'J',
                            name: 'John Smith',
                            role: 'Company Admin',
                            company: 'AquaFlow Solutions',
                            avatarColor: AppColors.primary,
                          ),
                          UserManagementCard(
                            initial: 'S',
                            name: 'Sarah Johnson',
                            role: 'Company Admin',
                            company: 'Pure Water Co.',
                            avatarColor: AppColors.primary,
                          ),
                          UserManagementCard(
                            initial: 'M',
                            name: 'Mike Davis',
                            role: 'Company Admin',
                            company: 'Crystal Clear Waters',
                            avatarColor: AppColors.primary,
                          ),
                          UserManagementCard(
                            initial: 'A',
                            name: 'Alex Wilson',
                            role: 'Delivery Boy',
                            company: 'AquaFlow Solutions',
                            avatarColor: AppColors.primary,
                          ),
                          UserManagementCard(
                            initial: 'T',
                            name: 'Tom Brown',
                            role: 'Delivery Boy',
                            company: 'AquaFlow Solutions',
                            avatarColor: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showSystemSettingsBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 14),
                  Text('System Settings', style: AppTextStyles.sectionTitle),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          _buildSettingOption(
                            Icons.settings,
                            'App Configuration',
                            AppColors.primary,
                            AppColors.primaryLight,
                          ),
                          _buildSettingOption(
                            Icons.security,
                            'Security Settings',
                            AppColors.primary,
                            AppColors.primaryLight,
                          ),
                          _buildSettingOption(
                            Icons.backup,
                            'Backup Settings',
                            AppColors.primary,
                            AppColors.primaryLight,
                          ),
                          _buildSettingOption(
                            Icons.email,
                            'Email Configuration',
                            AppColors.primary,
                            AppColors.primaryLight,
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSettingOption(
    IconData icon,
    String title,
    Color iconColor,
    Color bgColor,
  ) {
    return Container(
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
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.cardTitle,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.textTertiary,
            size: 16,
          ),
        ],
      ),
    );
  }
}