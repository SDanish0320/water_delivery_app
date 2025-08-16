import 'package:flutter/material.dart';
import 'package:water_delivery_app/theme/app_theme.dart';
import 'package:water_delivery_app/utils/logout_helper.dart';

class CompanyAdminMain extends StatefulWidget {
  const CompanyAdminMain({super.key});

  @override
  State<CompanyAdminMain> createState() => _CompanyAdminMainState();
}

class _CompanyAdminMainState extends State<CompanyAdminMain> {
  int _index = 0;

  final _pages = const [
    _CustomersPage(),
    _PricingPage(),
    _DeliveryBoysPage(),
    _InvoicesPage(),
  ];

  final _titles = const ["Customers", "Pricing", "Delivery Boys", "Invoices"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_index]),
        backgroundColor: AppTheme.primaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          IconButton(
            onPressed: () => LogoutHelper.logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'Customers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.price_change_outlined),
            label: 'Pricing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining_outlined),
            label: 'Delivery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Invoices',
          ),
        ],
      ),
      floatingActionButton: _index == 0 || _index == 2
          ? FloatingActionButton(
              backgroundColor: AppTheme.primaryColor,
              onPressed: () {},
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }
}

//
// -------- Pages --------
//

class _CustomersPage extends StatelessWidget {
  const _CustomersPage();

  @override
  Widget build(BuildContext context) {
    final customers = [
      {"name": "Emily Chen", "address": "123 Oak Street", "status": "Active"},
      {"name": "John Doe", "address": "456 Pine Road", "status": "Pending"},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: customers.length,
      itemBuilder: (context, i) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppTheme.primaryColor.withOpacity(.1),
              child: const Icon(Icons.person, color: AppTheme.primaryColor),
            ),
            title: Text(customers[i]["name"]!),
            subtitle: Text(customers[i]["address"]!),
            trailing: Chip(
              label: Text(customers[i]["status"]!),
              backgroundColor: customers[i]["status"] == "Active"
                  ? Colors.green.shade100
                  : Colors.orange.shade100,
              labelStyle: TextStyle(
                color: customers[i]["status"] == "Active"
                    ? Colors.green
                    : Colors.orange,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PricingPage extends StatelessWidget {
  const _PricingPage();

  @override
  Widget build(BuildContext context) {
    final pricing = [
      {"customer": "Emily Chen", "rate": "\$25.00"},
      {"customer": "John Doe", "rate": "\$22.00"},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: pricing.length,
      itemBuilder: (context, i) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const Icon(
              Icons.price_check,
              color: AppTheme.primaryColor,
            ),
            title: Text(pricing[i]["customer"]!),
            subtitle: const Text("Rate per Bottle"),
            trailing: Text(
              pricing[i]["rate"]!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DeliveryBoysPage extends StatelessWidget {
  const _DeliveryBoysPage();

  @override
  Widget build(BuildContext context) {
    final deliveryBoys = [
      {"name": "Ali Khan", "assigned": "5 customers"},
      {"name": "Sara Ahmed", "assigned": "7 customers"},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: deliveryBoys.length,
      itemBuilder: (context, i) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade50,
              child: const Icon(
                Icons.delivery_dining,
                color: AppTheme.primaryColor,
              ),
            ),
            title: Text(deliveryBoys[i]["name"]!),
            subtitle: Text("Assigned: ${deliveryBoys[i]["assigned"]!}"),
          ),
        );
      },
    );
  }
}

class _InvoicesPage extends StatelessWidget {
  const _InvoicesPage();

  @override
  Widget build(BuildContext context) {
    final invoices = [
      {"month": "July 2025", "amount": "\$1200", "status": "Paid"},
      {"month": "August 2025", "amount": "\$1150", "status": "Pending"},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: invoices.length,
      itemBuilder: (context, i) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const Icon(
              Icons.receipt_long_outlined,
              color: AppTheme.primaryColor,
            ),
            title: Text(invoices[i]["month"]!),
            subtitle: Text("Amount: ${invoices[i]["amount"]!}"),
            trailing: Chip(
              label: Text(invoices[i]["status"]!),
              backgroundColor: invoices[i]["status"] == "Paid"
                  ? Colors.green.shade100
                  : Colors.orange.shade100,
              labelStyle: TextStyle(
                color: invoices[i]["status"] == "Paid"
                    ? Colors.green
                    : Colors.orange,
              ),
            ),
          ),
        );
      },
    );
  }
}
