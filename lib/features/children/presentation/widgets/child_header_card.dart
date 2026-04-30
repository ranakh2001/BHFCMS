import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class ChildHeaderCard extends StatelessWidget {
  final String name;
  final String familyName;
  final String condition;
  final String status;
  final Color avatarColor;
  final Color statusColor;
  final bool isDark;
  final ResponsiveHelper res;
  final VoidCallback? onChatTap;

  const ChildHeaderCard({
    super.key,
    required this.name,
    required this.familyName,
    required this.condition,
    required this.status,
    required this.avatarColor,
    required this.statusColor,
    required this.isDark,
    required this.res,
    this.onChatTap,
  });

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final cardColor = isDark ? AppColors.surfaceDark : Colors.white;
    final radius = res.scaleRadius(AppSpacing.radiusLg);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: res.scaleSpacing(AppSpacing.p16)),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isRtl)
                Container(width: res.scaleWidth(5), color: AppColors.primary),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p12)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Avatar (start side)
                      Container(
                        width: res.scaleWidth(60),
                        height: res.scaleHeight(60),
                        decoration: BoxDecoration(
                          color: avatarColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
                        ),
                        child: Center(
                          child: Text(
                            name.isNotEmpty ? name[0] : '?',
                            style: TextStyle(
                              color: avatarColor,
                              fontWeight: FontWeight.bold,
                              fontSize: res.scaleText(24),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: res.scaleWidth(AppSpacing.p12)),
                      // Text column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                // Status badge
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: res.scaleSpacing(8),
                                    vertical: res.scaleHeight(2),
                                  ),
                                  decoration: BoxDecoration(
                                    color: statusColor.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(res.scaleRadius(20)),
                                  ),
                                  child: Text(
                                    status,
                                    style: TextStyle(
                                      color: statusColor,
                                      fontSize: res.scaleText(11),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(width: res.scaleWidth(6)),
                                Flexible(
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: res.scaleText(15),
                                      color: isDark ? Colors.white : AppColors.textPrimary,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: res.scaleHeight(3)),
                            Text(
                              familyName,
                              style: TextStyle(
                                fontSize: res.scaleText(13),
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(height: res.scaleHeight(2)),
                            Text(
                              condition,
                              style: TextStyle(
                                fontSize: res.scaleText(12),
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Chat icon (end side)
                      GestureDetector(
                        onTap: onChatTap,
                        child: Container(
                          padding: EdgeInsets.all(res.scaleSpacing(6)),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(res.scaleRadius(8)),
                          ),
                          child: Icon(
                            Icons.chat_bubble_outline_rounded,
                            color: AppColors.primary,
                            size: res.scaleText(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (!isRtl)
                Container(width: res.scaleWidth(5), color: AppColors.primary),
            ],
          ),
        ),
      ),
    );
  }
}
