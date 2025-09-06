import 'package:flutter/material.dart';
import 'package:water_delivery_app/screens/auth/forgot_password_screen.dart';
import 'package:water_delivery_app/screens/auth/signup_screen.dart';
import 'package:water_delivery_app/screens/company_admin/company_admin_main.dart';
import 'package:water_delivery_app/screens/customer/customer_main.dart';
import 'package:water_delivery_app/screens/delivery_boy/delivery_boy_main.dart';
import 'package:water_delivery_app/screens/overall_admin/overall_admin_main.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';
import 'package:water_delivery_app/widgets/auth/role_selector.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedRole = 0;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  final List<String> roleNames = [
    'Overall Admin',
    'Company Admin',
    'Delivery Boy',
    'Customer'
  ];

  final List<String> roleDescriptions = [
    'System administrator with full access to all companies and users',
    'Manage company operations, customers, and delivery staff',
    'Handle daily deliveries, update status and customer interactions',
    'Track your water deliveries and manage your account'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              _buildAppHeader(),
              const SizedBox(height: 30),
              AuthRoleSelector(
                selectedIndex: selectedRole,
                onRoleSelected: (index) {
                  setState(() {
                    selectedRole = index;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildRoleDescription(),
              const SizedBox(height: 30),
              _buildEmailField(),
              const SizedBox(height: 15),
              _buildPasswordField(),
              const SizedBox(height: 10),
              _buildForgotPasswordButton(),
              const SizedBox(height: 20),
              _buildSignInButton(),
              const SizedBox(height: 15),
              _buildSignUpSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.water_drop, color: Colors.white, size: 40),
        ),
        const SizedBox(height: 10),
        const Text(
          "AquaFlow",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          "Water Delivery Management System",
          style: AppTextStyles.bodyText,
        ),
      ],
    );
  }

  Widget _buildRoleDescription() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textTertiary),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            roleNames[selectedRole],
            style: AppTextStyles.cardTitle.copyWith(color: AppColors.primary),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.person, color: AppColors.primary, size: 16),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  roleDescriptions[selectedRole],
                  style: AppTextStyles.smallText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email Address",
        labelStyle: AppTextStyles.cardTitle,
        prefixIcon: Icon(Icons.email_outlined, color: AppColors.textSecondary),
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
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: passwordController,
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: AppTextStyles.cardTitle,
        prefixIcon: Icon(Icons.lock_outline, color: AppColors.textSecondary),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.textSecondary,
          ),
          onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
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
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
          );
        },
        child: Text(
          "Forgot Password?",
          style: AppTextStyles.buttonText.copyWith(color: AppColors.primary),
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _handleSignIn,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          "Sign In",
          style: AppTextStyles.buttonText.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSignUpSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: AppTextStyles.bodyText,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SignUpScreen()),
            );
          },
          child: Text(
            "Sign Up",
            style: AppTextStyles.buttonText.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }

  void _handleSignIn() {
    Widget destination;
    switch (selectedRole) {
      case 0:
        destination = const OverallAdminMain();
        break;
      case 1:
        destination = const CompanyAdminMain();
        break;
      case 2:
        destination = const DeliveryBoyMain();
        break;
      case 3:
        destination = const CustomerMain();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => destination),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}