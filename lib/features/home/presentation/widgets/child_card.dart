import 'package:bhcfms_app/core/theme/colors.dart';
import 'package:bhcfms_app/core/theme/spacing.dart';
import 'package:bhcfms_app/core/utils/responsive_helper.dart';
import 'package:bhcfms_app/features/home/presentation/widgets/avatar_placeholder.dart';
import 'package:flutter/material.dart';

class ChildCard extends StatelessWidget {
  const ChildCard({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final radius = BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl));
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(AppSpacing.p24),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: res.scaleWidth(16),
          vertical: res.scaleHeight(8),
        ),
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
        child: Row(
          children: [
            AvatarPlaceholder(
              radius: res.scaleRadius(35),
              icon: Icons.face_rounded,
              backgroundColor: AppColors.primary,
            ),
            SizedBox(width: res.scaleWidth(16)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "محمد أحمد",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : AppColors.textPrimary,
                    fontSize: res.scaleText(16),
                  ),
                ),
                SizedBox(height: res.scaleHeight(8)),
                Text(
                  "جلسات تخاطب و نطق",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : AppColors.textPrimary,
                    fontSize: res.scaleText(12),
                  ),
                ),
                SizedBox(height: res.scaleHeight(8)),
                Text(
                  "الجلسة القادمة: اليوم 3:00 PM",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: res.scaleText(14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
