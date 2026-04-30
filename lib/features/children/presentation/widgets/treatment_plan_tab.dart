import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

enum _GoalStatus { completed, inProgress, notStarted }

class _PlanGoal {
  final String name;
  final _GoalStatus status;
  final List<String> subGoals;
  bool expanded;
  List<bool> subChecked;

  _PlanGoal({
    required this.name,
    required this.status,
    required this.subGoals,
    this.expanded = false,
  }) : subChecked = List.filled(subGoals.length, false);
}

class TreatmentPlanTab extends StatefulWidget {
  final bool isDark;
  final ResponsiveHelper res;
  final bool canEdit;

  const TreatmentPlanTab({
    super.key,
    required this.isDark,
    required this.res,
    this.canEdit = true,
  });

  @override
  State<TreatmentPlanTab> createState() => _TreatmentPlanTabState();
}

class _TreatmentPlanTabState extends State<TreatmentPlanTab> {
  final List<_PlanGoal> _goals = [
    _PlanGoal(
      name: 'تحسين النطق',
      status: _GoalStatus.completed,
      subGoals: ['نطق الحروف الأساسية', 'تكرار المقاطع', 'قراءة الكلمات'],
    ),
    _PlanGoal(
      name: 'زيادة التفاعل',
      status: _GoalStatus.inProgress,
      subGoals: ['زيادة التفاعل', 'زيادة التفاعل', 'زيادة التفاعل'],
      expanded: true,
    ),
    _PlanGoal(
      name: 'تحسين التواصل البصري',
      status: _GoalStatus.notStarted,
      subGoals: [
        'التركيز على المتحدث',
        'المحافظة على التواصل',
        'التواصل في مجموعات',
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _goals[1].subChecked = [true, true, false];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = widget.res;
    final isDark = widget.isDark;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        res.scaleSpacing(AppSpacing.p16),
        res.scaleHeight(8),
        res.scaleSpacing(AppSpacing.p16),
        res.scaleHeight(80),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Current plan card
          _buildPlanCard(context, l10n, res, isDark),
          SizedBox(height: res.scaleHeight(AppSpacing.p20)),
          // Goals section header
          Text(
            l10n.goals,
            style: TextStyle(
              fontSize: res.scaleText(15),
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
            textAlign: TextAlign.end,
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p12)),
          // Goals list
          ...List.generate(
            _goals.length,
            (i) => _buildGoalItem(i, res, isDark, l10n, widget.canEdit),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard(
    BuildContext context,
    AppLocalizations l10n,
    ResponsiveHelper res,
    bool isDark,
  ) {
    return Container(
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusLg),
        ),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.15 : 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                l10n.currentTreatmentPlan,
                style: TextStyle(
                  fontSize: res.scaleText(13),
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(width: res.scaleWidth(6)),
              Icon(
                Icons.calendar_today_outlined,
                color: AppColors.textSecondary,
                size: res.scaleText(14),
              ),
            ],
          ),
          SizedBox(height: res.scaleHeight(8)),
          Row(
            children: [
              Flexible(
                child: Text(
                  'خطة تحسين النطق و التواصل',
                  style: TextStyle(
                    fontSize: res.scaleText(16),
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: res.scaleWidth(8)),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: res.scaleSpacing(8),
                  vertical: res.scaleHeight(2),
                ),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  l10n.activeStatus,
                  style: TextStyle(
                    color: AppColors.success,
                    fontSize: res.scaleText(11),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p12)),
          Divider(color: isDark ? Colors.grey[700] : Colors.grey[200]),
          SizedBox(height: res.scaleHeight(AppSpacing.p8)),
          _infoRow(
            l10n.planDuration,
            Localizations.localeOf(context).languageCode == 'ar'
                ? '8 أسابيع'
                : '8 weeks',
            res,
            isDark,
          ),
          SizedBox(height: res.scaleHeight(4)),
          _infoRow(l10n.startedIn, '10 - مارس - 2026', res, isDark),
        ],
      ),
    );
  }

  Widget _infoRow(
    String label,
    String value,
    ResponsiveHelper res,
    bool isDark,
  ) {
    return Row(
      children: [
        Text(
          '$label:',
          style: TextStyle(
            fontSize: res.scaleText(13),
            color: AppColors.textSecondary,
          ),
        ),

        SizedBox(width: res.scaleWidth(8)),
        Text(
          value,
          style: TextStyle(
            fontSize: res.scaleText(13),
            color: isDark ? Colors.white : AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildGoalItem(
    int index,
    ResponsiveHelper res,
    bool isDark,
    AppLocalizations l10n,
    bool canEdit,
  ) {
    final goal = _goals[index];
    final (statusLabel, statusColor) = _getStatusInfo(goal.status, l10n);

    return Container(
      margin: EdgeInsets.only(bottom: res.scaleHeight(AppSpacing.p8)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusMd),
        ),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Goal header row
          GestureDetector(
            onTap: () => setState(() => goal.expanded = !goal.expanded),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: res.scaleSpacing(AppSpacing.p12),
                vertical: res.scaleHeight(AppSpacing.p12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        goal.name,
                        style: TextStyle(
                          fontSize: res.scaleText(14),
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(width: res.scaleWidth(8)),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: res.scaleSpacing(8),
                          vertical: res.scaleHeight(2),
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          statusLabel,
                          style: TextStyle(
                            color: statusColor,
                            fontSize: res.scaleText(10),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AnimatedRotation(
                    turns: goal.expanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_left_rounded,
                      color: AppColors.textSecondary,
                      size: res.scaleText(22),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Sub-goals (expanded)
          if (goal.expanded) ...[
            Divider(
              height: 1,
              color: isDark ? Colors.grey[700] : Colors.grey[200],
            ),
            ...List.generate(goal.subGoals.length, (si) {
              return GestureDetector(
                onTap: canEdit
                    ? () => setState(
                        () => goal.subChecked[si] = !goal.subChecked[si],
                      )
                    : null,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: res.scaleSpacing(AppSpacing.p16),
                    vertical: res.scaleHeight(AppSpacing.p8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        goal.subGoals[si],
                        style: TextStyle(
                          fontSize: res.scaleText(13),
                          color: isDark
                              ? Colors.white70
                              : AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(width: res.scaleWidth(AppSpacing.p8)),
                      SizedBox(
                        width: res.scaleWidth(22),
                        height: res.scaleHeight(22),
                        child: Checkbox(
                          value: goal.subChecked[si],
                          onChanged: canEdit
                              ? (v) => setState(
                                  () => goal.subChecked[si] = v ?? false,
                                )
                              : null,
                          activeColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              res.scaleRadius(4),
                            ),
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ],
      ),
    );
  }

  (String, Color) _getStatusInfo(_GoalStatus status, AppLocalizations l10n) {
    switch (status) {
      case _GoalStatus.completed:
        return (l10n.filterCompleted, AppColors.success);
      case _GoalStatus.inProgress:
        return (l10n.statusInProgress, AppColors.warning);
      case _GoalStatus.notStarted:
        return (l10n.statusNotStarted, AppColors.textSecondary);
    }
  }
}
