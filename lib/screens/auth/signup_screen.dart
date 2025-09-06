import 'package:flutter/material.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';
import 'package:water_delivery_app/widgets/auth/auth_header_card.dart';
import 'package:water_delivery_app/widgets/auth/auth_input_field.dart';
import 'package:water_delivery_app/widgets/common_app_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int selectedRole = 1;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool agreeToTerms = false;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      appBar: CommonAppBar(
        title: 'Create Account',
        showNotification: false,
        showLogout: false,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthHeaderCard(
              icon: Icons.person_add,
              title: 'Create Your Account',
              subtitle: 'Join AquaFlow to manage your water deliveries',
            ),
            const SizedBox(height: 30),
            _buildRoleSelection(),
            const SizedBox(height: 30),
            _buildPersonalInfoSection(),
            const SizedBox(height: 20),
            _buildTermsCheckbox(),
            const SizedBox(height: 30),
            _buildActionButtons(),
            const SizedBox(height: 20),
            _buildSignInSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleSelection() {
    final List<Map<String, dynamic>> roles = [
      {
        'index': 1,
        'icon': Icons.business,
        'label': 'Company Admin',
        'description': 'Manage company operations, customers, and delivery staff'
      },
      {
        'index': 3,
        'icon': Icons.person,
        'label': 'Customer',
        'description': 'Track your water deliveries and manage your account'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Your Role',
          style: AppTextStyles.sectionTitle,
        ),
        const SizedBox(height: 16),
        Row(
          children: roles.map((role) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: role['index'] == 1 ? 8 : 0,
                  left: role['index'] == 3 ? 8 : 0,
                ),
                child: _buildRoleOption(
                  role['index'],
                  role['icon'],
                  role['label'],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        _buildRoleDescription(),
      ],
    );
  }

  Widget _buildRoleOption(int roleIndex, IconData icon, String label) {
    final bool isSelected = selectedRole == roleIndex;
    return GestureDetector(
      onTap: () => setState(() => selectedRole = roleIndex),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.cardBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.textTertiary,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : AppColors.textSecondary,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: AppTextStyles.bodyText.copyWith(
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : AppColors.textPrimary,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleDescription() {
    final Map<int, Map<String, String>> roleDetails = {
      1: {
        'title': 'Company Admin',
        'description': 'Manage company operations, customers, and delivery staff'
      },
      3: {
        'title': 'Customer', 
        'description': 'Track your water deliveries and manage your account'
      },
    };

    final currentRole = roleDetails[selectedRole]!;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(
            selectedRole == 1 ? Icons.business : Icons.person,
            color: AppColors.primary,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentRole['title']!,
                  style: AppTextStyles.cardTitle.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  currentRole['description']!,
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Information',
          style: AppTextStyles.sectionTitle,
        ),
        const SizedBox(height: 16),
        AuthInputField(
          label: 'Full Name',
          hintText: 'Enter your full name',
          prefixIcon: Icons.person_outline,
          controller: fullNameController,
        ),
        const SizedBox(height: 16),
        AuthInputField(
          label: 'Email Address',
          hintText: 'Enter your email',
          prefixIcon: Icons.email_outlined,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        AuthInputField(
          label: 'Phone Number',
          hintText: 'Enter your phone number',
          prefixIcon: Icons.phone_outlined,
          controller: phoneController,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 16),
        AuthInputField(
          label: 'Password',
          hintText: 'Enter your password',
          prefixIcon: Icons.lock_outline,
          controller: passwordController,
          obscureText: !isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.textSecondary,
            ),
            onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
          ),
        ),
        const SizedBox(height: 16),
        AuthInputField(
          label: 'Confirm Password',
          hintText: 'Confirm your password',
          prefixIcon: Icons.lock_outline,
          controller: confirmPasswordController,
          obscureText: !isConfirmPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.textSecondary,
            ),
            onPressed: () => setState(() => isConfirmPasswordVisible = !isConfirmPasswordVisible),
          ),
        ),
      ],
    );
  }

  Widget _buildTermsCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: agreeToTerms,
          onChanged: (value) => setState(() => agreeToTerms = value ?? false),
          activeColor: AppColors.primary,
        ),
        Expanded(
          child: Text(
            'I agree to the Terms of Service and Privacy Policy',
            style: AppTextStyles.bodyText,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Cancel',
              style: AppTextStyles.buttonText.copyWith(color: AppColors.primary),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: agreeToTerms ? _handleCreateAccount : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: agreeToTerms 
                  ? AppColors.primary 
                  : AppColors.textTertiary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Create Account',
              style: AppTextStyles.buttonText.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: AppTextStyles.bodyText,
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Sign In',
            style: AppTextStyles.buttonText.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }

  void _handleCreateAccount() {
    if (_validateForm()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Account created successfully!'),
          backgroundColor: AppColors.success,
        ),
      );
      Navigator.pop(context);
    }
  }

  bool _validateForm() {
    if (fullNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      _showErrorSnackBar('Please fill in all fields');
      return false;
    }

    if (passwordController.text != confirmPasswordController.text) {
      _showErrorSnackBar('Passwords do not match');
      return false;
    }

    return true;
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.danger,
      ),
    );
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}