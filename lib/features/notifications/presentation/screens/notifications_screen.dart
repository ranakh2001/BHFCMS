import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../widgets/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final notifications = [
      _NotificationData(
        icon: Icons.calendar_month_rounded,
        iconColor: AppColors.primary,
        title: l10n.notificationNewSession,
        subtitle: 'محمد أحمد — ${l10n.speechSession} — 2:00 PM',
        time: '5m',
      ),
      _NotificationData(
        icon: Icons.check_circle_outline_rounded,
        iconColor: AppColors.success,
        title: l10n.notificationGoalUpdated,
        subtitle: 'تحسين التواصل البصري — ${l10n.statusCompleted}',
        time: '1h',
      ),
      _NotificationData(
        icon: Icons.notifications_active_rounded,
        iconColor: const Color(0xFFFFA726),
        title: l10n.notificationReminder,
        subtitle: '${l10n.speechSession} — ${l10n.room('4')} — 10:00 AM',
        time: '2h',
      ),
      _NotificationData(
        icon: Icons.person_add_rounded,
        iconColor: const Color(0xFF8BC34A),
        title: l10n.notificationNewSession,
        subtitle: 'سارة خالد — ${l10n.speechSession} — ${l10n.room('9')}',
        time: '1d',
      ),
    ];

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        elevation: 0,
        centerTitle: true,
        title: Text(
          l10n.notifications,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : AppColors.primary,
                fontSize: res.scaleText(18),
              ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: isDark ? Colors.white : AppColors.textPrimary,
            size: res.scaleText(20),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        top: false,
        child: notifications.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications_off_outlined,
                      size: res.scaleText(64),
                      color: AppColors.textSecondary.withValues(alpha: 0.4),
                    ),
                    SizedBox(height: res.scaleHeight(16)),
                    Text(
                      l10n.noNotificationsYet,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              )
            : ListView.separated(
                padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p24)),
                itemCount: notifications.length,
                separatorBuilder: (_, __) => SizedBox(height: res.scaleHeight(12)),
                itemBuilder: (context, index) {
                  final n = notifications[index];
                  return NotificationItem(
                    icon: n.icon,
                    iconColor: n.iconColor,
                    title: n.title,
                    subtitle: n.subtitle,
                    time: n.time,
                  );
                },
              ),
      ),
    );
  }
}

class _NotificationData {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String time;

  const _NotificationData({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.time,
  });
}
