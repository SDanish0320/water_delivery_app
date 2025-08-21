import 'package:flutter/material.dart';
import 'package:water_delivery_app/utils/logout_helper.dart';

class OverallAdminProfile extends StatelessWidget {
  const OverallAdminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () => LogoutHelper.logout(context),
              child: const Icon(
                Icons.logout,
                size: 24,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                          backgroundColor: const Color(0xFFE0E7FF),
                          child: const Text(
                            'S',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 0, 89, 255),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 0, 89, 255),
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
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E7FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Overall Admin',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 89, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD1FAE5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.circle, size: 8, color: Color(0xFF10B981)),
                          SizedBox(width: 8),
                          Text(
                            'Active',
                            style: TextStyle(
                              color: Color(0xFF10B981),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                    const Text(
                      'Contact Information',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildContactInfoRow(
                      icon: Icons.email_outlined,
                      iconColor: const Color.fromARGB(255, 0, 89, 255),
                      iconBgColor: const Color(0xFFE0E7FF),
                      label: 'Email',
                      value: 'admin@system.com',
                    ),
                    const SizedBox(height: 20),
                    _buildContactInfoRow(
                      icon: Icons.phone_outlined,
                      iconColor: const Color.fromARGB(255, 0, 89, 255),
                      iconBgColor: const Color(0xFFE0E7FF),
                      label: 'Phone',
                      value: '+11111111111',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                    const Text(
                      'System Overview',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: _buildSystemStatCard(
                            icon: Icons.business,
                            iconColor: const Color.fromARGB(255, 0, 89, 255),
                            iconBgColor: const Color(0xFFE0E7FF),
                            value: '3',
                            title: 'Total Companies',
                            subtitle: 'Registered',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildSystemStatCard(
                            icon: Icons.group,
                            iconColor: const Color(0xFF10B981),
                            iconBgColor: const Color(0xFFD1FAE5),
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
                          child: _buildSystemStatCard(
                            icon: Icons.pending_actions,
                            iconColor: const Color(0xFFFF9800),
                            iconBgColor: const Color(0xFFFFF3E0),
                            value: '1',
                            title: 'Pending Approvals',
                            subtitle: 'Need review',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildSystemStatCard(
                            icon: Icons.attach_money,
                            iconColor: const Color.fromARGB(255, 0, 89, 255),
                            iconBgColor: const Color(0xFFE0E7FF),
                            value: '\$105K',
                            title: 'Total Revenue',
                            subtitle: 'Monthly',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                    const Text(
                      'Settings & Actions',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildSettingsRow(
                      icon: Icons.person,
                      iconColor: const Color.fromARGB(255, 0, 89, 255),
                      iconBgColor: const Color(0xFFE0E7FF),
                      title: 'Edit Profile',
                      subtitle: 'Update your profile details',
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    _buildSettingsRow(
                      icon: Icons.business,
                      iconColor: const Color.fromARGB(255, 0, 89, 255),
                      iconBgColor: const Color(0xFFE0E7FF),
                      title: 'Manage Companies',
                      subtitle: 'View and manage all companies',
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    _buildSettingsRow(
                      icon: Icons.group,
                      iconColor: const Color.fromARGB(255, 0, 89, 255),
                      iconBgColor: const Color(0xFFE0E7FF),
                      title: 'User Management',
                      subtitle: 'Manage system users',
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    _buildSettingsRow(
                      icon: Icons.bar_chart,
                      iconColor: const Color.fromARGB(255, 0, 89, 255),
                      iconBgColor: const Color(0xFFE0E7FF),
                      title: 'System Reports',
                      subtitle: 'View system analytics',
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    _buildSettingsRow(
                      icon: Icons.notifications,
                      iconColor: const Color.fromARGB(255, 0, 89, 255),
                      iconBgColor: const Color(0xFFE0E7FF),
                      title: 'Notifications',
                      subtitle: 'Manage notification preferences',
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    _buildSettingsRow(
                      icon: Icons.help,
                      iconColor: const Color.fromARGB(255, 0, 89, 255),
                      iconBgColor: const Color(0xFFE0E7FF),
                      title: 'Help & Support',
                      subtitle: 'Get help and contact support',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                        color: const Color(0xFFE0E7FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.water_drop,
                        color: Color.fromARGB(255, 0, 89, 255),
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'AquaFlow',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 0, 89, 255),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'v1.0.0',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Water Delivery Management System',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSystemStatCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String value,
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
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
        const SizedBox(height: 12),
        Text(
          value,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: iconColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
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
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.grey.shade400,
            size: 24,
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
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
