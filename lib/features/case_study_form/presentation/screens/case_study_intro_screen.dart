import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/routes.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../features/auth/presentation/widgets/language_switcher_button.dart';
import '../providers/case_study_provider.dart';

class CaseStudyIntroScreen extends ConsumerWidget {
  const CaseStudyIntroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final formState = ref.watch(caseStudyFormProvider);
    final hasSavedProgress = !formState.isLoading && formState.currentStep > 0;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFD3EAFB), Color(0xFFFEF6DC)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.scaleSpacing(24),
              vertical: responsive.scaleSpacing(16),
            ),
            child: Column(
              children: [
                // ── Header Row ───────────────────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppColors.primary),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const LanguageSwitcherButton(),
                  ],
                ),
                SizedBox(height: responsive.scaleHeight(16)),

                const Spacer(),

                // ── Illustration ────────────────────────────────────────────
                SizedBox(
                  height: responsive.scaleHeight(220),
                  width: responsive.scaleWidth(220),
                  child: Image.asset('assets/logos/case_study_form.png'),
                ),
                SizedBox(height: responsive.scaleHeight(28)),

                // ── Title ───────────────────────────────────────────────────
                Text(
                  l10n.csFormIntroTitle,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: responsive.scaleHeight(14)),

                // ── Body text ───────────────────────────────────────────────
                Text(
                  l10n.csFormIntroBody,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.6,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: responsive.scaleHeight(16)),

                // ── Info note ───────────────────────────────────────────────
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.info_outline,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          l10n.csFormIntroNote(CaseStudyFormState.totalSteps),
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),

                if (hasSavedProgress) ...[
                  SizedBox(height: responsive.scaleHeight(12)),
                  Text(
                    l10n.csFormResumeNote(formState.currentStep + 1),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],

                const Spacer(),

                // ── Start button ────────────────────────────────────────────
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(
                      context,
                    ).pushReplacementNamed(AppRoutes.caseStudyForm),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      hasSavedProgress
                          ? l10n.csFormContinueButton
                          : l10n.csFormStartButton,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: responsive.scaleHeight(16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
