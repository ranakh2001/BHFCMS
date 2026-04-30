import 'package:bhcfms_app/config/routes.dart';
import 'package:bhcfms_app/core/localization/generated/app_localizations.dart';
import 'package:bhcfms_app/core/theme/spacing.dart';
import 'package:bhcfms_app/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

Widget buildAiBanner(
  BuildContext context,
  AppLocalizations l10n,
  ResponsiveHelper res,
) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, AppRoutes.aiSuggestions),
    child: Container(
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E88B5), Color(0xFF0D6E96)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusLg),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.auto_awesome, color: Colors.white, size: 16),
              SizedBox(width: res.scaleWidth(6)),
              Text(
                l10n.smartSuggestions,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: res.scaleText(14),
                ),
              ),
            ],
          ),
          SizedBox(height: res.scaleHeight(4)),
          Text(
            l10n.getNewGoals,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: res.scaleText(12),
            ),
          ),
          SizedBox(height: res.scaleHeight(4)),
          Text(
            'تحسين نطق الحروف الصعبة',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: res.scaleText(11),
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.aiSuggestions),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: res.scaleSpacing(16),
                    vertical: res.scaleHeight(6),
                  ),
                ),
                child: Text(
                  l10n.suggestGoals,
                  style: TextStyle(fontSize: res.scaleText(12)),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
