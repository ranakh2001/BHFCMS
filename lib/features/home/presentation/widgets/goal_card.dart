import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class GoalCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isCompleted;
  final VoidCallback? onToggle;

  const GoalCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
    this.onToggle,
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
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: radius,
        child: InkWell(
          onTap: onToggle,
          borderRadius: radius,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: res.scaleSpacing(AppSpacing.p16),
              vertical: res.scaleHeight(AppSpacing.p16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : AppColors.textPrimary,
                              fontSize: res.scaleText(15),
                            ),
                      ),
                      SizedBox(height: res.scaleHeight(4)),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: res.scaleText(12),
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: res.scaleWidth(16)),
                Container(
                  width: res.scaleWidth(24),
                  height: res.scaleWidth(24),
                  decoration: BoxDecoration(
                    color: isCompleted ? AppColors.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(res.scaleRadius(6)),
                    border: Border.all(color: AppColors.primary, width: 2),
                  ),
                  child: isCompleted
                      ? Icon(Icons.check, color: Colors.white, size: res.scaleText(16))
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
