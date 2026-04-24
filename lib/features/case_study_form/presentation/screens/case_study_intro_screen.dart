import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../providers/case_study_provider.dart';

class CaseStudyIntroScreen extends ConsumerWidget {
  const CaseStudyIntroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = ResponsiveHelper(context);
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                // ── Illustration ──────────────────────────────────────────
                SizedBox(
                  height: responsive.scaleHeight(250),
                  width: responsive.scaleWidth(250),
                  child: Image.asset('assets/logos/case_study_form.png'),
                ),
                SizedBox(height: responsive.scaleHeight(32)),

                // ── Title ─────────────────────────────────────────────────
                Text(
                  isAr ? 'قبل البدء' : 'Before You Start',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: responsive.scaleHeight(16)),

                // ── Body text ─────────────────────────────────────────────
                Text(
                  isAr
                      ? 'حتى نقيم طفلك بشكل دقيق. و نقدم ما يمكن أفضل ما يمكن، نحتاج منك تعبئة نموذج دراسة الحالة بشكل الزامي.'
                      : 'To accurately assess your child and provide the best possible service, you are required to fill out the case study form.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: responsive.scaleHeight(20)),

                // ── Info note ─────────────────────────────────────────────
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
                          isAr
                              ? 'النموذج عبارة عن ${CaseStudyFormState.totalSteps} قسم الرجاء تعبئة جميع الأقسام بدقة'
                              : 'The form consists of ${CaseStudyFormState.totalSteps} sections. Please fill out all sections carefully.',
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
                    isAr
                        ? '• سيتم استئناف التقدم من القسم ${formState.currentStep + 1}'
                        : '• Progress will resume from section ${formState.currentStep + 1}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],

                const Spacer(),

                // ── Start button ──────────────────────────────────────────
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
                          ? (isAr ? 'متابعة' : 'Continue')
                          : (isAr ? 'ابدأ الأن' : 'Start Now'),
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
