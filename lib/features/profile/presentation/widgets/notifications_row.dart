import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';

class NotificationsRow extends StatelessWidget {
  final ResponsiveHelper res;
  final AppLocalizations l10n;
  final bool isDark;
  final bool enabled;
  final ValueChanged<bool> onToggle;

  const NotificationsRow({
    super.key,
    required this.res,
    required this.l10n,
    required this.isDark,
    required this.enabled,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(16),
        vertical: res.scaleSpacing(14),
      ),
      child: Row(
        children: [
          // Toggle switch
          Transform.scale(
            scale: res.scaleWidth(1.0).clamp(0.85, 1.1),
            child: Switch(
              value: enabled,
              onChanged: onToggle,
              activeThumbColor: Colors.white,
              activeTrackColor: AppColors.primary,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey.shade300,
            ),
          ),

          const Spacer(),

          // Label + bell icon
          Row(
            children: [
              Text(
                l10n.notificationsLabel,
                style: TextStyle(
                  fontSize: res.scaleText(14),
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : AppColors.textPrimary,
                ),
              ),
              SizedBox(width: res.scaleSpacing(10)),
              Container(
                width: res.scaleWidth(34),
                height: res.scaleWidth(34),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(res.scaleRadius(10)),
                ),
                child: Icon(
                  Icons.notifications_outlined,
                  size: res.scaleWidth(18),
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
