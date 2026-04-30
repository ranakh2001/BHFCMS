import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class SupervisorDashboard extends StatelessWidget {
  const SupervisorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(AppSpacing.p16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 2x2 Stat Grid ───────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  res: res,
                  icon: Icons.child_care_rounded,
                  count: '15',
                  label: l10n.totalChildren,
                  color: const Color(0xFFFFA726),
                  isDark: isDark,
                ),
              ),
              SizedBox(width: res.scaleWidth(12)),
              Expanded(
                child: _StatCard(
                  res: res,
                  icon: Icons.people_outline_rounded,
                  count: '15',
                  label: l10n.totalEmployees,
                  color: const Color(0xFF42A5F5),
                  isDark: isDark,
                ),
              ),
            ],
          ),
          SizedBox(height: res.scaleHeight(12)),
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  res: res,
                  icon: Icons.child_friendly_outlined,
                  count: '15',
                  label: l10n.inactiveChildren,
                  color: const Color(0xFF90A4AE),
                  isDark: isDark,
                ),
              ),
              SizedBox(width: res.scaleWidth(12)),
              Expanded(
                child: _StatCard(
                  res: res,
                  icon: Icons.child_friendly_rounded,
                  count: '15',
                  label: l10n.activeChildren,
                  color: const Color(0xFF66BB6A),
                  isDark: isDark,
                ),
              ),
            ],
          ),

          SizedBox(height: res.scaleHeight(AppSpacing.p24)),

          // ── Weekly Sessions Progress Chart ───────────────────────
          _WeeklyProgressChart(res: res, isDark: isDark, l10n: l10n),

          SizedBox(height: res.scaleHeight(AppSpacing.p24)),

          // ── Today's Appointments ─────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.todayAppointments,
                style: TextStyle(
                  fontSize: res.scaleText(18),
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : AppColors.textPrimary,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  l10n.viewAll,
                  style: TextStyle(
                    fontSize: res.scaleText(14),
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: res.scaleHeight(12)),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (_, __) => SizedBox(height: res.scaleHeight(12)),
            itemBuilder: (context, index) {
              const childNames = ['أحمد محمد', 'أحمد محمد', 'أحمد محمد'];
              const therapistNames = [
                'د. محمد سمير',
                'د. محمد سمير',
                'د. محمد سمير',
              ];
              const avatarColors = [
                Color(0xFF26A69A),
                Color(0xFFF06292),
                Color(0xFF42A5F5),
              ];
              const therapistAvatarColors = [
                Color(0xFF5C6BC0),
                Color(0xFF5C6BC0),
                Color(0xFF5C6BC0),
              ];
              return _AppointmentCard(
                res: res,
                isDark: isDark,
                childName: childNames[index],
                therapistName: therapistNames[index],
                time: '09:30 AM',
                childAvatarColor: avatarColors[index],
                therapistAvatarColor: therapistAvatarColors[index],
              );
            },
          ),

          SizedBox(height: res.scaleHeight(AppSpacing.p48)),
        ],
      ),
    );
  }
}

// ── Stat Card ────────────────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final ResponsiveHelper res;
  final IconData icon;
  final String count;
  final String label;
  final Color color;
  final bool isDark;

  const _StatCard({
    required this.res,
    required this.icon,
    required this.count,
    required this.label,
    required this.color,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusXl),
        ),
        border: Border.all(
          color: isDark ? Colors.grey[800]! : Colors.grey[100]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(res.scaleSpacing(8)),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(res.scaleRadius(12)),
            ),
            child: Icon(icon, color: color, size: res.scaleText(22)),
          ),
          SizedBox(width: res.scaleWidth(10)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  count,
                  style: TextStyle(
                    fontSize: res.scaleText(20),
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
                Text(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: res.scaleText(11),
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Weekly Progress Chart ────────────────────────────────────────────────────

class _WeeklyProgressChart extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;

  const _WeeklyProgressChart({
    required this.res,
    required this.isDark,
    required this.l10n,
  });

  static const _mockData = [3.0, 5.0, 4.0, 7.0, 6.0, 5.5];
  static const _dayLabels = ['س', 'ح', 'ن', 'ث', 'ع', 'خ'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusXl),
        ),
        border: Border.all(
          color: isDark ? Colors.grey[800]! : Colors.grey[100]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.weeklySessionsProgress,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: res.scaleText(14),
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
          SizedBox(height: res.scaleHeight(16)),
          SizedBox(
            height: res.scaleHeight(140),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 10,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: (value, meta) {
                        final idx = value.toInt();
                        if (idx < 0 || idx >= _dayLabels.length) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            _dayLabels[idx],
                            style: TextStyle(
                              fontSize: res.scaleText(11),
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 5,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.06)
                        : Colors.grey.withValues(alpha: 0.12),
                    strokeWidth: 1,
                  ),
                ),
                barGroups: List.generate(_mockData.length, (i) {
                  return BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: _mockData[i],
                        color: AppColors.primary,
                        width: res.scaleWidth(18),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(res.scaleRadius(6)),
                          topRight: Radius.circular(res.scaleRadius(6)),
                        ),
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 10,
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.04)
                              : AppColors.primary.withValues(alpha: 0.06),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: res.scaleHeight(12)),
          Row(
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
}

// ── Appointment Card ─────────────────────────────────────────────────────────

class _AppointmentCard extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final String childName;
  final String therapistName;
  final String time;
  final Color childAvatarColor;
  final Color therapistAvatarColor;

  const _AppointmentCard({
    required this.res,
    required this.isDark,
    required this.childName,
    required this.therapistName,
    required this.time,
    required this.childAvatarColor,
    required this.therapistAvatarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(AppSpacing.p16),
        vertical: res.scaleHeight(AppSpacing.p12),
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusXl),
        ),
        border: Border.all(
          color: isDark ? Colors.grey[800]! : Colors.grey[100]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Time
          Text(
            time,
            style: TextStyle(
              fontSize: res.scaleText(13),
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          SizedBox(width: res.scaleWidth(AppSpacing.p16)),
          // Names column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  childName,
                  style: TextStyle(
                    fontSize: res.scaleText(13),
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: res.scaleHeight(2)),
                Text(
                  therapistName,
                  style: TextStyle(
                    fontSize: res.scaleText(11),
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          // Stacked avatars
          SizedBox(
            width: res.scaleWidth(52),
            height: res.scaleWidth(28),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  child: CircleAvatar(
                    radius: res.scaleWidth(14),
                    backgroundColor: therapistAvatarColor,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: res.scaleWidth(14),
                    ),
                  ),
                ),
                Positioned(
                  left: res.scaleWidth(20),
                  child: CircleAvatar(
                    radius: res.scaleWidth(14),
                    backgroundColor: childAvatarColor,
                    child: Icon(
                      Icons.child_care,
                      color: Colors.white,
                      size: res.scaleWidth(14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
