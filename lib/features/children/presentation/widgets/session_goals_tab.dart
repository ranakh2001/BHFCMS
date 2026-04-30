import 'package:bhcfms_app/features/children/presentation/widgets/ai_banner.dart';
import 'package:bhcfms_app/features/children/presentation/widgets/session_notes_bottom_sheet.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class SessionGoalsTab extends StatefulWidget {
  final bool isDark;
  final ResponsiveHelper res;
  final bool canEdit;

  const SessionGoalsTab({
    super.key,
    required this.isDark,
    required this.res,
    this.canEdit = true,
  });

  @override
  State<SessionGoalsTab> createState() => _SessionGoalsTabState();
}

class _SessionGoalsTabState extends State<SessionGoalsTab> {
  String? _selectedMainGoal;
  final List<bool> _goalChecked = [true, true, false];

  final List<String> _mainGoals = [
    'تحسين النطق',
    'زيادة التفاعل',
    'تحسين التواصل البصري',
  ];

  final List<String> _sessionGoals = [
    'تدريب نطق حرف "ر"',
    'تكرار مقاطع صوتية بسيطة',
    'قراءة كلمات قصيرة',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = widget.res;
    final isDark = widget.isDark;
    final canEdit = widget.canEdit;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              res.scaleSpacing(AppSpacing.p16),
              res.scaleHeight(8),
              res.scaleSpacing(AppSpacing.p16),
              res.scaleHeight(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main goal dropdown
                _buildDropdown(context, l10n, res, isDark, canEdit),
                SizedBox(height: res.scaleHeight(AppSpacing.p20)),
                // Goals section
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
                ...List.generate(_sessionGoals.length, (i) {
                  return _buildGoalItem(context, i, res, isDark, canEdit);
                }),
                if (canEdit) ...[
                  SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                  buildAiBanner(context, l10n, res),
                ],
              ],
            ),
          ),
        ),
        if (canEdit)
          Padding(
            padding: EdgeInsets.fromLTRB(
              res.scaleSpacing(AppSpacing.p16),
              0,
              res.scaleSpacing(AppSpacing.p16),
              res.scaleHeight(AppSpacing.p16),
            ),
            child: SizedBox(
              height: res.scaleHeight(50),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => SessionNotesBottomSheet.show(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      res.scaleRadius(AppSpacing.radiusMd),
                    ),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  l10n.endSession,
                  style: TextStyle(
                    fontSize: res.scaleText(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDropdown(
    BuildContext context,
    AppLocalizations l10n,
    ResponsiveHelper res,
    bool isDark,
    bool canEdit,
  ) {
    return Container(
      height: res.scaleHeight(50),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusMd),
        ),
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
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: _selectedMainGoal,
            hint: Text(
              l10n.chooseMainGoal,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: res.scaleText(13),
              ),
            ),
            isExpanded: true,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.textSecondary,
            ),
            dropdownColor: isDark ? AppColors.surfaceDark : Colors.white,
            style: TextStyle(
              color: isDark ? Colors.white : AppColors.textPrimary,
              fontSize: res.scaleText(14),
            ),
            items: _mainGoals
                .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                .toList(),
            onChanged: canEdit
                ? (v) => setState(() => _selectedMainGoal = v)
                : null,
          ),
        ),
      ),
    );
  }

  Widget _buildGoalItem(
    BuildContext context,
    int index,
    ResponsiveHelper res,
    bool isDark,
    bool canEdit,
  ) {
    return GestureDetector(
      onTap: canEdit
          ? () => setState(() => _goalChecked[index] = !_goalChecked[index])
          : null,
      child: Container(
        margin: EdgeInsets.only(bottom: res.scaleHeight(8)),
        padding: EdgeInsets.symmetric(
          horizontal: res.scaleSpacing(AppSpacing.p12),
          vertical: res.scaleHeight(AppSpacing.p12),
        ),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : Colors.white,
          borderRadius: BorderRadius.circular(
            res.scaleRadius(AppSpacing.radiusMd),
          ),
          border: Border.all(
            color: _goalChecked[index]
                ? AppColors.primary.withValues(alpha: 0.4)
                : (isDark ? Colors.grey[700]! : Colors.grey[200]!),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _sessionGoals[index],
              style: TextStyle(
                fontSize: res.scaleText(14),
                color: isDark ? Colors.white : AppColors.textPrimary,
              ),
              textAlign: TextAlign.end,
            ),
            SizedBox(width: res.scaleWidth(AppSpacing.p12)),
            SizedBox(
              width: res.scaleWidth(24),
              height: res.scaleHeight(24),
              child: Checkbox(
                value: _goalChecked[index],
                onChanged: canEdit
                    ? (v) => setState(() => _goalChecked[index] = v ?? false)
                    : null,
                activeColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(res.scaleRadius(4)),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
