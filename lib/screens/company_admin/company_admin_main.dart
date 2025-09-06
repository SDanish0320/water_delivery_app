// lib/screens/company_admin/company_admin_main.dart
import 'package:flutter/material.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/widgets/common_app_bar.dart';
import 'package:water_delivery_app/widgets/company_admin/company_overview_card.dart';
import 'package:water_delivery_app/widgets/stat_card.dart';
import 'package:water_delivery_app/widgets/quick_action_card.dart';
import 'package:water_delivery_app/widgets/company_admin/welcome_card.dart';
import 'package:water_delivery_app/widgets/company_admin/pricing_control_card.dart';
import 'package:water_delivery_app/widgets/company_admin/customer_pricing_card.dart';
import 'package:water_delivery_app/screens/company_admin/company_admin_customer_screen.dart';
import 'package:water_delivery_app/screens/company_admin/company_admin_invoices_screen.dart';
import 'package:water_delivery_app/screens/company_admin/company_admin_profile.dart';
import 'package:water_delivery_app/screens/company_admin/delivery_boys_screen.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';

class CompanyAdminMain extends StatefulWidget {
  const CompanyAdminMain({super.key});

  @override
  State<CompanyAdminMain> createState() => _CompanyAdminMainState();
}

class _CompanyAdminMainState extends State<CompanyAdminMain> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const _DashboardScreen(),
    const CustomersScreen(),
    const InvoicesScreen(),
    const CompanyAdminProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _selectedIndex == 0 
          ? const CommonAppBar(
              title: 'Company Dashboard',
              showNotification: true,
              showLogout: true,
            )
          : null,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textTertiary,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Customers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Invoices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              backgroundColor: AppColors.primary,
              onPressed: () {},
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }
}

class _DashboardScreen extends StatelessWidget {
  const _DashboardScreen();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WelcomeCard(
            adminName: 'John Smith',
            companyName: 'AquaFlow Solutions',
          ),
          const SizedBox(height: 24),
          Text(
            'Company Overview',
            style: AppTextStyles.sectionTitle.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CompanyOverviewCard(
                      icon: Icons.people,
                      iconColor: AppColors.primary,
                      iconBgColor: AppColors.primaryLight,
                      value: '3',
                      label: 'Customers',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CompanyOverviewCard(
                      icon: Icons.delivery_dining,
                      iconColor: AppColors.success,
                      iconBgColor: AppColors.successLight,
                      value: '2',
                      label: 'Delivery Boys',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CompanyOverviewCard(
                      icon: Icons.attach_money,
                      iconColor: AppColors.warning,
                      iconBgColor: AppColors.warningLight,
                      value: '\$2K',
                      label: 'Revenue',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CompanyOverviewCard(
                      icon: Icons.receipt_long,
                      iconColor: AppColors.primary,
                      iconBgColor: AppColors.primaryLight,
                      value: '1/2',
                      label: 'Paid Invoices',
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Management Actions',
            style: AppTextStyles.sectionTitle.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.8,
            children: [
              QuickActionCard(
                icon: Icons.people,
                iconColor: AppColors.primary,
                iconBgColor: AppColors.primaryLight,
                title: 'Manage Customers',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomersScreen(),
                    ),
                  );
                },
              ),
              QuickActionCard(
                icon: Icons.delivery_dining,
                iconColor: AppColors.success,
                iconBgColor: AppColors.successLight,
                title: 'Delivery Boys',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeliveryBoysScreen(),
                    ),
                  );
                },
              ),
              QuickActionCard(
                icon: Icons.attach_money,
                iconColor: AppColors.warning,
                iconBgColor: AppColors.warningLight,
                title: 'Set Pricing',
                onTap: () {},
              ),
              QuickActionCard(
                icon: Icons.receipt_long,
                iconColor: AppColors.primary,
                iconBgColor: AppColors.primaryLight,
                title: 'Monthly Invoices',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InvoicesScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Dynamic Pricing Control',
            style: AppTextStyles.sectionTitle.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 16),
          PricingControlCard(
            onManagePressed: () => _showCustomerPricingBottomSheet(context),
          ),
        ],
      ),
    );
  }

  void _showCustomerPricingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.85,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          child: const Icon(
                            Icons.attach_money,
                            color: AppColors.primary,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Customer Pricing Management',
                            style: AppTextStyles.cardTitle.copyWith(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          CustomerPricingCard(
                            customerName: 'Emily Chen',
                            address: '123 Oak Street, Apartment 4B',
                            price: '\$25.00',
                            onEditPressed: () => _showEditPriceDialog(context, 'Emily Chen', '\$25.00'),
                          ),
                          CustomerPricingCard(
                            customerName: 'Robert Taylor',
                            address: '456 Pine Avenue, House 12',
                            price: '\$30.00',
                            onEditPressed: () => _showEditPriceDialog(context, 'Robert Taylor', '\$30.00'),
                          ),
                          CustomerPricingCard(
                            customerName: 'Maria Rodriguez',
                            address: '789 Elm Drive, Suite 5',
                            price: '\$28.00',
                            onEditPressed: () => _showEditPriceDialog(context, 'Maria Rodriguez', '\$28.00'),
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showEditPriceDialog(
    BuildContext context,
    String customerName,
    String currentPrice,
  ) {
    TextEditingController priceController = TextEditingController(
      text: currentPrice.replaceAll('\$', ''),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Price for $customerName'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                  prefixText: '\$',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Price updated for $customerName: \$${priceController.text}',
                    ),
                    backgroundColor: AppColors.success,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}