import 'package:flutter/material.dart';
import '../../../../config/routes.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import 'avatar_placeholder.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(AppSpacing.p24),
        vertical: res.scaleSpacing(AppSpacing.p16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Notification Bell with Badge
          Stack(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pushNamed(AppRoutes.notifications),
                icon: Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.textSecondary,
                  size: res.scaleText(28),
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              Positioned(
                top: 2,
                right: Directionality.of(context) == TextDirection.ltr ? 2 : null,
                left: Directionality.of(context) == TextDirection.rtl ? 2 : null,
                child: Container(
                  width: res.scaleWidth(10),
                  height: res.scaleHeight(10),
                  decoration: BoxDecoration(
                    color: AppColors.secondary, // Green notification dot
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 2),
                  ),
                ),
              ),
            ],
          ),
          
          // Center Title
          Text(
            l10n.centerName,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.primary,
                  fontSize: res.scaleText(18),
                ),
          ),

          // Profile Avatar Placeholder
          AvatarPlaceholder(
            radius: res.scaleRadius(20),
          ),
        ],
      ),
    );
  }
}
