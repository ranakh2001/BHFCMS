import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/routes.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../main_layout/presentation/providers/main_nav_provider.dart';
import 'session_card.dart';

class ReceptionistDashboard extends ConsumerWidget {
  const ReceptionistDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final isTablet = res.screenWidth >= 600;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(AppSpacing.p16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Stat Cards ──────────────────────────────────────────
          if (isTablet)
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    res: res,
                    icon: Icons.people_outline_rounded,
                    count: '150',
                    label: l10n.totalFamilies,
                    color: const Color(0xFF42A5F5),
                    isDark: isDark,
                    expanded: true,
                  ),
                ),
                SizedBox(width: res.scaleWidth(12)),
                Expanded(
                  child: _StatCard(
                    res: res,
                    icon: Icons.child_care_rounded,
                    count: '84',
                    label: l10n.activeChildren,
                    color: const Color(0xFF66BB6A),
                    isDark: isDark,
                    expanded: true,
                  ),
                ),
                SizedBox(width: res.scaleWidth(12)),
                Expanded(
                  child: _StatCard(
                    res: res,
                    icon: Icons.event_available_rounded,
                    count: '12',
                    label: l10n.todayAppointments,
                    color: const Color(0xFFFFA726),
                    isDark: isDark,
                    expanded: true,
                  ),
                ),
              ],
            )
          else
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  _StatCard(
                    res: res,
                    icon: Icons.people_outline_rounded,
                    count: '150',
                    label: l10n.totalFamilies,
                    color: const Color(0xFF42A5F5),
                    isDark: isDark,
                  ),
                  SizedBox(width: res.scaleWidth(12)),
                  _StatCard(
                    res: res,
                    icon: Icons.child_care_rounded,
                    count: '84',
                    label: l10n.activeChildren,
                    color: const Color(0xFF66BB6A),
                    isDark: isDark,
                  ),
                  SizedBox(width: res.scaleWidth(12)),
                  _StatCard(
                    res: res,
                    icon: Icons.event_available_rounded,
                    count: '12',
                    label: l10n.todayAppointments,
                    color: const Color(0xFFFFA726),
                    isDark: isDark,
                  ),
                ],
              ),
            ),

          SizedBox(height: res.scaleHeight(AppSpacing.p32)),

          // ── Quick Actions ───────────────────────────────────────
          Text(
            l10n.quickActions,
            style: TextStyle(
              fontSize: res.scaleText(18),
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p16)),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isTablet ? 4 : 2,
            mainAxisSpacing: res.scaleSpacing(12),
            crossAxisSpacing: res.scaleSpacing(12),
            childAspectRatio: isTablet ? 1.4 : 1.6,
            children: [
              _QuickActionCard(
                res: res,
                icon: Icons.person_add_alt_1_rounded,
                label: l10n.addFamily,
                onTap: () => Navigator.of(context).pushNamed(AppRoutes.addFamily),
                isDark: isDark,
              ),
              _QuickActionCard(
                res: res,
                icon: Icons.child_friendly_rounded,
                label: l10n.addChild,
                onTap: () => Navigator.of(context).pushNamed(AppRoutes.addChild),
                isDark: isDark,
              ),
              _QuickActionCard(
                res: res,
                icon: Icons.add_task_rounded,
                label: l10n.newAppointment,
                onTap: () =>
                    ref.read(mainNavIndexProvider.notifier).state = 2,
                isDark: isDark,
              ),
              _QuickActionCard(
                res: res,
                icon: Icons.lock_reset_rounded,
                label: l10n.changePassword,
                onTap: () => Navigator.of(context).pushNamed(AppRoutes.resetPassword),
                isDark: isDark,
              ),
            ],
          ),

          SizedBox(height: res.scaleHeight(AppSpacing.p32)),

          // ── Today's Appointments ────────────────────────────────
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
              final titles = ['جلسة تحسين نطق', 'جلسة تخاطب', 'تقييم مهارات'];
              final names = ['ياسين محمد', 'عمر فاروق', 'فهد العتيبي'];
              return SessionCard(
                sessionType: titles[index],
                studentName: names[index],
                room: l10n.room((index + 1).toString()),
                status: l10n.statusInProgress,
                statusColor: AppColors.info,
                avatarColor: index == 0
                    ? const Color(0xFF26A69A)
                    : (index == 1 ? const Color(0xFFF06292) : const Color(0xFF42A5F5)),
              );
            },
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p48)),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final ResponsiveHelper res;
  final IconData icon;
  final String count;
  final String label;
  final Color color;
  final bool isDark;
  final bool expanded;

  const _StatCard({
    required this.res,
    required this.icon,
    required this.count,
    required this.label,
    required this.color,
    required this.isDark,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: expanded ? null : res.scaleWidth(140),
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
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
          Container(
            padding: EdgeInsets.all(res.scaleSpacing(8)),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(res.scaleRadius(12)),
            ),
            child: Icon(icon, color: color, size: res.scaleText(24)),
          ),
          SizedBox(height: res.scaleHeight(16)),
          Text(
            count,
            style: TextStyle(
              fontSize: res.scaleText(22),
              fontWeight: FontWeight.w800,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
          SizedBox(height: res.scaleHeight(4)),
          Text(
            label,
            style: TextStyle(
              fontSize: res.scaleText(13),
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final ResponsiveHelper res;
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDark;

  const _QuickActionCard({
    required this.res,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(12)),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : Colors.white,
          borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
          border: Border.all(
            color: isDark ? Colors.grey[800]! : Colors.grey[100]!,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: res.scaleText(28),
              color: AppColors.primary,
            ),
            SizedBox(height: res.scaleHeight(10)),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: res.scaleText(13),
                fontWeight: FontWeight.w700,
                color: isDark ? Colors.white70 : AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
