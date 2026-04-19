import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // Top Logo
        ClipRRect(
          borderRadius: BorderRadius.circular(
            res.scaleRadius(AppSpacing.radiusMd),
          ),
          child: Image.asset(
            'assets/logos/logo_login.png',
            height: res.scaleHeight(isDark ? 76 : 100),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.broken_image,
              size: res.scaleHeight(80),
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(height: res.scaleHeight(AppSpacing.p24)),

        // Title
        Text(
          l10n.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: isDark
                ? Colors.white
                : const Color(0xFF1B2C4F), // Dark navy from design
            fontSize: res.scaleText(28),
          ),
        ),
        SizedBox(height: res.scaleHeight(AppSpacing.p8)),

        // Subtitle
        Text(
          l10n.welcomeSubtitle,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: isDark ? Colors.grey[300] : AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: res.scaleHeight(4)),

        // Step by step
        Text(
          l10n.loginStepByStep,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isDark ? Colors.grey[400] : AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
