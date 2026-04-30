import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import 'language_row.dart';
import 'notifications_row.dart';

class SettingsCard extends StatelessWidget {
  final ResponsiveHelper res;
  final AppLocalizations l10n;
  final bool isDark;
  final bool notificationsEnabled;
  final String currentLocale;
  final ValueChanged<bool> onToggleNotifications;
  final ValueChanged<String> onChangeLanguage;

  const SettingsCard({
    super.key,
    required this.res,
    required this.l10n,
    required this.isDark,
    required this.notificationsEnabled,
    required this.currentLocale,
    required this.onToggleNotifications,
    required this.onChangeLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(res.scaleRadius(18)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          LanguageRow(
            res: res,
            l10n: l10n,
            isDark: isDark,
            currentLocale: currentLocale,
            onChangeLanguage: onChangeLanguage,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(16)),
            child: Divider(
              height: 1,
              color: isDark
                  ? Colors.white.withValues(alpha: 0.08)
                  : Colors.black.withValues(alpha: 0.07),
            ),
          ),
          NotificationsRow(
            res: res,
            l10n: l10n,
            isDark: isDark,
            enabled: notificationsEnabled,
            onToggle: onToggleNotifications,
          ),
        ],
      ),
    );
  }
}
