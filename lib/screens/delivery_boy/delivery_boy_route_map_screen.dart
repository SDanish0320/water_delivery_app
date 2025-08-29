import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class RouteMapScreen extends StatefulWidget {
  const RouteMapScreen({super.key});

  @override
  State<RouteMapScreen> createState() => _RouteMapScreenState();
}

class _RouteMapScreenState extends State<RouteMapScreen> {
  GoogleMapController? mapController;
  int selectedTab = 0; // 0 = Deliveries, 1 = Customers
  Completer<GoogleMapController> _controller = Completer();
  bool _isMapReady = false;
  bool _hasError = false;

  final LatLng _center = const LatLng(24.8607, 67.0011); // Karachi coordinates

  final List<Map<String, dynamic>> deliveries = [
    {
      'name': 'John Doe',
      'address': '123 Main St, Downtown',
      'bottles': 5,
      'time': '09:30 AM',
      'date': '2025-08-06',
      'status': 'Completed',
      'statusColor': Color(0xFF10B981),
      'statusBgColor': Color(0xFFD1FAE5),
      'icon': Icons.local_shipping,
      'iconColor': Color(0xFF10B981),
      'iconBgColor': Color(0xFFD1FAE5),
    },
    {
      'name': 'Jane Smith',
      'address': '456 Oak Ave, Uptown',
      'bottles': 3,
      'time': '10:00 AM',
      'date': '2025-08-06',
      'status': 'Pending',
      'statusColor': Color(0xFFFF8C00),
      'statusBgColor': Color(0xFFFFF3CD),
      'icon': Icons.local_shipping,
      'iconColor': Color(0xFFFF8C00),
      'iconBgColor': Color(0xFFFFF3CD),
    },
    {
      'name': 'Sarah Wilson',
      'address': '321 Elm St, Westside',
      'bottles': 4,
      'time': '11:00 AM',
      'date': '2025-08-06',
      'status': 'Completed',
      'statusColor': Color(0xFF10B981),
      'statusBgColor': Color(0xFFD1FAE5),
      'icon': Icons.local_shipping,
      'iconColor': Color(0xFF10B981),
      'iconBgColor': Color(0xFFD1FAE5),
    },
    {
      'name': 'David Brown',
      'address': '654 Maple Dr, Eastside',
      'bottles': 2,
      'time': '12:30 PM',
      'date': '2025-08-06',
      'status': 'Pending',
      'statusColor': Color(0xFFFF8C00),
      'statusBgColor': Color(0xFFFFF3CD),
      'icon': Icons.local_shipping,
      'iconColor': Color(0xFFFF8C00),
      'iconBgColor': Color(0xFFFFF3CD),
    },
  ];

  final List<Map<String, dynamic>> customers = [
    {
      'name': 'Sarah Wilson',
      'address': '321 Elm St, Westside',
      'deliveries': 6,
      'lastDelivery': 'Today',
      'status': 'Active',
      'statusColor': Color(0xFF10B981),
      'statusBgColor': Color(0xFFD1FAE5),
    },
    {
      'name': 'David Brown',
      'address': '654 Maple Dr, Eastside',
      'deliveries': 9,
      'lastDelivery': 'Yesterday',
      'status': 'Active',
      'statusColor': Color(0xFF10B981),
      'statusBgColor': Color(0xFFD1FAE5),
    },
  ];

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  void _initializeMap() async {
    try {
      // Add a small delay to ensure proper initialization
      await Future.delayed(Duration(milliseconds: 500));
      setState(() {
        _isMapReady = true;
      });
    } catch (e) {
      print('Map initialization error: $e');
      setState(() {
        _hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Map View',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.my_location, color: Color(0xFF3B82F6)),
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
          // Map Section
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                _buildMap(),
                // Legend
                Positioned(
                  top: 16,
                  right: 16,
                  child: _buildLegend(),
                ),
              ],
            ),
          ),

          // Bottom Section
          Expanded(
            flex: 2,
            child: Column(
              children: [
                // Tab Buttons
                _buildTabButtons(),

                // Content
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
              SizedBox(height: 16),
              Text(
                'Map unavailable',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Please check your internet connection',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _hasError = false;
                    _isMapReady = false;
                  });
                  _initializeMap();
                },
                child: Text('Retry'),
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
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3B82F6)),
              ),
              SizedBox(height: 16),
              Text(
                'Loading map...',
                style: TextStyle(
                  fontSize: 16,
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
          print('Map created successfully');
        } catch (e) {
          print('Map creation error: $e');
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
      onCameraMove: (CameraPosition position) {
        // Handle camera movement if needed
      },
      onCameraIdle: () {
        // Handle when camera stops moving
      },
    );
  }

  Widget _buildLegend() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Legend',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12),
          _buildLegendItem(
            color: Color(0xFF3B82F6),
            label: 'Customer',
          ),
          SizedBox(height: 8),
          _buildLegendItem(
            color: Color(0xFF10B981),
            label: 'Completed',
          ),
          SizedBox(height: 8),
          _buildLegendItem(
            color: Color(0xFFFF8C00),
            label: 'Pending',
          ),
          SizedBox(height: 8),
          _buildLegendItem(
            color: Color(0xFFDC2626),
            label: 'Cancelled',
          ),
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
        SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildTabButtons() {
    return Container(
      padding: EdgeInsets.all(16),
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
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selectedTab == 0
                      ? Color(0xFF3B82F6)
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Deliveries',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: selectedTab == 0
                          ? Colors.white
                          : Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = 1;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selectedTab == 1
                      ? Color(0xFF3B82F6)
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Customers',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: selectedTab == 1
                          ? Colors.white
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
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today\'s Deliveries (${deliveries.length})',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to full deliveries list
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3B82F6),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
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
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Customers (${customers.length})',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to full customers list
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3B82F6),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
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
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: Offset(0, 2),
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
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        delivery['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: delivery['statusBgColor'],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        delivery['status'],
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: delivery['statusColor'],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  delivery['address'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '${delivery['bottles']} bottles    ${delivery['date']} • ${delivery['time']}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
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
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Color(0xFFE6F3FF),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(
              Icons.person,
              color: Color(0xFF3B82F6),
              size: 24,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        customer['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: customer['statusBgColor'],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        customer['status'],
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: customer['statusColor'],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  customer['address'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '${customer['deliveries']} deliveries    Last: ${customer['lastDelivery']}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
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