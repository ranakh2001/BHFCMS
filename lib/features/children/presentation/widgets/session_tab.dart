import 'package:flutter/material.dart';
import '../../../../config/routes.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class SessionTab extends StatefulWidget {
  final bool isDark;
  final ResponsiveHelper res;
  final bool canManageSessions;

  const SessionTab({
    super.key,
    required this.isDark,
    required this.res,
    this.canManageSessions = true,
  });

  @override
  State<SessionTab> createState() => _SessionTabState();
}

class _SessionTabState extends State<SessionTab> {
  int _selectedTest = 0;
  bool _assessmentsExpanded = true;
  bool _addParentTask = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = widget.res;
    final isDark = widget.isDark;
    final canManageSessions = widget.canManageSessions;

    final tests = [
      l10n.visualCommunicationTest,
      l10n.behavioralSkillsTest,
      l10n.commandResponseTest,
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        res.scaleSpacing(AppSpacing.p16),
        res.scaleHeight(8),
        res.scaleSpacing(AppSpacing.p16),
        res.scaleHeight(80),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (canManageSessions) ...[
            // Upload Video
            _buildUploadCard(
              context: context,
              label: l10n.uploadSessionVideo,
              icon: Icons.videocam_outlined,
              res: res,
              isDark: isDark,
              onTap: () {},
            ),
            SizedBox(height: res.scaleHeight(AppSpacing.p12)),
            // Upload Audio
            _buildUploadCard(
              context: context,
              label: l10n.uploadSessionAudio,
              icon: Icons.graphic_eq_rounded,
              res: res,
              isDark: isDark,
              onTap: () {},
            ),
            SizedBox(height: res.scaleHeight(AppSpacing.p16)),
            // Assessments section
            _buildSectionHeader(
              context: context,
              title: l10n.assessmentsSection,
              expanded: _assessmentsExpanded,
              onTap: () => setState(() => _assessmentsExpanded = !_assessmentsExpanded),
              res: res,
              isDark: isDark,
            ),
            if (_assessmentsExpanded) ...[
              SizedBox(height: res.scaleHeight(AppSpacing.p8)),
              ...List.generate(tests.length, (i) {
                final selected = _selectedTest == i;
                return GestureDetector(
                  onTap: () => setState(() => _selectedTest = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.only(bottom: res.scaleHeight(8)),
                    padding: EdgeInsets.symmetric(
                      horizontal: res.scaleSpacing(AppSpacing.p16),
                      vertical: res.scaleHeight(AppSpacing.p12),
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.primary
                          : (isDark ? AppColors.surfaceDark : Colors.white),
                      borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
                      border: Border.all(
                        color: selected
                            ? AppColors.primary
                            : (isDark ? Colors.grey[700]! : Colors.grey[200]!),
                      ),
                      boxShadow: selected
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.25),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : [],
                    ),
                    child: Text(
                      tests[i],
                      style: TextStyle(
                        fontSize: res.scaleText(14),
                        fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                        color: selected
                            ? Colors.white
                            : (isDark ? Colors.white : AppColors.textPrimary),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }),
              SizedBox(height: res.scaleHeight(AppSpacing.p8)),
              // Parent task checkbox
              GestureDetector(
                onTap: () => setState(() => _addParentTask = !_addParentTask),
                child: Row(
                  children: [
                    SizedBox(
                      width: res.scaleWidth(24),
                      height: res.scaleHeight(24),
                      child: Checkbox(
                        value: _addParentTask,
                        onChanged: (v) => setState(() => _addParentTask = v ?? false),
                        activeColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(res.scaleRadius(4)),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    SizedBox(width: res.scaleWidth(8)),
                    Expanded(
                      child: Text(
                        l10n.addParentTask,
                        style: TextStyle(
                          fontSize: res.scaleText(13),
                          color: isDark ? Colors.white70 : AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: res.scaleHeight(AppSpacing.p20)),
              // Start button
              SizedBox(
                height: res.scaleHeight(50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.assessment,
                      arguments: {
                        'testName': tests[_selectedTest],
                        'testIndex': _selectedTest,
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    l10n.startButton,
                    style: TextStyle(
                      fontSize: res.scaleText(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildUploadCard({
    required BuildContext context,
    required String label,
    required IconData icon,
    required ResponsiveHelper res,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: res.scaleSpacing(AppSpacing.p16),
          vertical: res.scaleHeight(AppSpacing.p16),
        ),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : Colors.white,
          borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.textSecondary,
              size: res.scaleText(20),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: res.scaleText(14),
                color: isDark ? Colors.white : AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              icon,
              color: AppColors.primary,
              size: res.scaleText(22),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required BuildContext context,
    required String title,
    required bool expanded,
    required VoidCallback onTap,
    required ResponsiveHelper res,
    required bool isDark,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedRotation(
            turns: expanded ? 0.25 : 0,
            duration: const Duration(milliseconds: 200),
            child: Icon(
              Icons.keyboard_arrow_right_rounded,
              color: AppColors.textSecondary,
              size: res.scaleText(22),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: res.scaleText(15),
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
