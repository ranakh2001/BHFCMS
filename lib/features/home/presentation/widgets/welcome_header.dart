import 'package:bhcfms_app/features/auth/domain/entities/user_role.dart';
import 'package:bhcfms_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class WelcomeHeader extends ConsumerWidget {
  final String userName;

  const WelcomeHeader({super.key, required this.userName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final user = ref.watch(currentUserProvider);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(AppSpacing.p24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.welcomeBack(userName),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark
                  ? Colors.white
                  : const Color(0xFF2C3E50), // Navy text
              fontSize: res.scaleText(22),
            ),
          ),
          SizedBox(height: res.scaleHeight(6)),
          Text(
            user?.role == UserRole.parent
                ? l10n.parentsWelocome
                : l10n.todayTasks,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              fontSize: res.scaleText(14),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
