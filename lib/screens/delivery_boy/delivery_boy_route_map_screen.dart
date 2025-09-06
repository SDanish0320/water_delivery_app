import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:water_delivery_app/widgets/common_app_bar.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';

class RouteMapScreen extends StatefulWidget {
  const RouteMapScreen({super.key});

  @override
  State<RouteMapScreen> createState() => _RouteMapScreenState();
}

class _RouteMapScreenState extends State<RouteMapScreen> {
  GoogleMapController? mapController;
  int selectedTab = 0;
  Completer<GoogleMapController> _controller = Completer();
  bool _isMapReady = false;
  bool _hasError = false;

  final LatLng _center = const LatLng(24.8607, 67.0011);

  final List<Map<String, dynamic>> deliveries = [
    {
      'name': 'John Doe',
      'address': '123 Main St, Downtown',
      'bottles': 5,
      'time': '09:30 AM',
      'date': '2025-08-06',
      'status': 'Completed',
      'statusColor': AppColors.success,
      'statusBgColor': AppColors.successLight,
      'icon': Icons.local_shipping,
      'iconColor': AppColors.success,
      'iconBgColor': AppColors.successLight,
    },
    {
      'name': 'Jane Smith',
      'address': '456 Oak Ave, Uptown',
      'bottles': 3,
      'time': '10:00 AM',
      'date': '2025-08-06',
      'status': 'Pending',
      'statusColor': AppColors.warning,
      'statusBgColor': AppColors.warningLight,
      'icon': Icons.local_shipping,
      'iconColor': AppColors.warning,
      'iconBgColor': AppColors.warningLight,
    },
    {
      'name': 'Sarah Wilson',
      'address': '321 Elm St, Westside',
      'bottles': 4,
      'time': '11:00 AM',
      'date': '2025-08-06',
      'status': 'Completed',
      'statusColor': AppColors.success,
      'statusBgColor': AppColors.successLight,
      'icon': Icons.local_shipping,
      'iconColor': AppColors.success,
      'iconBgColor': AppColors.successLight,
    },
    {
      'name': 'David Brown',
      'address': '654 Maple Dr, Eastside',
      'bottles': 2,
      'time': '12:30 PM',
      'date': '2025-08-06',
      'status': 'Pending',
      'statusColor': AppColors.warning,
      'statusBgColor': AppColors.warningLight,
      'icon': Icons.local_shipping,
      'iconColor': AppColors.warning,
      'iconBgColor': AppColors.warningLight,
    },
  ];

  final List<Map<String, dynamic>> customers = [
    {
      'name': 'Sarah Wilson',
      'address': '321 Elm St, Westside',
      'deliveries': 6,
      'lastDelivery': 'Today',
      'status': 'Active',
      'statusColor': AppColors.success,
      'statusBgColor': AppColors.successLight,
    },
    {
      'name': 'David Brown',
      'address': '654 Maple Dr, Eastside',
      'deliveries': 9,
      'lastDelivery': 'Yesterday',
      'status': 'Active',
      'statusColor': AppColors.success,
      'statusBgColor': AppColors.successLight,
    },
  ];

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  void _initializeMap() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        _isMapReady = true;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      appBar: CommonAppBar(
        title: 'Map View',
        showNotification: false,
        showLogout: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location, color: AppColors.primary),
            onPressed: () async {
              if (mapController != null) {
                try {
                  await mapController!.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: _center,
                        zoom: 11.0,
                      ),
                    ),
                  );
                } catch (e) {
                  print('Camera move error: $e');
                }
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                _buildMap(),
                Positioned(
                  top: 16,
                  right: 16,
                  child: _buildLegend(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                _buildTabButtons(),
                Expanded(
                  child: selectedTab == 0
                      ? _buildDeliveriesTab()
                      : _buildCustomersTab(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMap() {
    if (_hasError) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.shade100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.map_outlined,
                size: 64,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 16),
              Text(
                'Map unavailable',
                style: AppTextStyles.cardTitle.copyWith(
                  fontSize: 18,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please check your internet connection',
                style: AppTextStyles.bodyText.copyWith(
                  color: Colors.grey.shade500,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _hasError = false;
                    _isMapReady = false;
                  });
                  _initializeMap();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (!_isMapReady) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.shade100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
              const SizedBox(height: 16),
              Text(
                'Loading map...',
                style: AppTextStyles.cardTitle.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GoogleMap(
      onMapCreated: (GoogleMapController controller) async {
        try {
          if (!_controller.isCompleted) {
            _controller.complete(controller);
          }
          mapController = controller;
        } catch (e) {
          setState(() {
            _hasError = true;
          });
        }
      },
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomGesturesEnabled: true,
      scrollGesturesEnabled: true,
      tiltGesturesEnabled: true,
      rotateGesturesEnabled: true,
      mapToolbarEnabled: false,
      compassEnabled: true,
      trafficEnabled: false,
      buildingsEnabled: true,
      indoorViewEnabled: false,
      liteModeEnabled: false,
    );
  }

  Widget _buildLegend() {
    return Container(
      padding: const EdgeInsets.all(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Legend',
            style: AppTextStyles.cardTitle.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 12),
          _buildLegendItem(color: AppColors.primary, label: 'Customer'),
          const SizedBox(height: 8),
          _buildLegendItem(color: AppColors.success, label: 'Completed'),
          const SizedBox(height: 8),
          _buildLegendItem(color: AppColors.warning, label: 'Pending'),
          const SizedBox(height: 8),
          _buildLegendItem(color: AppColors.danger, label: 'Cancelled'),
        ],
      ),
    );
  }

  Widget _buildLegendItem({required Color color, required String label}) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: AppTextStyles.smallText,
        ),
      ],
    );
  }

  Widget _buildTabButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = 0;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selectedTab == 0
                      ? AppColors.primary
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Deliveries',
                    style: AppTextStyles.cardTitle.copyWith(
                      color: selectedTab == 0
                          ? AppColors.cardBackground
                          : Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = 1;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selectedTab == 1
                      ? AppColors.primary
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Customers',
                    style: AppTextStyles.cardTitle.copyWith(
                      color: selectedTab == 1
                          ? AppColors.cardBackground
                          : Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveriesTab() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today\'s Deliveries (${deliveries.length})',
                style: AppTextStyles.sectionTitle,
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: deliveries.length,
              itemBuilder: (context, index) {
                return _buildDeliveryItem(deliveries[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomersTab() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Customers (${customers.length})',
                style: AppTextStyles.sectionTitle,
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                return _buildCustomerItem(customers[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryItem(Map<String, dynamic> delivery) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: delivery['iconBgColor'],
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(
              delivery['icon'],
              color: delivery['iconColor'],
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        delivery['name'],
                        style: AppTextStyles.cardTitle,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: delivery['statusBgColor'],
                        borderRadius: BorderRadius.circular(6),
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
                const SizedBox(height: 8),
                Text(
                  '${delivery['bottles']} bottles    ${delivery['date']} • ${delivery['time']}',
                  style: AppTextStyles.smallText,
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerItem(Map<String, dynamic> customer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(
              Icons.person,
              color: AppColors.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        customer['name'],
                        style: AppTextStyles.cardTitle,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: customer['statusBgColor'],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        customer['status'],
                        style: AppTextStyles.statusText
                            .copyWith(color: customer['statusColor']),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  customer['address'],
                  style: AppTextStyles.bodyText,
                ),
                const SizedBox(height: 8),
                Text(
                  '${customer['deliveries']} deliveries    Last: ${customer['lastDelivery']}',
                  style: AppTextStyles.smallText,
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }
}