import 'package:flutter/material.dart';
import '../../../../../core/localization/generated/app_localizations.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/spacing.dart';
import '../../../../../core/utils/responsive_helper.dart';

class ChildSessionInfoCard extends StatelessWidget {
  final String sessionType;
  final String room;
  final String status;
  final Color statusColor;

  const ChildSessionInfoCard({
    super.key,
    required this.sessionType,
    required this.room,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p20)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
        border: Border.all(
          color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.sessionInfo,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.textPrimary,
                  fontSize: res.scaleText(16),
                ),
          ),
          SizedBox(height: res.scaleHeight(16)),
          _InfoRow(
            icon: Icons.record_voice_over_rounded,
            label: sessionType,
            res: res,
            isDark: isDark,
          ),
          SizedBox(height: res.scaleHeight(10)),
          _InfoRow(
            icon: Icons.meeting_room_rounded,
            label: room,
            res: res,
            isDark: isDark,
          ),
          SizedBox(height: res.scaleHeight(12)),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: res.scaleSpacing(12),
              vertical: res.scaleHeight(6),
            ),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXxl)),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: res.scaleText(13),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final ResponsiveHelper res;
  final bool isDark;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.res,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: res.scaleText(18), color: AppColors.primary),
        SizedBox(width: res.scaleWidth(8)),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isDark ? Colors.white70 : AppColors.textPrimary,
                fontSize: res.scaleText(14),
              ),
        ),
      ],
    );
  }
}
