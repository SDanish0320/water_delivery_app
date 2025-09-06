import 'package:flutter/material.dart';
import 'package:water_delivery_app/widgets/common_app_bar.dart';
import 'package:water_delivery_app/widgets/stat_card.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';

class DeliveryHistoryScreen extends StatefulWidget {
  const DeliveryHistoryScreen({super.key});

  @override
  State<DeliveryHistoryScreen> createState() => _DeliveryHistoryScreenState();
}

class _DeliveryHistoryScreenState extends State<DeliveryHistoryScreen> {
  String selectedFilter = 'All';
  bool showFilterDialog = false;
  DateTime? startDate;
  DateTime? endDate;

  final List<String> filterOptions = [
    'All',
    'Completed',
    'Pending',
    'This Week',
    'This Month'
  ];

  final List<Map<String, dynamic>> deliveryHistory = [
    {
      'name': 'Robert Taylor',
      'address': '456 Pine Avenue, House 12',
      'bottles': 3,
      'date': 'Aug 23',
      'time': '13:34',
      'status': 'IN PROGRESS',
      'statusColor': AppColors.warning,
      'statusBgColor': AppColors.warningLight,
    },
    {
      'name': 'Emily Chen',
      'address': '123 Oak Street, Apartment 4B',
      'bottles': 2,
      'date': 'Aug 23',
      'time': '13:34',
      'status': 'DELIVERED',
      'statusColor': AppColors.success,
      'statusBgColor': AppColors.successLight,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        title: 'Delivery History',
        showNotification: false,
        showLogout: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.black87),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatsSection(),
                const SizedBox(height: 24),
                _buildFilterChips(),
                const SizedBox(height: 20),
                _buildDeliveryList(),
              ],
            ),
          ),
          if (showFilterDialog) _buildFilterDialog(),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return const Row(
      children: [
        Expanded(
          child: StatCard(
            icon: Icons.local_shipping,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primaryLight,
            value: '2',
            label: 'Total',
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: StatCard(
            icon: Icons.check_circle,
            iconColor: AppColors.success,
            iconBgColor: AppColors.successLight,
            value: '1',
            label: 'Completed',
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: StatCard(
            icon: Icons.water_drop,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primaryLight,
            value: '5',
            label: 'Bottles',
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: StatCard(
            icon: Icons.calendar_today,
            iconColor: AppColors.warning,
            iconBgColor: AppColors.warningLight,
            value: '2',
            label: 'This Month',
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filterOptions.map((filter) {
          bool isSelected = selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedFilter = filter;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryLight : AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isSelected)
                      const Icon(
                        Icons.check,
                        size: 16,
                        color: AppColors.primary,
                      ),
                    if (isSelected) const SizedBox(width: 4),
                    Text(
                      filter,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isSelected
                            ? AppColors.primary
                            : Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDeliveryList() {
    return Column(
      children: deliveryHistory.map((delivery) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _buildHistoryDeliveryItem(delivery),
        );
      }).toList(),
    );
  }

  Widget _buildHistoryDeliveryItem(Map<String, dynamic> delivery) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          delivery['name'],
                          style: AppTextStyles.cardTitle.copyWith(fontSize: 18),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: delivery['statusBgColor'],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            delivery['status'],
                            style: AppTextStyles.statusText
                                .copyWith(color: delivery['statusColor']),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      delivery['address'],
                      style: AppTextStyles.bodyText,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.water_drop,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${delivery['bottles']} bottles',
                      style: AppTextStyles.smallText.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      delivery['date'],
                      style: AppTextStyles.smallText.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.warningLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 16,
                      color: AppColors.warning,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      delivery['time'],
                      style: AppTextStyles.smallText.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.warning,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterDialog() {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Filter Deliveries',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 24),
                _buildDateSelector('Start Date', startDate, (date) {
                  setState(() {
                    startDate = date;
                  });
                }),
                const SizedBox(height: 16),
                _buildDateSelector('End Date', endDate, (date) {
                  setState(() {
                    endDate = date;
                  });
                }),
                const SizedBox(height: 32),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          startDate = null;
                          endDate = null;
                        });
                      },
                      child: Text(
                        'Clear',
                        style: AppTextStyles.cardTitle.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          showFilterDialog = false;
                        });
                      },
                      child: Text(
                        'Cancel',
                        style: AppTextStyles.cardTitle.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showFilterDialog = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: Text(
                        'Apply',
                        style: AppTextStyles.cardTitle.copyWith(
                          color: AppColors.cardBackground,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateSelector(
      String label, DateTime? selectedDate, Function(DateTime?) onDateSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.cardTitle,
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              onDateSelected(picked);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Text(
                  selectedDate != null
                      ? '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
                      : 'Not selected',
                  style: TextStyle(
                    fontSize: 14,
                    color: selectedDate != null
                        ? AppColors.textPrimary
                        : AppColors.textTertiary,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.calendar_today,
                  size: 20,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showFilterDialog() {
    setState(() {
      showFilterDialog = true;
    });
  }
}