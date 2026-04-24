import 'package:bhcfms_app/features/profile/presentation/widgets/logout_button.dart';
import 'package:bhcfms_app/features/profile/presentation/widgets/profile_card.dart';
import 'package:bhcfms_app/features/profile/presentation/widgets/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/providers.dart';
import '../../../../config/routes.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/profile_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final profileState = ref.watch(profileProvider);
    final currentLocale = ref.watch(localeProvider);
    final user = ref.watch(currentUserProvider);

    // Guard: should never be null on this screen, but be safe.
    if (user == null) return const SizedBox.shrink();

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: res.scaleHeight(100)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Title ──────────────────────────────────────────────
              _buildTitle(res, l10n, isDark),
              SizedBox(height: res.scaleHeight(20)),

              // ── Profile Card ───────────────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(16)),
                child: ProfileCard(
                  res: res,
                  l10n: l10n,
                  isDark: isDark,
                  user: user,
                ),
              ),
              SizedBox(height: res.scaleHeight(28)),

              // ── Section label ──────────────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(20)),
                child: Text(
                  l10n.generalSettings,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: res.scaleText(15),
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(height: res.scaleHeight(10)),

              // ── Settings Card ──────────────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(16)),
                child: SettingsCard(
                  res: res,
                  l10n: l10n,
                  isDark: isDark,
                  notificationsEnabled: profileState.notificationsEnabled,
                  currentLocale: currentLocale,
                  onToggleNotifications: (val) => ref
                      .read(profileProvider.notifier)
                      .toggleNotifications(val),
                  onChangeLanguage: (lang) =>
                      ref.read(profileProvider.notifier).changeLanguage(lang),
                ),
              ),
              SizedBox(height: res.scaleHeight(32)),

              // ── Logout button ──────────────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(16)),
                child: LogoutButton(
                  res: res,
                  l10n: l10n,
                  onLogout: () => _showLogoutDialog(context, ref, l10n),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── App Bar title row ────────────────────────────────────────────
  Widget _buildTitle(ResponsiveHelper res, AppLocalizations l10n, bool isDark) {
    return Padding(
      padding: EdgeInsets.only(
        top: res.scaleSpacing(16),
        left: res.scaleSpacing(16),
        right: res.scaleSpacing(16),
      ),
      child: Text(
        l10n.profileTitle,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: res.scaleText(18),
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
      ),
    );
  }

  // ── Logout confirmation dialog ───────────────────────────────────
  Future<void> _showLogoutDialog(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          l10n.logoutConfirmTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        content: Text(
          l10n.logoutConfirmMessage,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(
              l10n.cancel,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.supporting2,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      await ref.read(authNotifierProvider.notifier).logout();
      if (context.mounted) {
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(AppRoutes.login, (_) => false);
      }
    }
  }
}
