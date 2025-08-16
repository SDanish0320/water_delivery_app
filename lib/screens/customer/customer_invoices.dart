import 'package:flutter/material.dart';
import 'package:water_delivery_app/theme/app_theme.dart';

class CustomerInvoices extends StatelessWidget {
  const CustomerInvoices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoices"),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3, // dummy count
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.receipt_long_outlined,
                  color: AppTheme.primaryColor),
              title: Text("Invoice #${index + 1}"),
              subtitle: const Text("Amount: \$50.00"),
              trailing: const Text(
                "Paid",
                style: TextStyle(color: Colors.green),
              ),
            ),
          );
        },
      ),
    );
  }
}
