import 'package:flutter/material.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';
import 'package:water_delivery_app/widgets/common_app_bar.dart';
import 'package:water_delivery_app/widgets/status_chip.dart';
import 'package:water_delivery_app/utils/add_customer.dart';
import 'package:water_delivery_app/utils/add_delivery_boy.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  final TextEditingController _searchController = TextEditingController();

  final customers = [
    {
      "name": "John Doe",
      "phone": "+1234567890",
      "address": "123 Main St, Downtown",
      "bottles": "20 bottles/month",
      "instructions": "Leave at front door",
    },
    {
      "name": "Jane Smith",
      "phone": "+1234567891",
      "address": "456 Oak Ave, Uptown",
      "bottles": "30 bottles/month",
      "instructions": "Ring doorbell twice",
    },
    {
      "name": "Mike Johnson",
      "phone": "+1234567892",
      "address": "789 Pine St, Midtown",
      "bottles": "15 bottles/month",
      "instructions": "Call before delivery",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(
        title: 'Customers',
        showNotification: false,
        showLogout: false,
        leading: BackButton(),
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.cardBackground,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search customers...',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: AppColors.textTertiary),
                        hintStyle: TextStyle(color: AppColors.textTertiary),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.bookmark_outline,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.tune,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: customers.length,
              itemBuilder: (context, index) {
                final customer = customers[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            customer["name"]!,
                            style: AppTextStyles.sectionTitle,
                          ),
                          Icon(Icons.more_vert, color: AppColors.textTertiary),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.phone, color: AppColors.textTertiary, size: 18),
                          const SizedBox(width: 8),
                          Text(
                            customer["phone"]!,
                            style: AppTextStyles.bodyText,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.textTertiary,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              customer["address"]!,
                              style: AppTextStyles.bodyText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StatusChip(
                            text: customer["bottles"]!,
                            textColor: AppColors.primary,
                            backgroundColor: AppColors.primaryLight,
                          ),
                          Text(
                            customer["instructions"]!,
                            style: AppTextStyles.smallText.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: AppColors.cardBackground,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) {
              return SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.person_add,
                        color: AppColors.primary,
                      ),
                      title: const Text('Add Customer'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddCustomerScreen(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.delivery_dining,
                        color: AppColors.primary,
                      ),
                      title: const Text('Add Delivery Boy'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddDeliveryBoyScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}