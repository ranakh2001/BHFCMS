import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../models/schedule_session.dart';
import '../providers/schedule_provider.dart';
import '../widgets/schedule_calendar.dart';

class ScheduleScreen extends ConsumerWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final state = ref.watch(scheduleProvider);
    final notifier = ref.read(scheduleProvider.notifier);

    final selectedSessions = state.selectedDate != null
        ? (state.sessions[state.selectedDate] ?? [])
        : <ScheduleSession>[];

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: res.scaleSpacing(AppSpacing.p16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: res.scaleHeight(AppSpacing.p24)),

              // ── Title ──────────────────────────────────────────────
              Text(
                l10n.scheduleTitle,
                style: TextStyle(
                  fontSize: res.scaleText(20),
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),

              SizedBox(height: res.scaleHeight(AppSpacing.p20)),

              // ── Calendar card ──────────────────────────────────────
              ScheduleCalendar(
                displayedMonth: state.displayedMonth,
                selectedDate: state.selectedDate,
                sessions: state.sessions,
                onPreviousMonth: notifier.previousMonth,
                onNextMonth: notifier.nextMonth,
                onDateSelected: notifier.selectDate,
              ),

              SizedBox(height: res.scaleHeight(AppSpacing.p24)),

              // ── Session list for selected day ──────────────────────
              if (state.selectedDate != null)
                _SelectedDayPanel(
                  date: state.selectedDate!,
                  sessions: selectedSessions,
                  res: res,
                  l10n: l10n,
                  isDark: isDark,
                ),

              SizedBox(height: res.scaleHeight(AppSpacing.p48)),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Selected day session panel ─────────────────────────────────────────────

class _SelectedDayPanel extends StatelessWidget {
  final DateTime date;
  final List<ScheduleSession> sessions;
  final ResponsiveHelper res;
  final AppLocalizations l10n;
  final bool isDark;

  const _SelectedDayPanel({
    required this.date,
    required this.sessions,
    required this.res,
    required this.l10n,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final dateLabel = _formatDate(date, locale);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: res.scaleWidth(4)),
          child: Text(
            dateLabel,
            style: TextStyle(
              fontSize: res.scaleText(14),
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        SizedBox(height: res.scaleHeight(AppSpacing.p12)),
        if (sessions.isEmpty)
          _EmptyDay(res: res, l10n: l10n, isDark: isDark)
        else
          ...sessions
              .where((s) => s.status != SessionStatus.holiday)
              .map((s) => Padding(
                    padding: EdgeInsets.only(bottom: res.scaleHeight(AppSpacing.p12)),
                    child: _SessionCard(session: s, res: res, l10n: l10n, isDark: isDark),
                  )),
        if (sessions.any((s) => s.status == SessionStatus.holiday))
          _HolidayCard(res: res, l10n: l10n, isDark: isDark),
      ],
    );
  }

  String _formatDate(DateTime d, String locale) {
    if (locale == 'ar') {
      const months = [
        'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو',
        'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر',
      ];
      return '${d.day} ${months[d.month - 1]} ${d.year}';
    }
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${months[d.month - 1]} ${d.day}, ${d.year}';
  }
}

// ── Empty day ──────────────────────────────────────────────────────────────

class _EmptyDay extends StatelessWidget {
  final ResponsiveHelper res;
  final AppLocalizations l10n;
  final bool isDark;

  const _EmptyDay({required this.res, required this.l10n, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p24)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        l10n.noSessionsOnDay,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: res.scaleText(13),
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}

// ── Session card ───────────────────────────────────────────────────────────

class _SessionCard extends StatelessWidget {
  final ScheduleSession session;
  final ResponsiveHelper res;
  final AppLocalizations l10n;
  final bool isDark;

  const _SessionCard({
    required this.session,
    required this.res,
    required this.l10n,
    required this.isDark,
  });

  Color get _statusColor => session.status == SessionStatus.upcoming
      ? AppColors.primary
      : AppColors.secondary;

  String _statusLabel(AppLocalizations l10n) =>
      session.status == SessionStatus.upcoming ? l10n.upcomingSessions : l10n.statusCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Status accent bar
          Container(
            width: res.scaleWidth(4),
            height: res.scaleHeight(72),
            decoration: BoxDecoration(
              color: _statusColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(res.scaleRadius(AppSpacing.radiusXl)),
                bottomLeft: Radius.circular(res.scaleRadius(AppSpacing.radiusXl)),
                topRight: Radius.zero,
                bottomRight: Radius.zero,
              ),
            ),
          ),
          SizedBox(width: res.scaleWidth(AppSpacing.p12)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: res.scaleHeight(AppSpacing.p12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    session.sessionType,
                    style: TextStyle(
                      fontSize: res.scaleText(14),
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: res.scaleHeight(4)),
                  Row(
                    children: [
                      Icon(Icons.person_outline_rounded,
                          size: res.scaleWidth(13), color: AppColors.textSecondary),
                      SizedBox(width: res.scaleWidth(3)),
                      Text(
                        session.childName,
                        style: TextStyle(
                          fontSize: res.scaleText(12),
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: res.scaleHeight(3)),
                  Row(
                    children: [
                      Icon(Icons.access_time_rounded,
                          size: res.scaleWidth(13), color: AppColors.textSecondary),
                      SizedBox(width: res.scaleWidth(3)),
                      Text(
                        session.time,
                        style: TextStyle(
                          fontSize: res.scaleText(12),
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: res.scaleWidth(AppSpacing.p12),
              left: res.scaleWidth(AppSpacing.p8),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: res.scaleWidth(AppSpacing.p8),
                vertical: res.scaleHeight(4),
              ),
              decoration: BoxDecoration(
                color: _statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
              ),
              child: Text(
                _statusLabel(l10n),
                style: TextStyle(
                  fontSize: res.scaleText(10),
                  fontWeight: FontWeight.w600,
                  color: _statusColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Holiday card ───────────────────────────────────────────────────────────

class _HolidayCard extends StatelessWidget {
  final ResponsiveHelper res;
  final AppLocalizations l10n;
  final bool isDark;

  const _HolidayCard({required this.res, required this.l10n, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: res.scaleWidth(4),
            height: res.scaleHeight(56),
            decoration: BoxDecoration(
              color: AppColors.textSecondary.withValues(alpha: 0.4),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(res.scaleRadius(AppSpacing.radiusXl)),
                bottomLeft: Radius.circular(res.scaleRadius(AppSpacing.radiusXl)),
              ),
            ),
          ),
          SizedBox(width: res.scaleWidth(AppSpacing.p12)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: res.scaleHeight(AppSpacing.p16)),
            child: Row(
              children: [
                Icon(
                  Icons.beach_access_rounded,
                  size: res.scaleWidth(18),
                  color: AppColors.textSecondary,
                ),
                SizedBox(width: res.scaleWidth(AppSpacing.p8)),
                Text(
                  l10n.holidayLegend,
                  style: TextStyle(
                    fontSize: res.scaleText(14),
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
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
