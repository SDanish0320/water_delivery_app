import 'package:flutter/material.dart';
import 'package:water_delivery_app/theme/app_theme.dart';

class DeliveryBoyMain extends StatelessWidget {
  const DeliveryBoyMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery Boy Dashboard"),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: const Center(
        child: Text(
          "Delivery Boy Home\n(Today's Deliveries, Confirmations, History)",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
