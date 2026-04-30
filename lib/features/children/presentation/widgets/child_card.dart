import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class ChildCard extends StatelessWidget {
  final String name;
  final String sessionType;
  final double progress;
  final int avatarColorValue;
  final VoidCallback onViewDetails;

  const ChildCard({
    super.key,
    required this.name,
    required this.sessionType,
    required this.progress,
    required this.avatarColorValue,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final avatarColor = Color(avatarColorValue);
    final progressPercent = (progress * 100).toInt();

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
        border: Border.all(
          color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Green accent border on leading edge
              Container(
                width: res.scaleWidth(5),
                color: AppColors.secondary,
              ),
              // Card content
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name + Avatar row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: isDark ? Colors.white : AppColors.textPrimary,
                                        fontSize: res.scaleText(16),
                                      ),
                                ),
                                SizedBox(height: res.scaleHeight(4)),
                                Text(
                                  sessionType,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: AppColors.textSecondary,
                                        fontSize: res.scaleText(13),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: res.scaleWidth(12)),
                          // Avatar circle
                          Container(
                            width: res.scaleWidth(52),
                            height: res.scaleWidth(52),
                            decoration: BoxDecoration(
                              color: avatarColor.withValues(alpha: 0.15),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: avatarColor.withValues(alpha: 0.35),
                                width: 1.5,
                              ),
                            ),
                            child: Icon(
                              Icons.face_rounded,
                              size: res.scaleText(28),
                              color: avatarColor,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: res.scaleHeight(16)),

                      // Progress label + percent
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$progressPercent%',
                            style: TextStyle(
                              fontSize: res.scaleText(14),
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondary,
                            ),
                          ),
                          Text(
                            l10n.progressAchieved,
                            style: TextStyle(
                              fontSize: res.scaleText(13),
                              color: isDark ? Colors.white70 : AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: res.scaleHeight(8)),

                      // Progress bar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusSm)),
                        child: SizedBox(
                          height: res.scaleHeight(8),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor:
                                isDark ? Colors.grey[800] : const Color(0xFFE8F5E9),
                            valueColor:
                                const AlwaysStoppedAnimation<Color>(AppColors.secondary),
                          ),
                        ),
                      ),

                      SizedBox(height: res.scaleHeight(16)),

                      // View Details button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: onViewDetails,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            minimumSize: Size(double.infinity, res.scaleHeight(42)),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                res.scaleRadius(AppSpacing.radiusXl),
                              ),
                            ),
                          ),
                          child: Text(
                            l10n.viewDetails,
                            style: TextStyle(
                              fontSize: res.scaleText(14),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
