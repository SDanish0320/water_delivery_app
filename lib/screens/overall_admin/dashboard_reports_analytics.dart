import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';
import 'package:water_delivery_app/widgets/common_app_bar.dart';

class ReportsAnalyticsPage extends StatefulWidget {
  const ReportsAnalyticsPage({super.key});

  @override
  State<ReportsAnalyticsPage> createState() => _ReportsAnalyticsPageState();
}

class _ReportsAnalyticsPageState extends State<ReportsAnalyticsPage> {
  String selectedReportType = 'Revenue Report';
  String selectedTimePeriod = 'Month';
  bool showDropdown = false;

  final List<String> reportTypes = [
    'Revenue Report',
    'Delivery Report',
    'Customer Report',
    'Performance Report',
  ];

  final List<String> timePeriods = ['Week', 'Month', 'Quarter', 'Year'];

  final List<FlSpot> revenueData = [
    const FlSpot(1, 3000),
    const FlSpot(2, 3500),
    const FlSpot(3, 3200),
    const FlSpot(4, 4000),
    const FlSpot(5, 3800),
    const FlSpot(6, 4500),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        title: 'Reports & Analytics',
        showNotification: false,
        showLogout: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildHeaderCard(),
            const SizedBox(height: 24),
            _buildReportTypeSection(),
            const SizedBox(height: 24),
            _buildTimePeriodSection(),
            const SizedBox(height: 24),
            _buildSummarySection(),
            const SizedBox(height: 24),
            _buildRevenueChart(),
            const SizedBox(height: 24),
            _buildDetailedReport(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.bar_chart,
              color: AppColors.primary,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Business Reports',
                  style: AppTextStyles.sectionTitle,
                ),
                const SizedBox(height: 4),
                Text(
                  'Track your delivery business performance',
                  style: AppTextStyles.bodyText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Report Type',
            style: AppTextStyles.cardTitle,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    showDropdown = !showDropdown;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.primary, width: 1.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedReportType,
                        style: AppTextStyles.cardTitle,
                      ),
                      Icon(
                        showDropdown ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
              ),
              if (showDropdown)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: reportTypes.map((type) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedReportType = type;
                            showDropdown = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Row(
                            children: [
                              Text(
                                type,
                                style: AppTextStyles.cardTitle,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimePeriodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Time Period',
            style: AppTextStyles.cardTitle,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: timePeriods.map((period) {
              final isSelected = selectedTimePeriod == period;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTimePeriod = period;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected ? AppColors.primary : AppColors.textTertiary,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        period,
                        style: AppTextStyles.bodyText.copyWith(
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.white : AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSummarySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Summary',
            style: AppTextStyles.cardTitle,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildSummaryCard(
                      '\$4,500',
                      'Total Revenue',
                      '+12.5%',
                      Icons.attach_money,
                      AppColors.success,
                      AppColors.successLight,
                      true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildSummaryCard(
                      '125',
                      'Deliveries',
                      '+8.2%',
                      Icons.local_shipping,
                      AppColors.primary,
                      AppColors.primaryLight,
                      true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildSummaryCard(
                      '25',
                      'Customers',
                      '+4.0%',
                      Icons.people,
                      AppColors.primary,
                      AppColors.primaryLight,
                      true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildSummaryCard(
                      '625',
                      'Bottles Sold',
                      '+15.3%',
                      Icons.water_drop,
                      AppColors.warning,
                      AppColors.warningLight,
                      true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(
    String value,
    String title,
    String change,
    IconData icon,
    Color iconColor,
    Color bgColor,
    bool isPositive,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              Row(
                children: [
                  Icon(
                    isPositive ? Icons.trending_up : Icons.trending_down,
                    color: isPositive ? AppColors.success : AppColors.danger,
                    size: 14,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    change,
                    style: AppTextStyles.smallText.copyWith(
                      fontWeight: FontWeight.w500,
                      color: isPositive ? AppColors.success : AppColors.danger,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: AppTextStyles.bodyText,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRevenueChart() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
                'Revenue Trend',
                style: AppTextStyles.sectionTitle,
              ),
              Icon(
                Icons.more_vert,
                color: AppColors.textTertiary,
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                        if (value.toInt() >= 1 && value.toInt() <= months.length) {
                          return Text(
                            months[value.toInt() - 1],
                            style: AppTextStyles.smallText,
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '\$${(value.toInt())}',
                          style: AppTextStyles.smallText,
                        );
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: revenueData,
                    isCurved: true,
                    color: AppColors.primary,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: AppColors.primary,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.primary.withOpacity(0.1),
                    ),
                  ),
                ],
                minX: 1,
                maxX: 6,
                minY: 2500,
                maxY: 5000,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedReport() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
                'Detailed Report',
                style: AppTextStyles.sectionTitle,
              ),
              Text(
                'View Full',
                style: AppTextStyles.bodyText.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildDetailRow('Total Revenue', '\$4,500', '+12.5%', true),
          _buildDetailRow('Total Deliveries', '125', '+8.2%', true),
          _buildDetailRow('Active Customers', '25', '+4.0%', true),
          _buildDetailRow('Bottles Delivered', '625', '+15.3%', true),
          _buildDetailRow('Average Order Value', '\$36', '+2.1%', true),
          _buildDetailRow('Customer Satisfaction', '4.8/5', '+0.2', true),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, String change, bool isPositive) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.bodyText),
          Row(
            children: [
              Text(
                value,
                style: AppTextStyles.cardTitle,
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: isPositive 
                      ? AppColors.successLight 
                      : AppColors.dangerLight,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  change,
                  style: AppTextStyles.smallText.copyWith(
                    fontWeight: FontWeight.w500,
                    color: isPositive ? AppColors.success : AppColors.danger,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}