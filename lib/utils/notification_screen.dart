import 'package:flutter/material.dart';
import 'package:water_delivery_app/constants/app_colors.dart';
import 'package:water_delivery_app/constants/app_text_styles.dart';
import 'package:water_delivery_app/widgets/common_app_bar.dart';

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
      iconColor: AppColors.success,
      iconBgColor: AppColors.successLight,
      type: NotificationType.deliveryCompleted,
      isRead: false,
    ),
    NotificationItem(
      id: '2',
      title: 'Invoice Generated',
      description: 'Invoice #INV-2025-001 has been generated for Jane Smith',
      time: '23d ago',
      icon: Icons.description,
      iconColor: AppColors.primary,
      iconBgColor: AppColors.primaryLight,
      type: NotificationType.invoiceGenerated,
      isRead: false,
    ),
    NotificationItem(
      id: '3',
      title: 'Payment Received',
      description: 'Payment of \$125.00 received from Mike Johnson',
      time: '23d ago',
      icon: Icons.credit_card,
      iconColor: AppColors.success,
      iconBgColor: AppColors.successLight,
      type: NotificationType.paymentReceived,
      isRead: true,
    ),
    NotificationItem(
      id: '4',
      title: 'New Customer Added',
      description: 'Sarah Wilson has been added as a new customer',
      time: '23d ago',
      icon: Icons.person_add,
      iconColor: AppColors.primary,
      iconBgColor: AppColors.primaryLight,
      type: NotificationType.newCustomer,
      isRead: true,
    ),
    NotificationItem(
      id: '5',
      title: 'Delivery Reminder',
      description: 'Reminder: 3 deliveries scheduled for tomorrow',
      time: '23d ago',
      icon: Icons.notifications,
      iconColor: AppColors.warning,
      iconBgColor: AppColors.warningLight,
      type: NotificationType.deliveryReminder,
      isRead: true,
    ),
    NotificationItem(
      id: '6',
      title: 'System Update',
      description: 'App has been updated to version 2.1.0',
      time: '23d ago',
      icon: Icons.system_update,
      iconColor: AppColors.primary,
      iconBgColor: AppColors.primaryLight,
      type: NotificationType.systemUpdate,
      isRead: true,
    ),
    NotificationItem(
      id: '7',
      title: 'Delivery Cancelled',
      description: 'Delivery #124 has been cancelled by David Brown',
      time: '24d ago',
      icon: Icons.cancel,
      iconColor: AppColors.danger,
      iconBgColor: AppColors.dangerLight,
      type: NotificationType.deliveryCancelled,
      isRead: true,
    ),
    NotificationItem(
      id: '8',
      title: 'Payment Overdue',
      description: 'Payment overdue for invoice #INV-2025-002',
      time: '24d ago',
      icon: Icons.warning,
      iconColor: AppColors.danger,
      iconBgColor: AppColors.dangerLight,
      type: NotificationType.paymentOverdue,
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        title: 'Notifications',
        showNotification: false,
        showLogout: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: notifications.isEmpty
            ? _buildEmptyState()
            : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: NotificationCard(
                      notification: notifications[index],
                      onTap: () => _markAsRead(notifications[index].id),
                      onDismiss: () => _dismissNotification(notifications[index].id),
                    ),
                  );
                },
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
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.textTertiary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.notifications_none,
              size: 48,
              color: AppColors.textTertiary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'No Notifications',
            style: AppTextStyles.sectionTitle.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'You\'re all caught up!',
            style: AppTextStyles.cardTitle.copyWith(
              color: AppColors.textSecondary,
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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: notification.isRead 
              ? AppColors.cardBackground 
              : AppColors.primaryLight.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: notification.isRead 
                ? AppColors.textTertiary 
                : AppColors.primary.withOpacity(0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
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
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,
                          style: AppTextStyles.cardTitle,
                        ),
                      ),
                      if (!notification.isRead)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification.description,
                    style: AppTextStyles.bodyText.copyWith(height: 1.3),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        notification.time,
                        style: AppTextStyles.smallText,
                      ),
                      Icon(
                        Icons.more_vert,
                        color: AppColors.textTertiary,
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