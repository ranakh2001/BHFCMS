import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';

class LanguageRow extends StatelessWidget {
  final ResponsiveHelper res;
  final AppLocalizations l10n;
  final bool isDark;
  final String currentLocale;
  final ValueChanged<String> onChangeLanguage;

  const LanguageRow({
    super.key,
    required this.res,
    required this.l10n,
    required this.isDark,
    required this.currentLocale,
    required this.onChangeLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final isAr = currentLocale == 'ar';
    final displayLang = isAr ? l10n.arabic : l10n.english;
    final nextLang = isAr ? 'en' : 'ar';

    return InkWell(
      onTap: () => onChangeLanguage(nextLang),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(res.scaleRadius(18)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: res.scaleSpacing(16),
          vertical: res.scaleSpacing(16),
        ),
        child: Row(
          children: [
            // Current language + chevron
            Row(
              children: [
                Icon(
                  Icons.chevron_left_rounded,
                  size: res.scaleWidth(18),
                  color: AppColors.textSecondary,
                ),
                SizedBox(width: res.scaleSpacing(4)),
                Text(
                  displayLang,
                  style: TextStyle(
                    fontSize: res.scaleText(13),
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Label + globe icon
            Row(
              children: [
                Text(
                  l10n.language,
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
                    color: AppColors.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(res.scaleRadius(10)),
                  ),
                  child: Icon(
                    Icons.language_rounded,
                    size: res.scaleWidth(18),
                    color: AppColors.primary,
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
