import 'package:flutter/material.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';
import 'package:water_delivery_app/widgets/common_app_bar.dart';
import 'package:water_delivery_app/widgets/auth/auth_header_card.dart';
import 'package:water_delivery_app/widgets/auth/auth_input_field.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        title: 'Add Customer',
        showNotification: false,
        showLogout: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthHeaderCard(
                icon: Icons.person_add,
                title: 'Add New Customer',
                subtitle: 'Create a new customer account for your company',
              ),
              const SizedBox(height: 24),
              _buildSectionTitle('Customer Information', Icons.person),
              const SizedBox(height: 16),
              _buildCustomerInfoForm(),
              const SizedBox(height: 24),
              _buildSectionTitle('Delivery Settings', Icons.settings),
              const SizedBox(height: 16),
              _buildDeliverySettings(),
              const SizedBox(height: 20),
              _buildNotesField(),
              const SizedBox(height: 24),
              _buildSectionTitle('Company Information', Icons.business),
              const SizedBox(height: 16),
              _buildCompanyInfo(),
              const SizedBox(height: 20),
              _buildInfoCard(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: AppTextStyles.cardTitle.copyWith(color: AppColors.primary),
        ),
      ],
    );
  }

  Widget _buildCustomerInfoForm() {
    return Column(
      children: [
        AuthInputField(
          label: 'Full Name',
          hintText: 'Enter customer full name',
          prefixIcon: Icons.person_outline,
          controller: nameController,
        ),
        const SizedBox(height: 20),
        AuthInputField(
          label: 'Email Address',
          hintText: 'Enter email address',
          prefixIcon: Icons.mail_outline,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        AuthInputField(
          label: 'Phone Number',
          hintText: 'Enter phone number',
          prefixIcon: Icons.phone_outlined,
          controller: phoneController,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Address', style: AppTextStyles.cardTitle),
            const SizedBox(height: 8),
            TextField(
              controller: addressController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Enter customer address',
                hintStyle: AppTextStyles.bodyText,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Icon(Icons.location_on_outlined, color: AppColors.textSecondary),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.textTertiary),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.textTertiary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDeliverySettings() {
    return Row(
      children: [
        Expanded(child: _buildPlanCard('20', 'Monthly Plan (bottles)', Icons.calendar_today)),
        const SizedBox(width: 16),
        Expanded(child: _buildPlanCard('\$25.00', 'Price per Bottle', Icons.attach_money)),
      ],
    );
  }

  Widget _buildPlanCard(String value, String label, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.textTertiary),
          ),
          child: Row(
            children: [
              Icon(icon, color: AppColors.textSecondary, size: 20),
              const SizedBox(width: 12),
              Text(value, style: AppTextStyles.cardTitle),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNotesField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Notes (Optional)', style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.textTertiary),
          ),
          child: Row(
            children: [
              Icon(Icons.folder_outlined, color: AppColors.textSecondary, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Enter any additional notes',
                  style: AppTextStyles.cardTitle.copyWith(color: AppColors.textSecondary),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCompanyInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.textTertiary),
      ),
      child: Column(
        children: [
          _buildInfoRow('Company', 'AquaFlow Solutions'),
          const SizedBox(height: 12),
          _buildInfoRow('Role', 'Customer'),
          const SizedBox(height: 12),
          _buildInfoRow('Status', 'Active'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.bodyText),
        Text(
          value,
          style: AppTextStyles.bodyText.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                'Customer Account Details',
                style: AppTextStyles.cardTitle,
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildInfoPoint('Customer will receive login credentials via email'),
          _buildInfoPoint('They can track deliveries and manage their account'),
          _buildInfoPoint('Monthly billing will be generated automatically'),
        ],
      ),
    );
  }

  Widget _buildInfoPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text('• $text', style: AppTextStyles.bodyText),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: BorderSide(color: AppColors.textTertiary),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
              child: Text(
                'Cancel',
                style: AppTextStyles.buttonText.copyWith(color: AppColors.textSecondary),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: _handleCreateCustomer,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
              child: Text(
                'Create Customer',
                style: AppTextStyles.buttonText.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleCreateCustomer() {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        addressController.text.isNotEmpty) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${nameController.text} added successfully'),
          backgroundColor: AppColors.success,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please fill all fields'),
          backgroundColor: AppColors.danger,
        ),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    notesController.dispose();
    super.dispose();
  }
}