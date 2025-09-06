import 'package:flutter/material.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';
import 'package:water_delivery_app/widgets/common_app_bar.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({super.key});

  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  String selectedTab = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(
        title: 'Invoices',
        showNotification: false,
        showLogout: false,
        leading: BackButton(),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.cardBackground,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.file_download_outlined,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.filter_list,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.cardBackground,
              child: Row(
                children: [
                  _buildFilterTab('All', true),
                  const SizedBox(width: 12),
                  _buildFilterTab('Paid', false),
                  const SizedBox(width: 12),
                  _buildFilterTab('Unpaid', false),
                  const SizedBox(width: 12),
                  _buildFilterTab('Partial', false),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Revenue Overview',
                            style: AppTextStyles.sectionTitle.copyWith(fontSize: 22),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Monthly Revenue Trend',
                                style: AppTextStyles.cardTitle,
                              ),
                              Text(
                                '\$740.00',
                                style: AppTextStyles.sectionTitle.copyWith(
                                  fontSize: 28,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            height: 220,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('\$300', style: AppTextStyles.smallText),
                                    Text('\$250', style: AppTextStyles.smallText),
                                    Text('\$200', style: AppTextStyles.smallText),
                                    Text('\$150', style: AppTextStyles.smallText),
                                    Text('\$100', style: AppTextStyles.smallText),
                                    Text('\$50', style: AppTextStyles.smallText),
                                    Text('\$0', style: AppTextStyles.smallText),
                                  ],
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      _buildChartBar('Jan', 120, AppColors.primary),
                                      _buildChartBar('Feb', 180, AppColors.success),
                                      _buildChartBar('Mar', 90, AppColors.warning),
                                      _buildChartBar('Apr', 150, AppColors.danger),
                                      _buildChartBar('May', 200, const Color(0xFF9C27B0)),
                                      _buildChartBar('Jun', 250, AppColors.primary),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Invoices',
                          style: AppTextStyles.sectionTitle.copyWith(fontSize: 22),
                        ),
                        Text(
                          '5 invoices',
                          style: AppTextStyles.bodyText,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.person,
                              color: AppColors.textTertiary,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'John Doe',
                                  style: AppTextStyles.sectionTitle.copyWith(fontSize: 20),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'INV-001',
                                  style: AppTextStyles.bodyText.copyWith(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '\$120.00',
                            style: AppTextStyles.sectionTitle.copyWith(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(Icons.add, color: Colors.white, size: 24),
        ),
      ),
    );
  }

  Widget _buildFilterTab(String title, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: isSelected ? null : Border.all(color: AppColors.textTertiary),
      ),
      child: Text(
        title,
        style: AppTextStyles.buttonText.copyWith(
          color: isSelected ? Colors.white : AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildChartBar(String month, double value, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 16,
          height: value * 0.72,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          month,
          style: AppTextStyles.smallText.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}