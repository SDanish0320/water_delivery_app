import 'package:flutter/material.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';
import 'package:water_delivery_app/widgets/auth/auth_header_card.dart';
import 'package:water_delivery_app/widgets/auth/auth_input_field.dart';
import 'package:water_delivery_app/widgets/common_app_bar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      appBar: CommonAppBar(
        title: 'Forgot Password',
        showNotification: false,
        showLogout: false,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthHeaderCard(
              icon: Icons.lock_reset,
              title: 'Reset Your Password',
              subtitle: 'Enter your email to receive reset instructions',
            ),
            const SizedBox(height: 40),
            AuthInputField(
              label: 'Email Address',
              hintText: 'Enter your registered email',
              prefixIcon: Icons.email_outlined,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 40),
            _buildActionButtons(),
            const SizedBox(height: 60),
            _buildHelpSection(),
          ],
        ),
      ),
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
            onPressed: _handleSendResetLink,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Send Reset Link',
              style: AppTextStyles.buttonText.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHelpSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.help_outline,
              color: AppColors.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Need Help?',
              style: AppTextStyles.cardTitle,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          "If you don't receive the email within a few minutes, check your spam folder or contact support.",
          style: AppTextStyles.bodyText.copyWith(height: 1.5),
        ),
        const SizedBox(height: 20),
        Center(
          child: TextButton.icon(
            onPressed: _handleContactSupport,
            icon: Icon(Icons.support_agent, color: AppColors.primary, size: 20),
            label: Text(
              'Contact Support',
              style: AppTextStyles.cardTitle.copyWith(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }

  void _handleSendResetLink() {
    if (emailController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Reset link sent to your email!'),
          backgroundColor: AppColors.success,
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please enter your email address'),
          backgroundColor: AppColors.danger,
        ),
      );
    }
  }

  void _handleContactSupport() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Redirecting to support...')),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}