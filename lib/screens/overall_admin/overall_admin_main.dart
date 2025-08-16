import 'package:flutter/material.dart';
import 'package:water_delivery_app/theme/app_theme.dart';

class OverallAdminMain extends StatelessWidget {
  const OverallAdminMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Overall Admin Dashboard"),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: const Center(
        child: Text(
          "Overall Admin Home\n(Companies, Users, Reports)",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
