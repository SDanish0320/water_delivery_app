import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../utils/logout_helper.dart';
import '../utils/notification_screen.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showNotification;
  final bool showLogout;
  final Widget? leading;
  final List<Widget>? actions;

  const CommonAppBar({
    Key? key,
    required this.title,
    this.showNotification = true,
    this.showLogout = true,
    this.leading,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.cardBackground,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: leading,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.appBarTitle),
          if (showNotification || showLogout)
            Row(
              children: [
                if (showNotification)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsScreen(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.black87,
                      size: 20,
                    ),
                  ),
                if (showNotification && showLogout) const SizedBox(width: 16),
                if (showLogout)
                  GestureDetector(
                    onTap: () => LogoutHelper.logout(context),
                    child: const Icon(
                      Icons.logout,
                      size: 20,
                      color: Colors.black87,
                    ),
                  ),
              ],
            ),
        ],
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}