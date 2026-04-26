import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/providers.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class LanguageSwitcherButton extends ConsumerWidget {
  const LanguageSwitcherButton({super.key});

  void _toggleLanguage(WidgetRef ref) {
    final currentLang = ref.read(localeProvider);
    final newLang = currentLang == 'en' ? 'ar' : 'en';
    ref.read(localeProvider.notifier).updateLocale(newLang);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _toggleLanguage(ref),
        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: res.scaleSpacing(16),
            vertical: res.scaleSpacing(8),
          ),
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : Colors.white,
            borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
            border: Border.all(color: isDark ? Colors.grey.withValues(alpha: 0.3) : Colors.grey.withValues(alpha: 0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.language, size: res.scaleText(16), color: isDark ? Colors.white : AppColors.primary),
              SizedBox(width: res.scaleWidth(6)),
              Text(
                'En/عر',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.textPrimary,
                  fontSize: res.scaleText(14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
