import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class SessionNotesBottomSheet extends StatefulWidget {
  const SessionNotesBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      builder: (_) => const SessionNotesBottomSheet(),
    );
  }

  @override
  State<SessionNotesBottomSheet> createState() => _SessionNotesBottomSheetState();
}

class _SessionNotesBottomSheetState extends State<SessionNotesBottomSheet> {
  double _rating = 0.3;
  String? _interactionLevel;
  int _goalAchievement = 1; // 0=notAchieved, 1=partial, 2=achieved
  String? _performanceType;
  final _notesController = TextEditingController();

  final List<String> _interactionOptions = ['ضعيف', 'متوسط', 'جيد', 'ممتاز'];
  final List<String> _performanceOptions = [
    'أداء مستقل',
    'أداء بمساعدة جزئية',
    'أداء بمساعدة كاملة',
  ];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? AppColors.surfaceDark : Colors.white;

    return DraggableScrollableSheet(
      initialChildSize: 0.82,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(res.scaleRadius(AppSpacing.radiusXxl)),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Column(
            children: [
              // Drag handle
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: res.scaleHeight(12)),
                  width: res.scaleWidth(40),
                  height: res.scaleHeight(4),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Header: X | Title
              Padding(
                padding: EdgeInsets.fromLTRB(
                  res.scaleSpacing(AppSpacing.p16),
                  res.scaleHeight(AppSpacing.p12),
                  res.scaleSpacing(AppSpacing.p16),
                  res.scaleHeight(AppSpacing.p12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.close_rounded,
                        color: AppColors.textSecondary,
                        size: res.scaleText(22),
                      ),
                    ),
                    Text(
                      l10n.sessionNotesTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: res.scaleText(17),
                        color: isDark ? Colors.white : AppColors.textPrimary,
                      ),
                    ),
                    // Spacer to keep title centered
                    SizedBox(width: res.scaleWidth(22)),
                  ],
                ),
              ),
              Divider(height: 1, color: isDark ? Colors.grey[700] : Colors.grey[200]),
              // Form content
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.fromLTRB(
                    res.scaleSpacing(AppSpacing.p16),
                    res.scaleHeight(AppSpacing.p16),
                    res.scaleSpacing(AppSpacing.p16),
                    res.scaleHeight(AppSpacing.p16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // ── Child rating ──
                      _sectionLabel(l10n.childSessionRating, res, isDark),
                      SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                      Row(
                        children: [
                          // Slider on the right (start in RTL)
                          Expanded(
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: AppColors.primary,
                                inactiveTrackColor:
                                    isDark ? Colors.grey[700] : Colors.grey[200],
                                thumbColor: AppColors.primary,
                                overlayColor: AppColors.primary.withValues(alpha: 0.1),
                                trackHeight: res.scaleHeight(4),
                                thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: res.scaleWidth(8),
                                ),
                              ),
                              child: Slider(
                                value: _rating,
                                onChanged: (v) => setState(() => _rating = v),
                              ),
                            ),
                          ),
                          SizedBox(width: res.scaleWidth(8)),
                          // Value label on the left (end in RTL)
                          Text(
                            '${(_rating * 100).toInt()}%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: res.scaleText(14),
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: res.scaleHeight(AppSpacing.p16)),

                      // ── Interaction level ──
                      _sectionLabel(l10n.childInteractionLevel, res, isDark),
                      SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                      _buildDropdown(
                        context: context,
                        hint: l10n.childInteractionHint,
                        value: _interactionLevel,
                        items: _interactionOptions,
                        onChanged: (v) => setState(() => _interactionLevel = v),
                        res: res,
                        isDark: isDark,
                      ),
                      SizedBox(height: res.scaleHeight(AppSpacing.p16)),

                      // ── Goal achievement ──
                      _sectionLabel(l10n.goalAchievementLabel, res, isDark),
                      SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                      _buildGoalAchievementRow(l10n, res, isDark),
                      SizedBox(height: res.scaleHeight(AppSpacing.p16)),

                      // ── Performance type ──
                      _sectionLabel(l10n.performanceTypeLabel, res, isDark),
                      SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                      _buildDropdown(
                        context: context,
                        hint: l10n.performanceTypeHint,
                        value: _performanceType,
                        items: _performanceOptions,
                        onChanged: (v) => setState(() => _performanceType = v),
                        res: res,
                        isDark: isDark,
                      ),
                      SizedBox(height: res.scaleHeight(AppSpacing.p16)),

                      // ── Notes ──
                      _sectionLabel(l10n.notesLabel, res, isDark),
                      SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                      Container(
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.backgroundDark
                              : AppColors.backgroundLight,
                          borderRadius:
                              BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
                          border: Border.all(
                            color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                          ),
                        ),
                        child: TextField(
                          controller: _notesController,
                          maxLines: 4,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: res.scaleText(14),
                            color: isDark ? Colors.white : AppColors.textPrimary,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.all(res.scaleSpacing(AppSpacing.p12)),
                            hintText: '...',
                            hintStyle: TextStyle(color: AppColors.textSecondary),
                          ),
                        ),
                      ),
                      SizedBox(height: res.scaleHeight(AppSpacing.p24)),

                      // ── Save button ──
                      SizedBox(
                        width: double.infinity,
                        height: res.scaleHeight(50),
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  res.scaleRadius(AppSpacing.radiusMd)),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            l10n.saveButton,
                            style: TextStyle(
                              fontSize: res.scaleText(16),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Three inline radio options matching the design
  Widget _buildGoalAchievementRow(
    AppLocalizations l10n,
    ResponsiveHelper res,
    bool isDark,
  ) {
    final options = [
      (2, l10n.goalAchieved),
      (1, l10n.partialAchievement),
      (0, l10n.notAchieved),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: options.map((opt) {
        final (value, label) = opt;
        final selected = _goalAchievement == value;
        return GestureDetector(
          onTap: () => setState(() => _goalAchievement = value),
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: res.scaleSpacing(AppSpacing.p16)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: res.scaleText(12),
                    color: selected
                        ? AppColors.primary
                        : (isDark ? Colors.white60 : AppColors.textSecondary),
                    fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
                SizedBox(width: res.scaleWidth(4)),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: res.scaleWidth(18),
                  height: res.scaleWidth(18),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selected ? AppColors.primary : Colors.grey[400]!,
                      width: selected ? 5 : 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _sectionLabel(String text, ResponsiveHelper res, bool isDark) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: res.scaleText(14),
        color: isDark ? Colors.white : AppColors.textPrimary,
      ),
      textAlign: TextAlign.end,
    );
  }

  Widget _buildDropdown({
    required BuildContext context,
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required ResponsiveHelper res,
    required bool isDark,
  }) {
    return Container(
      height: res.scaleHeight(48),
      decoration: BoxDecoration(
        color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
        border: Border.all(color: isDark ? Colors.grey[700]! : Colors.grey[200]!),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: value,
            hint: Text(
              hint,
              style: TextStyle(color: AppColors.textSecondary, fontSize: res.scaleText(14)),
            ),
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.textSecondary,
              size: res.scaleText(20),
            ),
            dropdownColor: isDark ? AppColors.surfaceDark : Colors.white,
            style: TextStyle(
              color: isDark ? Colors.white : AppColors.textPrimary,
              fontSize: res.scaleText(14),
            ),
            items: items
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
