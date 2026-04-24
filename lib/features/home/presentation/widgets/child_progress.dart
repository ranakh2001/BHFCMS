import 'package:bhcfms_app/core/localization/generated/app_localizations.dart';
import 'package:bhcfms_app/core/theme/colors.dart';
import 'package:bhcfms_app/core/theme/spacing.dart';
import 'package:bhcfms_app/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

class ChildProgress extends StatelessWidget {
  const ChildProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(AppSpacing.p24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.progressTitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textPrimary,
              fontSize: res.scaleText(16),
            ),
          ),
          SizedBox(height: res.scaleHeight(16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(res.scaleRadius(AppSpacing.radiusLg)),
                  ),
                  child:const LinearProgressIndicator(
                    value: 0.6,
                    minHeight: 8,
                    backgroundColor: Color(0xFFE0E0E0),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.secondary,
                    ),
                  ),
                ),
              ),
              SizedBox(width: res.scaleWidth(16)),
              Text(
                "60%",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.textPrimary,
                  fontSize: res.scaleText(16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
