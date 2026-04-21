import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class _SuggestedGoal {
  final String title;
  final String description;
  final String priorityKey;
  bool addedToPlan = false;

  _SuggestedGoal({
    required this.title,
    required this.description,
    required this.priorityKey,
  });
}

class AiSuggestionsScreen extends StatefulWidget {
  const AiSuggestionsScreen({super.key});

  @override
  State<AiSuggestionsScreen> createState() => _AiSuggestionsScreenState();
}

class _AiSuggestionsScreenState extends State<AiSuggestionsScreen> {
  final List<_SuggestedGoal> _suggestions = [
    _SuggestedGoal(
      title: 'تعزيز التواصل البصري',
      description:
          'الطفل يظهر ضعفاً واضحاً في التواصل البصري، يُنصح بالتركيز على أنشطة تفاعلية قصيرة مع تعزيز مباشر عند تحقيق التواصل.',
      priorityKey: 'high',
    ),
    _SuggestedGoal(
      title: 'تقليل التشتت أثناء الجلسة',
      description:
          'يواجه الطفل صعوبة في التركيز، يُنصح باستخدام أنشطة قصيرة ومتنوعة مع تقليل المشتتات في البيئة.',
      priorityKey: 'medium',
    ),
    _SuggestedGoal(
      title: 'تعزيز التفاعل الاجتماعي',
      description:
          'يمكن العمل على زيادة تفاعل الطفل مع الآخرين من خلال أنشطة جماعية بسيطة.',
      priorityKey: 'continuous',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        elevation: 0,
        centerTitle: true,
        title: Text(
          l10n.aiSuggestionsTitle,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : AppColors.primary,
                fontSize: res.scaleText(17),
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
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                res.scaleSpacing(AppSpacing.p16),
                res.scaleHeight(AppSpacing.p8),
                res.scaleSpacing(AppSpacing.p16),
                res.scaleHeight(AppSpacing.p16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildProfileCard(context, l10n, res, isDark),
                  SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                  _buildGoalsSummaryCard(context, l10n, res, isDark),
                  SizedBox(height: res.scaleHeight(AppSpacing.p20)),
                  Text(
                    l10n.aiSuggestedGoals,
                    style: TextStyle(
                      fontSize: res.scaleText(15),
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(height: res.scaleHeight(AppSpacing.p12)),
                  ...List.generate(_suggestions.length, (i) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: res.scaleHeight(AppSpacing.p12)),
                      child: _buildSuggestionCard(context, l10n, res, isDark, i),
                    );
                  }),
                ],
              ),
            ),
          ),
          // Bottom action buttons
          _buildBottomButtons(context, l10n, res, isDark),
        ],
      ),
    );
  }

  Widget _buildProfileCard(
    BuildContext context,
    AppLocalizations l10n,
    ResponsiveHelper res,
    bool isDark,
  ) {
    return Container(
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
        border: Border.all(color: isDark ? Colors.grey[700]! : Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.15 : 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                l10n.personalProfile,
                style: TextStyle(fontSize: res.scaleText(12), color: AppColors.textSecondary),
              ),
              SizedBox(width: res.scaleWidth(6)),
              Container(
                width: res.scaleWidth(28),
                height: res.scaleWidth(28),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF7E57C2), Color(0xFF1E88B5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(res.scaleRadius(6)),
                ),
                child: const Icon(Icons.auto_awesome, color: Colors.white, size: 16),
              ),
            ],
          ),
          SizedBox(height: res.scaleHeight(8)),
          Text(
            'سارة أحمد',
            style: TextStyle(
              fontSize: res.scaleText(16),
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
          SizedBox(height: res.scaleHeight(4)),
          Text(
            'صعوبة في النطق و التواصل',
            style: TextStyle(fontSize: res.scaleText(13), color: AppColors.textSecondary),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p12)),
          Text(
            'تظهر سارة تقدماً ملحوظاً في التفاعل مع الخطة العلاجية مع استمرار دعم مهارات النطق و التواصل مع الآخرين.',
            style: TextStyle(
              fontSize: res.scaleText(13),
              color: isDark ? Colors.white70 : AppColors.textSecondary,
              height: 1.5,
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }

  Widget _buildGoalsSummaryCard(
    BuildContext context,
    AppLocalizations l10n,
    ResponsiveHelper res,
    bool isDark,
  ) {
    return Container(
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
        border: Border.all(color: isDark ? Colors.grey[700]! : Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.15 : 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            l10n.goalsSummary,
            style: TextStyle(
              fontSize: res.scaleText(14),
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '3 ${l10n.remainingCount}',
                style: TextStyle(
                  fontSize: res.scaleText(13),
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                '8 ${l10n.achievedCount}',
                style: TextStyle(
                  fontSize: res.scaleText(13),
                  color: AppColors.success,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: res.scaleHeight(8)),
          ClipRRect(
            borderRadius: BorderRadius.circular(res.scaleRadius(4)),
            child: LinearProgressIndicator(
              value: 8 / 11,
              backgroundColor: isDark ? Colors.grey[700] : Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.success),
              minHeight: res.scaleHeight(8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionCard(
    BuildContext context,
    AppLocalizations l10n,
    ResponsiveHelper res,
    bool isDark,
    int index,
  ) {
    final goal = _suggestions[index];
    final (tagLabel, tagColor) = _getPriorityInfo(goal.priorityKey, l10n);

    return Container(
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
        border: Border.all(color: isDark ? Colors.grey[700]! : Colors.grey[200]!),
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
          // Priority tag
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: res.scaleSpacing(10),
                vertical: res.scaleHeight(3),
              ),
              decoration: BoxDecoration(
                color: tagColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tagLabel,
                style: TextStyle(
                  color: tagColor,
                  fontSize: res.scaleText(11),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: res.scaleHeight(8)),
          // Title
          Text(
            goal.title,
            style: TextStyle(
              fontSize: res.scaleText(15),
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: res.scaleHeight(6)),
          // Description
          Text(
            goal.description,
            style: TextStyle(
              fontSize: res.scaleText(12),
              color: isDark ? Colors.white70 : AppColors.textSecondary,
              height: 1.5,
            ),
            textAlign: TextAlign.end,
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p12)),
          // Add to plan button
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextButton(
              onPressed: () => setState(() => goal.addedToPlan = !goal.addedToPlan),
              style: TextButton.styleFrom(
                foregroundColor: goal.addedToPlan ? AppColors.success : AppColors.primary,
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    goal.addedToPlan ? Icons.check_circle_rounded : Icons.add_circle_outline_rounded,
                    size: res.scaleText(16),
                  ),
                  SizedBox(width: res.scaleWidth(4)),
                  Text(
                    goal.addedToPlan ? 'تمت الإضافة' : l10n.addToPlan,
                    style: TextStyle(
                      fontSize: res.scaleText(13),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(
    BuildContext context,
    AppLocalizations l10n,
    ResponsiveHelper res,
    bool isDark,
  ) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        res.scaleSpacing(AppSpacing.p16),
        res.scaleHeight(AppSpacing.p12),
        res.scaleSpacing(AppSpacing.p16),
        res.scaleHeight(AppSpacing.p24),
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        border: Border(
          top: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[200]!),
        ),
      ),
      child: Column(
        children: [
          // Update suggestions
          SizedBox(
            width: double.infinity,
            height: res.scaleHeight(48),
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.refresh_rounded),
              label: Text(
                l10n.updateSuggestions,
                style: TextStyle(fontSize: res.scaleText(14), fontWeight: FontWeight.w600),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: isDark ? Colors.white70 : AppColors.textSecondary,
                side: BorderSide(color: isDark ? Colors.grey[600]! : Colors.grey[300]!),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
                ),
              ),
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p8)),
          // Save to treatment plan
          SizedBox(
            width: double.infinity,
            height: res.scaleHeight(50),
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(l10n.saveToTreatmentPlan),
                    backgroundColor: AppColors.primary,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon: const Icon(Icons.save_outlined),
              label: Text(
                l10n.saveToTreatmentPlan,
                style: TextStyle(fontSize: res.scaleText(15), fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  (String, Color) _getPriorityInfo(String key, AppLocalizations l10n) {
    switch (key) {
      case 'high':
        return (l10n.highPriority, AppColors.error);
      case 'medium':
        return (l10n.mediumPriority, AppColors.warning);
      default:
        return (l10n.continuousDevelopment, AppColors.textSecondary);
    }
  }
}
