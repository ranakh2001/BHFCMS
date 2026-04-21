import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  final Map<int, int> _answers = {};

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final testName = args?['testName'] as String? ?? l10n.assessmentTitle;

    final questions = [
      l10n.doesChildLookQuestion,
      l10n.doesChildLookQuestion,
      l10n.doesChildLookQuestion,
    ];

    final options = [
      l10n.ratingWeak,
      l10n.ratingGood,
      l10n.ratingMedium,
      l10n.ratingExcellent,
    ];

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        elevation: 0,
        centerTitle: true,
        title: Text(
          testName,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : AppColors.primary,
            fontSize: res.scaleText(18),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: isDark ? Colors.white : AppColors.textPrimary,
            size: res.scaleText(20),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.fromLTRB(
                res.scaleSpacing(AppSpacing.p16),
                res.scaleHeight(AppSpacing.p16),
                res.scaleSpacing(AppSpacing.p16),
                res.scaleHeight(AppSpacing.p16),
              ),
              itemCount: questions.length,
              separatorBuilder: (_, __) => SizedBox(height: res.scaleHeight(AppSpacing.p12)),
              itemBuilder: (context, qi) {
                return Container(
                  padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.surfaceDark : Colors.white,
                    borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
                    border: Border.all(
                      color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: isDark ? 0.15 : 0.04),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        questions[qi],
                        style: TextStyle(
                          fontSize: res.scaleText(14),
                          fontWeight: FontWeight.w600,
                          color: isDark ? Colors.white : AppColors.textPrimary,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(height: res.scaleHeight(AppSpacing.p12)),
                      ...List.generate(options.length, (oi) {
                        final selected = _answers[qi] == oi;
                        return GestureDetector(
                          onTap: () => setState(() => _answers[qi] = oi),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: res.scaleHeight(4)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  options[oi],
                                  style: TextStyle(
                                    fontSize: res.scaleText(14),
                                    color: selected
                                        ? AppColors.primary
                                        : (isDark ? Colors.white70 : AppColors.textSecondary),
                                    fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                                  ),
                                ),
                                SizedBox(width: res.scaleWidth(8)),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 150),
                                  width: res.scaleWidth(20),
                                  height: res.scaleWidth(20),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: selected ? AppColors.primary : Colors.grey[400]!,
                                      width: selected ? 5 : 1.5,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                );
              },
            ),
          ),
          // Finish button
          Padding(
            padding: EdgeInsets.fromLTRB(
              res.scaleSpacing(AppSpacing.p16),
              0,
              res.scaleSpacing(AppSpacing.p16),
              res.scaleHeight(AppSpacing.p24),
            ),
            child: SizedBox(
              width: double.infinity,
              height: res.scaleHeight(50),
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  l10n.finishAssessment,
                  style: TextStyle(
                    fontSize: res.scaleText(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
