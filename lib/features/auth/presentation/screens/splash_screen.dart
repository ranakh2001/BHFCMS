import 'package:flutter/material.dart';
import '../../../../config/routes.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    const Color(0xFF1B2C4F), // Dark navy
                    const Color(0xFF121212), // Deep dark
                  ]
                : const [
                    Color(0xFFD3EAFB), // Pale blue
                    Color(0xFFFEF6DC), // Pale yellow
                  ],
            stops: const [0.0, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Splash Logo
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(
                  responsive.scaleRadius(AppSpacing.radiusXxl),
                ),
              ),
              padding: EdgeInsets.all(isDark ? responsive.scaleSpacing(16) : 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  isDark ? responsive.scaleRadius(AppSpacing.radiusLg) : 0,
                ),
                child: Image.asset(
                  'assets/logos/logo_splash.png',
                  width: responsive.scaleWidth(isDark ? 148 : 180),
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.broken_image,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: responsive.scaleHeight(24)),
            // App Title
            Text(
              l10n.centerName,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : AppColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: responsive.scaleHeight(8)),
            // Subtitle
            Text(
              l10n.splashSubtitle,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isDark ? Colors.grey[300] : AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
