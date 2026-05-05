import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/providers.dart';
import '../../../../config/routes.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../auth/domain/entities/user_role.dart';
import '../providers/auth_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // [AuthNotifier.build] fires _restoreSession() immediately.
    // We listen here so the navigation happens exactly once when loading ends.
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (previous?.isLoading == true && !next.isLoading) {
        if (!next.isAuthenticated) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.login);
          return;
        }

        final user = next.user!;
        if (user.accountType == AccountType.parent) {
          final prefs = ref.read(sharedPrefServiceProvider);
          if (prefs.isParentFirstLogin(user.id)) {
            Navigator.of(context)
                .pushReplacementNamed(AppRoutes.caseStudyIntro);
            return;
          }
        }
        Navigator.of(context).pushReplacementNamed(AppRoutes.main);
      }
    });

    final responsive = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [
                    const Color(0xFF1B2C4F),
                    const Color(0xFF121212),
                  ]
                : const [
                    Color(0xFFD3EAFB),
                    Color(0xFFFEF6DC),
                  ],
            stops: const [0.0, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(
                  responsive.scaleRadius(AppSpacing.radiusXxl),
                ),
              ),
              padding: EdgeInsets.all(
                isDark ? responsive.scaleSpacing(16) : 0,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  isDark ? responsive.scaleRadius(AppSpacing.radiusLg) : 0,
                ),
                child: Image.asset(
                  'assets/logos/logo_splash.png',
                  width: responsive.scaleWidth(isDark ? 148 : 180),
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.broken_image,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: responsive.scaleHeight(24)),
            Text(
              l10n.centerName,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : AppColors.primary,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: responsive.scaleHeight(8)),
            Text(
              l10n.splashSubtitle,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isDark
                        ? Colors.grey[300]
                        : AppColors.textSecondary,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: responsive.scaleHeight(48)),
            // Subtle progress indicator while the session is being restored
            SizedBox(
              width: responsive.scaleWidth(32),
              height: responsive.scaleWidth(32),
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: isDark ? Colors.white54 : AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
