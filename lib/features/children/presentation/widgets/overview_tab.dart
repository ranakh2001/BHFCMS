import 'package:bhcfms_app/features/children/presentation/widgets/ai_banner.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/routes.dart';
import '../../../case_study_form/presentation/providers/case_study_provider.dart';

class OverviewTab extends ConsumerStatefulWidget {
  final bool isDark;
  final ResponsiveHelper res;
  final bool canViewAiSuggestions;
  final bool isSupervisor;
  final VoidCallback? onViewTreatmentPlan;

  const OverviewTab({
    super.key,
    required this.isDark,
    required this.res,
    this.canViewAiSuggestions = true,
    this.isSupervisor = false,
    this.onViewTreatmentPlan,
  });

  @override
  ConsumerState<OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends ConsumerState<OverviewTab> {
  bool _familyCanSee = true;

  bool get isDark => widget.isDark;
  ResponsiveHelper get res => widget.res;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final canAccessCaseStudy = ref.watch(caseStudyAccessProvider);
    final isCaseStudyCompleted = ref.watch(caseStudyFormProvider).isCompleted;

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
          _buildPlanCard(context, l10n),
          SizedBox(height: res.scaleHeight(AppSpacing.p16)),
          _buildProgressCard(context, l10n),
          SizedBox(height: res.scaleHeight(AppSpacing.p16)),
          _buildStatsRow(context, l10n),
          if (widget.isSupervisor) ...[
            SizedBox(height: res.scaleHeight(AppSpacing.p16)),
            _buildFamilyVisibilityToggle(l10n),
          ],
          if (canAccessCaseStudy) ...[
            SizedBox(height: res.scaleHeight(AppSpacing.p16)),
            _buildCaseStudySection(context, isCaseStudyCompleted, l10n),
          ],
          if (widget.canViewAiSuggestions) ...[
            SizedBox(height: res.scaleHeight(AppSpacing.p16)),
            buildAiBanner(context, l10n, res),
          ],
        ],
      ),
    );
  }

  Widget _buildFamilyVisibilityToggle(AppLocalizations l10n) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(AppSpacing.p16),
        vertical: res.scaleHeight(AppSpacing.p12),
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius:
            BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
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
      child: Row(
        children: [
          Switch(
            value: _familyCanSee,
            onChanged: (val) => setState(() => _familyCanSee = val),
            activeThumbColor: Colors.white,
            activeTrackColor: AppColors.primary,
          ),
          SizedBox(width: res.scaleWidth(AppSpacing.p8)),
          Expanded(
            child: Text(
              l10n.familyProfileToggle,
              style: TextStyle(
                fontSize: res.scaleText(14),
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaseStudySection(BuildContext context, bool isCompleted, AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
        ),
      ),
      child: isCompleted
          ? ElevatedButton(
              onPressed: () {
                // TODO: API integration later
              },
              child: Text(l10n.downloadCaseStudy),
            )
          : ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.caseStudyIntro);
              },
              child: Text(l10n.fillCaseStudyForm),
            ),
    );
  }

  Widget _buildPlanCard(BuildContext context, AppLocalizations l10n) {
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: AppColors.textSecondary,
                size: res.scaleText(14),
              ),
              SizedBox(width: res.scaleWidth(6)),
              Text(
                l10n.currentTreatmentPlan,
                style: TextStyle(
                  fontSize: res.scaleText(13),
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          SizedBox(height: res.scaleHeight(8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      'خطة تحسين النطق و التواصل',
                      style: TextStyle(
                        fontSize: res.scaleText(14),
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
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
            ],
          ),
          SizedBox(height: res.scaleHeight(12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: widget.onViewTreatmentPlan,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      res.scaleRadius(AppSpacing.radiusMd),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: res.scaleSpacing(16),
                    vertical: res.scaleHeight(6),
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  l10n.viewPlan,
                  style: TextStyle(fontSize: res.scaleText(13)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard(BuildContext context, AppLocalizations l10n) {
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
          Text(
            l10n.progressTitle,
            style: TextStyle(
              fontSize: res.scaleText(15),
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p16)),
          SizedBox(
            height: res.scaleHeight(180),
            child: LineChart(
              LineChartData(
                minX: 1,
                maxX: 5,
                minY: 10,
                maxY: 75,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 10,
                  getDrawingHorizontalLine: (v) => FlLine(
                    color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: res.scaleHeight(28),
                      getTitlesWidget: (value, meta) => Padding(
                        padding: EdgeInsets.only(top: res.scaleHeight(4)),
                        child: Text(
                          'ج${value.toInt()}',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: res.scaleText(11),
                          ),
                        ),
                      ),
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: res.scaleWidth(32),
                      interval: 10,
                      getTitlesWidget: (value, meta) {
                        if (value % 10 == 0 && value >= 20) {
                          return Text(
                            '${value.toInt()}',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: res.scaleText(10),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(1, 20),
                      FlSpot(2, 40),
                      FlSpot(3, 55),
                      FlSpot(4, 45),
                      FlSpot(5, 60),
                    ],
                    isCurved: true,
                    color: AppColors.primary,
                    barWidth: res.scaleWidth(2.5),
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primary.withValues(alpha: 0.2),
                          AppColors.primary.withValues(alpha: 0.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: res.scaleWidth(8),
                height: res.scaleWidth(8),
                decoration: const BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: res.scaleWidth(6)),
              Text(
                l10n.notableImprovement,
                style: TextStyle(
                  fontSize: res.scaleText(11),
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context, AppLocalizations l10n) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            label: l10n.remainingGoals,
            value: '3',
            bgColor: const Color(0xFFFFF8E1),
            textColor: const Color(0xFFE65100),
          ),
        ),
        SizedBox(width: res.scaleWidth(AppSpacing.p12)),
        Expanded(
          child: _buildStatCard(
            label: l10n.achievedGoals,
            value: '8',
            bgColor: const Color(0xFFE8F5E9),
            textColor: AppColors.success,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String label,
    required String value,
    required Color bgColor,
    required Color textColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: res.scaleHeight(AppSpacing.p20),
        horizontal: res.scaleSpacing(AppSpacing.p12),
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : bgColor,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusLg),
        ),
        border: isDark ? Border.all(color: Colors.grey[700]!) : null,
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: res.scaleText(28),
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : textColor,
            ),
          ),
          SizedBox(height: res.scaleHeight(4)),
          Text(
            label,
            style: TextStyle(
              fontSize: res.scaleText(12),
              color: isDark ? Colors.white70 : textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
