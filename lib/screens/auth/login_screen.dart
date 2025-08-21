import 'package:flutter/material.dart';
import 'package:water_delivery_app/screens/auth/forgot_password_screen.dart';
import 'package:water_delivery_app/screens/auth/signup_screen.dart';
import 'package:water_delivery_app/screens/company_admin/company_admin_main.dart';
import 'package:water_delivery_app/screens/customer/customer_main.dart';
import 'package:water_delivery_app/screens/delivery_boy/delivery_boy_main.dart';
import 'package:water_delivery_app/screens/overall_admin/overall_admin_main.dart';
import 'package:water_delivery_app/theme/app_theme.dart';
import 'package:water_delivery_app/widgets/role_selector.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedRole = 0;

  final List<String> roleNames = [
    'Overall Admin',
    'Company Admin',
    'Delivery Boy',
    'Customer'
  ];

  final List<String> roleDescriptions = [
    'Manage all companies, admins and system settings',
    'Manage company operations, delivery boys and customers',
    'Handle deliveries, update status and customer interactions',
    'Track your water deliveries and manage your account'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 40,
                backgroundColor: AppTheme.primaryColor,
                child:
                    const Icon(Icons.water_drop, color: Colors.white, size: 40),
              ),
              const SizedBox(height: 10),
              const Text(
                "AquaFlow",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Water Delivery Management System",
                style: TextStyle(
                    fontSize: 14, color: AppTheme.secondaryTextColor),
              ),
              const SizedBox(height: 30),
              RoleSelector(
                selectedIndex: selectedRole,
                onRoleSelected: (index) {
                  setState(() {
                    selectedRole = index;
                  });
                },
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roleNames[selectedRole],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primaryColor),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.person, color: AppTheme.primaryColor),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            roleDescriptions[selectedRole],
                            style: const TextStyle(
                                fontSize: 12,
                                color: AppTheme.secondaryTextColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email Address",
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: const Icon(Icons.visibility_outlined),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ForgotPasswordScreen()),
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Color.fromARGB(255, 0, 89, 255)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedRole == 0) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const OverallAdminMain()),
                      );
                    } else if (selectedRole == 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CompanyAdminMain()),
                      );
                    } else if (selectedRole == 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DeliveryBoyMain()),
                      );
                    } else if (selectedRole == 3) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CustomerMain()),
                      );
                    }
                  },
                  child: const Text("Sign In"),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SignUpScreen()),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style:
                          TextStyle(color: Color.fromARGB(255, 0, 89, 255)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
