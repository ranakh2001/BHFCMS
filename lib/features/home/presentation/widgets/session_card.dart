import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import 'avatar_placeholder.dart';

class SessionCard extends StatelessWidget {
  final String sessionType;
  final String studentName;
  final String room;
  final String status;
  final Color statusColor;
  final Color avatarColor;
  final VoidCallback? onTap;

  const SessionCard({
    super.key,
    required this.sessionType,
    required this.studentName,
    required this.room,
    required this.status,
    required this.statusColor,
    required this.avatarColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final radius = BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl));

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: radius,
        border: Border.all(
          color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: radius,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: Padding(
            padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
            child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar (On the right in RTL)
          AvatarPlaceholder(
            radius: res.scaleRadius(35),
            icon: Icons.face_rounded,
            backgroundColor: avatarColor,
          ),
          SizedBox(width: res.scaleWidth(16)),
          
          // Details (On the left in RTL)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sessionType,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : AppColors.textPrimary,
                        fontSize: res.scaleText(16),
                      ),
                ),
                SizedBox(height: res.scaleHeight(6)),
                Row(
                  children: [
                    Icon(
                      Icons.person_outline_rounded,
                      size: res.scaleText(16),
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: res.scaleWidth(4)),
                    Text(
                      studentName,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                            fontSize: res.scaleText(14),
                          ),
                    ),
                  ],
                ),
                SizedBox(height: res.scaleHeight(12)),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: res.scaleSpacing(12),
                        vertical: res.scaleHeight(4),
                      ),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.error.withValues(alpha: 0.2) : AppColors.error.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXxl)),
                        border: isDark ? Border.all(color: AppColors.error.withValues(alpha: 0.5)) : null,
                      ),
                      child: Text(
                        room,
                        style: TextStyle(
                          color: AppColors.error,
                          fontSize: res.scaleText(12),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: res.scaleWidth(8)),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: res.scaleSpacing(12),
                        vertical: res.scaleHeight(4),
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: isDark ? 0.2 : 0.1),
                        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXxl)),
                        border: isDark ? Border.all(color: statusColor.withValues(alpha: 0.5)) : null,
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: res.scaleText(12),
                          fontWeight: FontWeight.w600,
                        ),
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
        ),
      ),
    );
  }
}
