import 'package:flutter/material.dart';
import 'package:water_delivery_app/theme/app_theme.dart';


class CustomerDashboard extends StatelessWidget {
  const CustomerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
  
    final horizontalPadding = screenWidth * 0.05; 
    final cardSpacing = screenWidth * 0.03; 
    
    return Container(
      color: const Color(0xFFF8FAFC),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            screenHeight * 0.02,
            horizontalPadding,
            screenHeight * 0.12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'My Account',
                      style: TextStyle(
                        fontSize: screenWidth * 0.07, 
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  _buildTopBarButton(Icons.notifications_none),
                  SizedBox(width: cardSpacing),
                  _buildTopBarButton(Icons.logout),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),

          
              Container(
                padding: EdgeInsets.all(screenWidth * 0.05),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                      color: Colors.black.withOpacity(0.06),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: screenWidth * 0.08, 
                      backgroundColor: const Color(0xFFDDD6FE),
                      child: Text(
                        'D',
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome, Danish!',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            'AquaFlow Solutions',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: screenWidth * 0.04,
                                color: Colors.grey.shade600,
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              Expanded(
                                child: Text(
                                  'R-609, Sector 9, North Karachi',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.032,
                                    color: Colors.grey.shade600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              Text(
                'Account Summary',
                style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              LayoutBuilder(
                builder: (context, constraints) {
    
                  final cardWidth = (constraints.maxWidth - cardSpacing) / 2;
                  final shouldUseGrid = cardWidth > 140; 
                  
                  if (shouldUseGrid) {
                    return GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: cardSpacing,
                      mainAxisSpacing: cardSpacing,
                      childAspectRatio: _calculateAspectRatio(screenWidth),
                      physics: const NeverScrollableScrollPhysics(),
                      children: _buildStatCards(screenWidth),
                    );
                  } else {
                  
                    return Column(
                      children: _buildStatCards(screenWidth)
                          .map((card) => Padding(
                                padding: EdgeInsets.only(bottom: cardSpacing),
                                child: card,
                              ))
                          .toList(),
                    );
                  }
                },
              ),
              SizedBox(height: screenHeight * 0.04),

              Text(
                'Next Delivery',
                style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

        
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(screenWidth * 0.05),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                      color: Colors.black.withOpacity(0.06),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.event_available_outlined,
                        size: screenWidth * 0.08,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'No upcoming delivery added',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBarButton(IconData icon) {
    return Builder(
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        return Container(
          padding: EdgeInsets.all(screenWidth * 0.02),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                offset: const Offset(0, 2),
                color: Colors.black.withOpacity(0.06),
              ),
            ],
          ),
          child: Icon(icon, size: screenWidth * 0.06),
        );
      },
    );
  }

  double _calculateAspectRatio(double screenWidth) {
    if (screenWidth < 350) return 0.75;
    if (screenWidth < 400) return 0.8;
    return 0.85;
  }

  List<Widget> _buildStatCards(double screenWidth) {
    return [
      _StatCard(
        screenWidth: screenWidth,
        icon: Icons.water_drop_outlined,
        iconBg: const Color(0xFFDDD6FE),
        iconColor: AppTheme.primaryColor,
        title: 'This Month',
        mainText: '2 bottles',
        subText: '\$50.00',
        mainColor: AppTheme.primaryColor,
      ),
      _StatCard(
        screenWidth: screenWidth,
        icon: Icons.local_shipping_outlined,
        iconBg: const Color(0xFFD1FAE5),
        iconColor: const Color(0xFF059669),
        title: 'Total Delivered',
        mainText: '45',
        subText: 'All time',
        mainColor: const Color(0xFF059669),
      ),
      _StatCard(
        screenWidth: screenWidth,
        icon: Icons.receipt_long_outlined,
        iconBg: const Color(0xFFFED7AA),
        iconColor: const Color(0xFFD97706),
        title: 'Monthly Bill',
        mainText: '\$1125.00',
        subText: 'Current month',
        mainColor: const Color(0xFFD97706),
      ),
      _StatCard(
        screenWidth: screenWidth,
        icon: Icons.attach_money_outlined,
        iconBg: const Color(0xFFDDD6FE),
        iconColor: AppTheme.primaryColor,
        title: 'Rate per Bottle',
        mainText: '\$25.00',
        subText: '1 pending',
        mainColor: AppTheme.primaryColor,
      ),
    ];
  }
}

class _StatCard extends StatelessWidget {
  final double screenWidth;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String mainText;
  final String subText;
  final Color mainColor;

  const _StatCard({
    required this.screenWidth,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.mainText,
    required this.subText,
    required this.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.06),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(screenWidth * 0.025),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: screenWidth * 0.055,
              color: iconColor,
            ),
          ),
          SizedBox(height: screenWidth * 0.03),
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.032,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: screenWidth * 0.015),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              mainText,
              style: TextStyle(
                fontSize: screenWidth * 0.055,
                fontWeight: FontWeight.w700,
                color: mainColor,
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.01),
          Text(
            subText,
            style: TextStyle(
              fontSize: screenWidth * 0.032,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}