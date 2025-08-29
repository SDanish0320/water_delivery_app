import 'package:flutter/material.dart';

// Notification model class
class NotificationItem {
  final String id;
  final String title;
  final String description;
  final String time;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final bool isRead;
  final NotificationType type;

  NotificationItem({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    this.isRead = false,
    required this.type,
  });
}

enum NotificationType {
  deliveryCompleted,
  invoiceGenerated,
  paymentReceived,
  newCustomer,
  deliveryReminder,
  systemUpdate,
  deliveryCancelled,
  paymentOverdue,
}

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationItem> notifications = [
    NotificationItem(
      id: '1',
      title: 'Delivery Completed',
      description: 'Delivery #123 has been completed successfully for John Doe',
      time: '23d ago',
      icon: Icons.local_shipping,
      iconColor: Color(0xFF10B981),
      iconBgColor: Color(0xFFD1FAE5),
      type: NotificationType.deliveryCompleted,
      isRead: false,
    ),
    NotificationItem(
      id: '2',
      title: 'Invoice Generated',
      description: 'Invoice #INV-2025-001 has been generated for Jane Smith',
      time: '23d ago',
      icon: Icons.description,
      iconColor: Color(0xFF3B82F6),
      iconBgColor: Color(0xFFDDEAFE),
      type: NotificationType.invoiceGenerated,
      isRead: false,
    ),
    NotificationItem(
      id: '3',
      title: 'Payment Received',
      description: 'Payment of \$125.00 received from Mike Johnson',
      time: '23d ago',
      icon: Icons.credit_card,
      iconColor: Color(0xFF10B981),
      iconBgColor: Color(0xFFD1FAE5),
      type: NotificationType.paymentReceived,
      isRead: true,
    ),
    NotificationItem(
      id: '4',
      title: 'New Customer Added',
      description: 'Sarah Wilson has been added as a new customer',
      time: '23d ago',
      icon: Icons.person_add,
      iconColor: Color(0xFF3B82F6),
      iconBgColor: Color(0xFFDDEAFE),
      type: NotificationType.newCustomer,
      isRead: true,
    ),
    NotificationItem(
      id: '5',
      title: 'Delivery Reminder',
      description: 'Reminder: 3 deliveries scheduled for tomorrow',
      time: '23d ago',
      icon: Icons.notifications,
      iconColor: Color(0xFFFF8C00),
      iconBgColor: Color(0xFFFFF3CD),
      type: NotificationType.deliveryReminder,
      isRead: true,
    ),
    NotificationItem(
      id: '6',
      title: 'System Update',
      description: 'App has been updated to version 2.1.0',
      time: '23d ago',
      icon: Icons.system_update,
      iconColor: Color(0xFF3B82F6),
      iconBgColor: Color(0xFFDDEAFE),
      type: NotificationType.systemUpdate,
      isRead: true,
    ),
    NotificationItem(
      id: '7',
      title: 'Delivery Cancelled',
      description: 'Delivery #124 has been cancelled by David Brown',
      time: '24d ago',
      icon: Icons.cancel,
      iconColor: Color(0xFFDC2626),
      iconBgColor: Color(0xFFFEE2E2),
      type: NotificationType.deliveryCancelled,
      isRead: true,
    ),
    NotificationItem(
      id: '8',
      title: 'Payment Overdue',
      description: 'Payment overdue for invoice #INV-2025-002',
      time: '24d ago',
      icon: Icons.warning,
      iconColor: Color(0xFFDC2626),
      iconBgColor: Color(0xFFFEE2E2),
      type: NotificationType.paymentOverdue,
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            
            // Notifications List
            Expanded(
              child: notifications.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: NotificationCard(
                            notification: notifications[index],
                            onTap: () => _markAsRead(notifications[index].id),
                            onDismiss: () => _dismissNotification(notifications[index].id),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.notifications_none,
              size: 48,
              color: Colors.grey.shade400,
            ),
          ),
          SizedBox(height: 24),
          Text(
            'No Notifications',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'You\'re all caught up!',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  void _markAsRead(String notificationId) {
    setState(() {
      int index = notifications.indexWhere((n) => n.id == notificationId);
      if (index != -1) {
        notifications[index] = NotificationItem(
          id: notifications[index].id,
          title: notifications[index].title,
          description: notifications[index].description,
          time: notifications[index].time,
          icon: notifications[index].icon,
          iconColor: notifications[index].iconColor,
          iconBgColor: notifications[index].iconBgColor,
          type: notifications[index].type,
          isRead: true,
        );
      }
    });
  }

  void _dismissNotification(String notificationId) {
    setState(() {
      notifications.removeWhere((n) => n.id == notificationId);
    });
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;
  final VoidCallback onTap;
  final VoidCallback onDismiss;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.onTap,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: notification.isRead ? Colors.white : Color(0xFFF0F8FF),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: notification.isRead ? Color(0xFFE5E7EB) : Color(0xFFBFDBFE),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: notification.iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                notification.icon,
                color: notification.iconColor,
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
                          notification.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      if (!notification.isRead)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Color(0xFF3B82F6),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    notification.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        notification.time,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Icon(
                        Icons.more_vert,
                        color: Colors.grey.shade400,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}