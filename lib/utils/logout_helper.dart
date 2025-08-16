import 'package:flutter/material.dart';
import 'package:water_delivery_app/screens/auth/login_screen.dart';

class LogoutHelper {
  static void logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }
}
