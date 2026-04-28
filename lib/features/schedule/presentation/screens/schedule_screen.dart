import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' as intl;
import '../../../auth/domain/entities/user_role.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../models/schedule_session.dart';
import '../providers/schedule_provider.dart';
import '../widgets/schedule_calendar.dart';

class ScheduleScreen extends ConsumerStatefulWidget {
  const ScheduleScreen({super.key});

  @override
  ConsumerState<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends ConsumerState<ScheduleScreen> {
  int _selectedTherapistIndex = 0;

  final List<_TherapistData> _therapists = [
    _TherapistData(
      name: 'د. سارة الأحمد',
      initials: 'د.أ',
      color: Color(0xFF1E88B5),
    ),
    _TherapistData(
      name: 'أ. محمد خالد',
      initials: 'م.خ',
      color: Color(0xFF66BB6A),
    ),
    _TherapistData(
      name: 'أ. نور حسن',
      initials: 'ن.ح',
      color: Color(0xFFF06292),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final state = ref.watch(scheduleProvider);
    final notifier = ref.read(scheduleProvider.notifier);
    final user = ref.watch(currentUserProvider);
    final isReceptionist = user?.role == UserRole.receptionist;

    if (!isReceptionist) {
      return _NonReceptionistSchedule(
        state: state,
        notifier: notifier,
        res: res,
        isDark: isDark,
        l10n: l10n,
      );
    }

    return _ReceptionistSchedule(
      state: state,
      notifier: notifier,
      res: res,
      isDark: isDark,
      l10n: l10n,
      therapists: _therapists,
      selectedTherapistIndex: _selectedTherapistIndex,
      onTherapistSelected: (i) => setState(() => _selectedTherapistIndex = i),
    );
  }
}

// ── Non-receptionist schedule (unchanged) ──────────────────────────────────

class _NonReceptionistSchedule extends StatelessWidget {
  final ScheduleState state;
  final ScheduleNotifier notifier;
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;

  const _NonReceptionistSchedule({
    required this.state,
    required this.notifier,
    required this.res,
    required this.isDark,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final selectedSessions = state.selectedDate != null
        ? (state.sessions[state.selectedDate] ?? [])
        : <ScheduleSession>[];

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
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
              Text(
                l10n.scheduleTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: res.scaleText(18),
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: res.scaleHeight(AppSpacing.p20)),
              ScheduleCalendar(
                displayedMonth: state.displayedMonth,
                selectedDate: state.selectedDate,
                sessions: state.sessions,
                onPreviousMonth: notifier.previousMonth,
                onNextMonth: notifier.nextMonth,
                onDateSelected: notifier.selectDate,
              ),
              SizedBox(height: res.scaleHeight(AppSpacing.p24)),
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

// ── Receptionist timeline schedule ─────────────────────────────────────────

class _TherapistData {
  final String name;
  final String initials;
  final Color color;
  const _TherapistData({
    required this.name,
    required this.initials,
    required this.color,
  });
}

class _ReceptionistSchedule extends StatefulWidget {
  final ScheduleState state;
  final ScheduleNotifier notifier;
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;
  final List<_TherapistData> therapists;
  final int selectedTherapistIndex;
  final ValueChanged<int> onTherapistSelected;

  const _ReceptionistSchedule({
    required this.state,
    required this.notifier,
    required this.res,
    required this.isDark,
    required this.l10n,
    required this.therapists,
    required this.selectedTherapistIndex,
    required this.onTherapistSelected,
  });

  @override
  State<_ReceptionistSchedule> createState() => _ReceptionistScheduleState();
}

class _ReceptionistScheduleState extends State<_ReceptionistSchedule> {
  late DateTime _selectedDay;
  late DateTime _focusedWeekStart;
  late List<_TimelineSession> _sessions;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedDay = DateTime(now.year, now.month, now.day);
    _focusedWeekStart = _getWeekStart(_selectedDay);
    _sessions = [
      const _TimelineSession(hour: 9, childName: 'ياسين محمد', status: SessionStatus.confirmed, therapistIndex: 0),
      const _TimelineSession(hour: 10, childName: 'عمر فاروق', status: SessionStatus.confirmed, therapistIndex: 1),
      const _TimelineSession(hour: 11, childName: 'فهد العتيبي', status: SessionStatus.cancelled, therapistIndex: 0),
      const _TimelineSession(hour: 13, childName: 'زيد السلطان', status: SessionStatus.waiting, therapistIndex: 1),
      const _TimelineSession(hour: 14, childName: 'ليلى إبراهيم', status: SessionStatus.upcoming, therapistIndex: 2),
    ];
  }

  DateTime _getWeekStart(DateTime date) {
    return date.subtract(const Duration(days: 2));
  }

  List<DateTime> get _weekDays {
    return List.generate(5, (i) => _focusedWeekStart.add(Duration(days: i)));
  }

  void _onEmptySlotTap(int therapistIndex, int hour) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _AddAppointmentSheet(
        therapists: widget.therapists,
        selectedHour: hour,
        selectedTherapistIndex: therapistIndex,
        res: widget.res,
        isDark: widget.isDark,
        onConfirm: (childName, tIdx, notes) {
          setState(() {
            _sessions.add(_TimelineSession(
              hour: hour,
              childName: childName,
              status: SessionStatus.confirmed,
              therapistIndex: tIdx,
              notes: notes?.isNotEmpty == true ? notes : null,
            ));
          });
        },
      ),
    );
  }

  void _onSessionTap(_TimelineSession session) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _AppointmentDetailSheet(
        session: session,
        therapist: widget.therapists[session.therapistIndex],
        res: widget.res,
        isDark: widget.isDark,
        onStatusChanged: (newStatus) {
          setState(() {
            final idx = _sessions.indexWhere(
              (s) => s.hour == session.hour && s.therapistIndex == session.therapistIndex,
            );
            if (idx != -1) {
              _sessions[idx] = _sessions[idx].copyWith(status: newStatus);
            }
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final res = widget.res;
    final isDark = widget.isDark;
    final l10n = widget.l10n;
    final locale = Localizations.localeOf(context).languageCode;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: res.scaleHeight(AppSpacing.p20)),

            // ── Title ──────────────────────────────────────────────────
            Text(
              l10n.scheduleScreenTitle,
              style: TextStyle(
                fontSize: res.scaleText(18),
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: res.scaleHeight(4)),
            Text(
              l10n.manageDailySessions,
              style: TextStyle(
                fontSize: res.scaleText(12),
                color: AppColors.textSecondary,
              ),
            ),

            SizedBox(height: res.scaleHeight(AppSpacing.p16)),

            // ── Month navigation ────────────────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: res.scaleSpacing(AppSpacing.p20),
              ),
              child: _MonthNavigationRow(
                selectedDay: _selectedDay,
                locale: locale,
                l10n: l10n,
                res: res,
                isDark: isDark,
                onPrevious: () => setState(() {
                  _selectedDay = _selectedDay.subtract(const Duration(days: 1));
                  _focusedWeekStart = _getWeekStart(_selectedDay);
                }),
                onNext: () => setState(() {
                  _selectedDay = _selectedDay.add(const Duration(days: 1));
                  _focusedWeekStart = _getWeekStart(_selectedDay);
                }),
              ),
            ),

            SizedBox(height: res.scaleHeight(AppSpacing.p12)),

            // ── 5-day strip ─────────────────────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: res.scaleSpacing(AppSpacing.p16),
              ),
              child: _WeekDayStrip(
                days: _weekDays,
                selectedDay: _selectedDay,
                locale: locale,
                res: res,
                onDaySelected: (d) => setState(() {
                  _selectedDay = d;
                  _focusedWeekStart = _getWeekStart(d);
                }),
              ),
            ),

            SizedBox(height: res.scaleHeight(AppSpacing.p16)),

            // ── Timeline (tap slot → add, tap session → details) ────────
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: res.scaleSpacing(AppSpacing.p16),
                ),
                child: _TimelineView(
                  sessions: _sessions,
                  therapists: widget.therapists,
                  res: res,
                  isDark: isDark,
                  l10n: l10n,
                  onEmptySlotTap: _onEmptySlotTap,
                  onSessionTap: _onSessionTap,
                ),
              ),
            ),

            SizedBox(height: res.scaleHeight(16)),
          ],
        ),
      ),
    );
  }
}

// ── Month navigation row ────────────────────────────────────────────────────

class _MonthNavigationRow extends StatelessWidget {
  final DateTime selectedDay;
  final String locale;
  final AppLocalizations l10n;
  final ResponsiveHelper res;
  final bool isDark;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const _MonthNavigationRow({
    required this.selectedDay,
    required this.locale,
    required this.l10n,
    required this.res,
    required this.isDark,
    required this.onPrevious,
    required this.onNext,
  });

  String _formatDate(DateTime d) {
    if (locale == 'ar') {
      const months = [
        'يناير',
        'فبراير',
        'مارس',
        'أبريل',
        'مايو',
        'يونيو',
        'يوليو',
        'أغسطس',
        'سبتمبر',
        'أكتوبر',
        'نوفمبر',
        'ديسمبر',
      ];
      return '${d.day} ${months[d.month - 1]} ${d.year}';
    }
    return intl.DateFormat('d MMMM yyyy', 'en').format(d);
  }

  bool get _isToday {
    final now = DateTime.now();
    return selectedDay.year == now.year &&
        selectedDay.month == now.month &&
        selectedDay.day == now.day;
  }

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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onPrevious,
            child: Icon(
              Icons.chevron_left_rounded,
              color: AppColors.primary,
              size: res.scaleWidth(24),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  _formatDate(selectedDay),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: res.scaleText(14),
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : AppColors.textPrimary,
                  ),
                ),
                if (_isToday) ...[
                  SizedBox(height: res.scaleHeight(2)),
                  Text(
                    l10n.today,
                    style: TextStyle(
                      fontSize: res.scaleText(11),
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          GestureDetector(
            onTap: onNext,
            child: Icon(
              Icons.chevron_right_rounded,
              color: AppColors.primary,
              size: res.scaleWidth(24),
            ),
          ),
        ],
      ),
    );
  }
}

// ── 5-day strip ─────────────────────────────────────────────────────────────

class _WeekDayStrip extends StatelessWidget {
  final List<DateTime> days;
  final DateTime selectedDay;
  final String locale;
  final ResponsiveHelper res;
  final ValueChanged<DateTime> onDaySelected;

  const _WeekDayStrip({
    required this.days,
    required this.selectedDay,
    required this.locale,
    required this.res,
    required this.onDaySelected,
  });

  String _dayName(DateTime d) {
    if (locale == 'ar') {
      const names = [
        'الإثنين',
        'الثلاثاء',
        'الأربعاء',
        'الخميس',
        'الجمعة',
        'السبت',
        'الأحد',
      ];
      return names[d.weekday - 1];
    }
    return intl.DateFormat('EEE', 'en').format(d);
  }

  bool _isSelected(DateTime d) =>
      d.year == selectedDay.year &&
      d.month == selectedDay.month &&
      d.day == selectedDay.day;

  bool _isToday(DateTime d) {
    final now = DateTime.now();
    return d.year == now.year && d.month == now.month && d.day == now.day;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: days.map((d) {
        final selected = _isSelected(d);
        final today = _isToday(d);

        return Expanded(
          child: GestureDetector(
            onTap: () => onDaySelected(d),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeInOut,
              margin: EdgeInsets.symmetric(horizontal: res.scaleWidth(3)),
              padding: EdgeInsets.symmetric(
                vertical: res.scaleHeight(8),
                horizontal: res.scaleWidth(4),
              ),
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.primary
                    : (today
                          ? AppColors.primary.withValues(alpha: 0.08)
                          : Colors.transparent),
                borderRadius: BorderRadius.circular(
                  res.scaleRadius(AppSpacing.radiusXl),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _dayName(d),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: res.scaleText(11),
                      fontWeight: FontWeight.w600,
                      color: selected
                          ? Colors.white
                          : (today
                                ? AppColors.primary
                                : AppColors.textSecondary),
                    ),
                  ),
                  SizedBox(height: res.scaleHeight(4)),
                  Text(
                    '${d.day}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: res.scaleText(14),
                      fontWeight: FontWeight.w700,
                      color: selected
                          ? Colors.white
                          : (today ? AppColors.primary : AppColors.textPrimary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ── Timeline data ────────────────────────────────────────────────────────────

class _TimelineSession {
  final int hour;
  final String childName;
  final SessionStatus status;
  final int therapistIndex;
  final String? notes;

  const _TimelineSession({
    required this.hour,
    required this.childName,
    required this.status,
    required this.therapistIndex,
    this.notes,
  });

  _TimelineSession copyWith({
    int? hour,
    String? childName,
    SessionStatus? status,
    int? therapistIndex,
    String? notes,
  }) {
    return _TimelineSession(
      hour: hour ?? this.hour,
      childName: childName ?? this.childName,
      status: status ?? this.status,
      therapistIndex: therapistIndex ?? this.therapistIndex,
      notes: notes ?? this.notes,
    );
  }
}

// ── Timeline view ────────────────────────────────────────────────────────────

class _TimelineView extends StatelessWidget {
  final List<_TimelineSession> sessions;
  final List<_TherapistData> therapists;
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;
  final void Function(int therapistIndex, int hour)? onEmptySlotTap;
  final void Function(_TimelineSession session)? onSessionTap;

  const _TimelineView({
    required this.sessions,
    required this.therapists,
    required this.res,
    required this.isDark,
    required this.l10n,
    this.onEmptySlotTap,
    this.onSessionTap,
  });

  static const _hours = [8, 9, 10, 11, 12, 13, 14, 15, 16];
  static const double _hourHeight = 72.0;

  Color _statusColor(SessionStatus s) {
    switch (s) {
      case SessionStatus.confirmed:
        return AppColors.success;
      case SessionStatus.cancelled:
        return AppColors.error;
      case SessionStatus.waiting:
        return AppColors.warning;
      case SessionStatus.postponed:
        return const Color(0xFFFF9800);
      case SessionStatus.upcoming:
        return AppColors.primary;
      case SessionStatus.completed:
        return AppColors.secondary;
      case SessionStatus.holiday:
        return AppColors.textSecondary;
    }
  }

  String _statusLabel(SessionStatus s, AppLocalizations l10n) {
    switch (s) {
      case SessionStatus.confirmed:
        return l10n.statusConfirmed;
      case SessionStatus.cancelled:
        return l10n.statusCancelled;
      case SessionStatus.waiting:
        return l10n.statusWaiting;
      case SessionStatus.postponed:
        return l10n.statusPostponed;
      case SessionStatus.upcoming:
        return l10n.upcomingSessions;
      case SessionStatus.completed:
        return l10n.statusCompleted;
      case SessionStatus.holiday:
        return l10n.holidayLegend;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusXxl),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusXxl),
        ),
        child: Column(
          children: [
            // ── Therapist header row (all 3) ────────────────────────────
            _TherapistHeaderRow(
              therapists: therapists,
              res: res,
              isDark: isDark,
            ),
            Divider(
              height: 1,
              color: isDark ? Colors.grey[800] : Colors.grey[100],
            ),
            // ── Scrollable timeline body ────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: _hours.map((hour) {
                    final sessionsByTherapist = List.generate(
                      therapists.length,
                      (tIdx) => sessions
                          .where((s) => s.hour == hour && s.therapistIndex == tIdx)
                          .firstOrNull,
                    );

                    return _TimeSlotRow(
                      hour: hour,
                      sessionsByTherapist: sessionsByTherapist,
                      therapistCount: therapists.length,
                      res: res,
                      isDark: isDark,
                      hourHeight: _hourHeight,
                      statusColor: _statusColor,
                      statusLabel: (s) => _statusLabel(s, l10n),
                      onEmptyTap: onEmptySlotTap == null
                          ? null
                          : (tIdx) => onEmptySlotTap!(tIdx, hour),
                      onSessionTap: onSessionTap,
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TherapistHeaderRow extends StatelessWidget {
  final List<_TherapistData> therapists;
  final ResponsiveHelper res;
  final bool isDark;

  const _TherapistHeaderRow({
    required this.therapists,
    required this.res,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(AppSpacing.p12),
        vertical: res.scaleHeight(10),
      ),
      child: Row(
        children: [
          SizedBox(width: res.scaleWidth(44)),
          ...therapists.map((t) {
            return Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: res.scaleWidth(13),
                    backgroundColor: t.color.withValues(alpha: 0.15),
                    child: Text(
                      t.initials,
                      style: TextStyle(
                        fontSize: res.scaleText(9),
                        fontWeight: FontWeight.w700,
                        color: t.color,
                      ),
                    ),
                  ),
                  SizedBox(height: res.scaleHeight(3)),
                  Text(
                    t.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: res.scaleText(9),
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white70 : AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _TimeSlotRow extends StatelessWidget {
  final int hour;
  final List<_TimelineSession?> sessionsByTherapist;
  final int therapistCount;
  final ResponsiveHelper res;
  final bool isDark;
  final double hourHeight;
  final Color Function(SessionStatus) statusColor;
  final String Function(SessionStatus) statusLabel;
  final void Function(int therapistIndex)? onEmptyTap;
  final void Function(_TimelineSession session)? onSessionTap;

  const _TimeSlotRow({
    required this.hour,
    required this.sessionsByTherapist,
    required this.therapistCount,
    required this.res,
    required this.isDark,
    required this.hourHeight,
    required this.statusColor,
    required this.statusLabel,
    this.onEmptyTap,
    this.onSessionTap,
  });

  String _formatHour(int h) {
    if (h < 10) return '0$h:00';
    if (h > 12) return '${h - 12}:00';
    return '$h:00';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hourHeight,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isDark ? Colors.grey[800]! : Colors.grey[100]!,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: res.scaleWidth(44),
            child: Center(
              child: Text(
                _formatHour(hour),
                style: TextStyle(
                  fontSize: res.scaleText(10),
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          ...List.generate(therapistCount, (tIdx) {
            final session = tIdx < sessionsByTherapist.length
                ? sessionsByTherapist[tIdx]
                : null;
            return Expanded(
              child: _SessionBlock(
                session: session,
                res: res,
                isDark: isDark,
                statusColor: statusColor,
                statusLabel: statusLabel,
                onTap: session != null && onSessionTap != null
                    ? () => onSessionTap!(session)
                    : null,
                onEmptyTap: session == null && onEmptyTap != null
                    ? () => onEmptyTap!(tIdx)
                    : null,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _SessionBlock extends StatelessWidget {
  final _TimelineSession? session;
  final ResponsiveHelper res;
  final bool isDark;
  final Color Function(SessionStatus) statusColor;
  final String Function(SessionStatus) statusLabel;
  final VoidCallback? onTap;
  final VoidCallback? onEmptyTap;

  const _SessionBlock({
    required this.session,
    required this.res,
    required this.isDark,
    required this.statusColor,
    required this.statusLabel,
    this.onTap,
    this.onEmptyTap,
  });

  IconData _statusIcon(SessionStatus s) {
    switch (s) {
      case SessionStatus.confirmed:
        return Icons.check_circle_outline_rounded;
      case SessionStatus.cancelled:
        return Icons.cancel_outlined;
      case SessionStatus.completed:
        return Icons.done_all_rounded;
      case SessionStatus.postponed:
        return Icons.schedule_rounded;
      default:
        return Icons.access_time_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (session == null) {
      return GestureDetector(
        onTap: onEmptyTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          margin: EdgeInsets.all(res.scaleSpacing(4)),
          decoration: BoxDecoration(
            color: onEmptyTap != null
                ? (isDark
                    ? Colors.white.withValues(alpha: 0.03)
                    : Colors.grey.withValues(alpha: 0.04))
                : Colors.transparent,
            borderRadius: BorderRadius.circular(
              res.scaleRadius(AppSpacing.radiusLg),
            ),
            border: onEmptyTap != null
                ? Border.all(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.06)
                        : Colors.grey.withValues(alpha: 0.12),
                    width: 1,
                    style: BorderStyle.solid,
                  )
                : null,
          ),
          child: onEmptyTap != null
              ? Center(
                  child: Icon(
                    Icons.add_rounded,
                    size: res.scaleWidth(16),
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.15)
                        : Colors.grey.withValues(alpha: 0.25),
                  ),
                )
              : null,
        ),
      );
    }

    final color = statusColor(session!.status);
    final label = statusLabel(session!.status);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(res.scaleSpacing(4)),
        child: Container(
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(
              res.scaleRadius(AppSpacing.radiusLg),
            ),
            border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: res.scaleSpacing(6),
            vertical: res.scaleHeight(6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                session!.childName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: res.scaleText(10),
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : AppColors.textPrimary,
                ),
              ),
              SizedBox(height: res.scaleHeight(2)),
              Row(
                children: [
                  Icon(
                    _statusIcon(session!.status),
                    size: res.scaleWidth(9),
                    color: color,
                  ),
                  SizedBox(width: res.scaleWidth(3)),
                  Flexible(
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: res.scaleText(8),
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Add Appointment Bottom Sheet (Reception only) ────────────────────────────

class _AddAppointmentSheet extends StatefulWidget {
  final List<_TherapistData> therapists;
  final int selectedHour;
  final int selectedTherapistIndex;
  final ResponsiveHelper res;
  final bool isDark;
  final void Function(String childName, int therapistIndex, String? notes) onConfirm;

  const _AddAppointmentSheet({
    required this.therapists,
    required this.selectedHour,
    required this.selectedTherapistIndex,
    required this.res,
    required this.isDark,
    required this.onConfirm,
  });

  @override
  State<_AddAppointmentSheet> createState() => _AddAppointmentSheetState();
}

class _AddAppointmentSheetState extends State<_AddAppointmentSheet> {
  static const _mockChildren = [
    'أحمد علي',
    'سارة حسن',
    'عمر خالد',
    'نور أحمد',
    'ياسين محمد',
    'فاطمة سعيد',
    'خالد الأحمد',
    'ليلى إبراهيم',
  ];

  String? _selectedChild;
  late int _selectedTherapistIndex;
  final _notesController = TextEditingController();
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    _selectedTherapistIndex = widget.selectedTherapistIndex;
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  String _formatHour(int h) {
    if (h < 10) return '0$h:00';
    if (h > 12) return '${h - 12}:00 ${h < 12 ? "AM" : "PM"}';
    return '$h:00';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = widget.res;
    final isDark = widget.isDark;
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(res.scaleRadius(AppSpacing.radiusXxl)),
        ),
      ),
      padding: EdgeInsets.only(
        left: res.scaleSpacing(AppSpacing.p20),
        right: res.scaleSpacing(AppSpacing.p20),
        top: res.scaleHeight(AppSpacing.p16),
        bottom: res.scaleHeight(AppSpacing.p24) + bottomPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: res.scaleWidth(40),
              height: res.scaleHeight(4),
              decoration: BoxDecoration(
                color: isDark ? Colors.white24 : Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p16)),

          // Title + time badge
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.addAppointment,
                  style: TextStyle(
                    fontSize: res.scaleText(16),
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : AppColors.textPrimary,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: res.scaleSpacing(AppSpacing.p12),
                  vertical: res.scaleHeight(4),
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(
                    res.scaleRadius(AppSpacing.radiusLg),
                  ),
                ),
                child: Text(
                  _formatHour(widget.selectedHour),
                  style: TextStyle(
                    fontSize: res.scaleText(12),
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p20)),

          // Child dropdown
          Text(
            l10n.selectChildLabel,
            style: TextStyle(
              fontSize: res.scaleText(12),
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p8)),
          Container(
            decoration: BoxDecoration(
              color: isDark ? AppColors.backgroundDark : AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(
                res.scaleRadius(AppSpacing.radiusLg),
              ),
              border: Border.all(
                color: _showError && _selectedChild == null
                    ? AppColors.error
                    : isDark
                    ? Colors.white12
                    : Colors.grey[200]!,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedChild,
                hint: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: res.scaleSpacing(AppSpacing.p12),
                  ),
                  child: Text(
                    l10n.selectChildHint,
                    style: TextStyle(
                      fontSize: res.scaleText(13),
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                isExpanded: true,
                dropdownColor:
                    isDark ? AppColors.surfaceDark : Colors.white,
                icon: Padding(
                  padding: EdgeInsets.only(right: res.scaleSpacing(8)),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.textSecondary,
                    size: res.scaleWidth(20),
                  ),
                ),
                items: _mockChildren.map((child) {
                  return DropdownMenuItem(
                    value: child,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: res.scaleSpacing(AppSpacing.p12),
                      ),
                      child: Text(
                        child,
                        style: TextStyle(
                          fontSize: res.scaleText(13),
                          color: isDark ? Colors.white : AppColors.textPrimary,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (val) => setState(() {
                  _selectedChild = val;
                  _showError = false;
                }),
              ),
            ),
          ),
          if (_showError && _selectedChild == null) ...[
            SizedBox(height: res.scaleHeight(4)),
            Text(
              l10n.fieldRequired,
              style: TextStyle(
                fontSize: res.scaleText(11),
                color: AppColors.error,
              ),
            ),
          ],
          SizedBox(height: res.scaleHeight(AppSpacing.p16)),

          // Therapist selection
          Text(
            l10n.selectTherapistLabel,
            style: TextStyle(
              fontSize: res.scaleText(12),
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p8)),
          Row(
            children: widget.therapists.asMap().entries.map((entry) {
              final i = entry.key;
              final t = entry.value;
              final selected = _selectedTherapistIndex == i;
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedTherapistIndex = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    margin: EdgeInsets.only(
                      right: i < widget.therapists.length - 1
                          ? res.scaleSpacing(8)
                          : 0,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: res.scaleHeight(AppSpacing.p8),
                      horizontal: res.scaleSpacing(6),
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? t.color.withValues(alpha: 0.12)
                          : (isDark
                                ? AppColors.backgroundDark
                                : AppColors.surfaceLight),
                      borderRadius: BorderRadius.circular(
                        res.scaleRadius(AppSpacing.radiusLg),
                      ),
                      border: Border.all(
                        color: selected
                            ? t.color
                            : (isDark ? Colors.white12 : Colors.grey[200]!),
                        width: selected ? 1.5 : 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: res.scaleWidth(12),
                          backgroundColor:
                              t.color.withValues(alpha: selected ? 0.2 : 0.1),
                          child: Text(
                            t.initials,
                            style: TextStyle(
                              fontSize: res.scaleText(9),
                              fontWeight: FontWeight.w700,
                              color: t.color,
                            ),
                          ),
                        ),
                        SizedBox(height: res.scaleHeight(4)),
                        Text(
                          t.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: res.scaleText(9),
                            fontWeight: selected
                                ? FontWeight.w700
                                : FontWeight.w500,
                            color: selected
                                ? t.color
                                : AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p16)),

          // Notes field
          Text(
            l10n.notesLabel,
            style: TextStyle(
              fontSize: res.scaleText(12),
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p8)),
          Container(
            decoration: BoxDecoration(
              color: isDark ? AppColors.backgroundDark : AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(
                res.scaleRadius(AppSpacing.radiusLg),
              ),
              border: Border.all(
                color: isDark ? Colors.white12 : Colors.grey[200]!,
              ),
            ),
            child: TextField(
              controller: _notesController,
              maxLines: 2,
              style: TextStyle(
                fontSize: res.scaleText(13),
                color: isDark ? Colors.white : AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: l10n.notesOptionalHint,
                hintStyle: TextStyle(
                  fontSize: res.scaleText(13),
                  color: AppColors.textSecondary,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: res.scaleSpacing(AppSpacing.p12),
                  vertical: res.scaleHeight(AppSpacing.p8),
                ),
              ),
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p20)),

          // Action buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                    side: BorderSide(
                      color: isDark ? Colors.white24 : Colors.grey[300]!,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: res.scaleHeight(AppSpacing.p12),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        res.scaleRadius(AppSpacing.radiusLg),
                      ),
                    ),
                  ),
                  child: Text(
                    l10n.cancel,
                    style: TextStyle(fontSize: res.scaleText(13)),
                  ),
                ),
              ),
              SizedBox(width: res.scaleSpacing(AppSpacing.p12)),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedChild == null) {
                      setState(() => _showError = true);
                      return;
                    }
                    Navigator.pop(context);
                    widget.onConfirm(
                      _selectedChild!,
                      _selectedTherapistIndex,
                      _notesController.text.trim().isEmpty
                          ? null
                          : _notesController.text.trim(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      vertical: res.scaleHeight(AppSpacing.p12),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        res.scaleRadius(AppSpacing.radiusLg),
                      ),
                    ),
                  ),
                  child: Text(
                    l10n.confirm,
                    style: TextStyle(
                      fontSize: res.scaleText(13),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Appointment Detail Bottom Sheet (Reception only) ─────────────────────────

class _AppointmentDetailSheet extends StatefulWidget {
  final _TimelineSession session;
  final _TherapistData therapist;
  final ResponsiveHelper res;
  final bool isDark;
  final void Function(SessionStatus newStatus) onStatusChanged;

  const _AppointmentDetailSheet({
    required this.session,
    required this.therapist,
    required this.res,
    required this.isDark,
    required this.onStatusChanged,
  });

  @override
  State<_AppointmentDetailSheet> createState() =>
      _AppointmentDetailSheetState();
}

class _AppointmentDetailSheetState extends State<_AppointmentDetailSheet> {
  late SessionStatus _currentStatus;

  @override
  void initState() {
    super.initState();
    _currentStatus = widget.session.status;
  }

  Color _statusColor(SessionStatus s) {
    switch (s) {
      case SessionStatus.confirmed:
        return AppColors.success;
      case SessionStatus.cancelled:
        return AppColors.error;
      case SessionStatus.waiting:
        return AppColors.warning;
      case SessionStatus.postponed:
        return const Color(0xFFFF9800);
      case SessionStatus.upcoming:
        return AppColors.primary;
      case SessionStatus.completed:
        return AppColors.secondary;
      case SessionStatus.holiday:
        return AppColors.textSecondary;
    }
  }

  String _statusLabel(SessionStatus s, AppLocalizations l10n) {
    switch (s) {
      case SessionStatus.confirmed:
        return l10n.statusConfirmed;
      case SessionStatus.cancelled:
        return l10n.statusCancelled;
      case SessionStatus.waiting:
        return l10n.statusWaiting;
      case SessionStatus.postponed:
        return l10n.statusPostponed;
      case SessionStatus.upcoming:
        return l10n.upcomingSessions;
      case SessionStatus.completed:
        return l10n.statusCompleted;
      case SessionStatus.holiday:
        return l10n.holidayLegend;
    }
  }

  String _formatHour(int h) {
    if (h < 10) return '0$h:00';
    if (h > 12) return '${h - 12}:00 PM';
    return '$h:00';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = widget.res;
    final isDark = widget.isDark;
    final t = widget.therapist;

    const statusOptions = [
      SessionStatus.confirmed,
      SessionStatus.cancelled,
      SessionStatus.postponed,
      SessionStatus.completed,
    ];

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(res.scaleRadius(AppSpacing.radiusXxl)),
        ),
      ),
      padding: EdgeInsets.only(
        left: res.scaleSpacing(AppSpacing.p20),
        right: res.scaleSpacing(AppSpacing.p20),
        top: res.scaleHeight(AppSpacing.p16),
        bottom: res.scaleHeight(AppSpacing.p24) +
            MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: res.scaleWidth(40),
              height: res.scaleHeight(4),
              decoration: BoxDecoration(
                color: isDark ? Colors.white24 : Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p16)),

          Text(
            l10n.appointmentDetails,
            style: TextStyle(
              fontSize: res.scaleText(16),
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p16)),

          // Detail card
          Container(
            padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
            decoration: BoxDecoration(
              color: isDark ? AppColors.backgroundDark : AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(
                res.scaleRadius(AppSpacing.radiusXl),
              ),
            ),
            child: Column(
              children: [
                _DetailRow(
                  icon: Icons.person_outline_rounded,
                  label: l10n.child,
                  value: widget.session.childName,
                  res: res,
                  isDark: isDark,
                ),
                SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                _DetailRow(
                  icon: Icons.medical_services_outlined,
                  label: l10n.therapist,
                  value: t.name,
                  valueColor: t.color,
                  res: res,
                  isDark: isDark,
                ),
                SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                _DetailRow(
                  icon: Icons.access_time_rounded,
                  label: l10n.selectTimeLabel,
                  value: _formatHour(widget.session.hour),
                  res: res,
                  isDark: isDark,
                ),
                if (widget.session.notes != null) ...[
                  SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                  _DetailRow(
                    icon: Icons.notes_rounded,
                    label: l10n.notesLabel,
                    value: widget.session.notes!,
                    res: res,
                    isDark: isDark,
                  ),
                ],
              ],
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p20)),

          // Change status label
          Text(
            l10n.changeStatus,
            style: TextStyle(
              fontSize: res.scaleText(12),
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p8)),

          // Status option chips
          Wrap(
            spacing: res.scaleSpacing(AppSpacing.p8),
            runSpacing: res.scaleHeight(AppSpacing.p8),
            children: statusOptions.map((s) {
              final isSelected = _currentStatus == s;
              final color = _statusColor(s);
              return GestureDetector(
                onTap: () {
                  setState(() => _currentStatus = s);
                  Navigator.pop(context);
                  widget.onStatusChanged(s);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 160),
                  padding: EdgeInsets.symmetric(
                    horizontal: res.scaleSpacing(AppSpacing.p16),
                    vertical: res.scaleHeight(AppSpacing.p8),
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? color
                        : color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(
                      res.scaleRadius(AppSpacing.radiusLg),
                    ),
                    border: Border.all(
                      color: color,
                      width: isSelected ? 0 : 1,
                    ),
                  ),
                  child: Text(
                    _statusLabel(s, l10n),
                    style: TextStyle(
                      fontSize: res.scaleText(13),
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : color,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p8)),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;
  final ResponsiveHelper res;
  final bool isDark;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.res,
    required this.isDark,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: res.scaleWidth(16),
          color: AppColors.textSecondary,
        ),
        SizedBox(width: res.scaleSpacing(AppSpacing.p8)),
        Text(
          '$label:',
          style: TextStyle(
            fontSize: res.scaleText(12),
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: res.scaleSpacing(AppSpacing.p4)),
        Expanded(
          child: Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: res.scaleText(13),
              fontWeight: FontWeight.w600,
              color: valueColor ??
                  (isDark ? Colors.white : AppColors.textPrimary),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Non-receptionist: Selected day panel ─────────────────────────────────────

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
              .map(
                (s) => Padding(
                  padding: EdgeInsets.only(
                    bottom: res.scaleHeight(AppSpacing.p12),
                  ),
                  child: _SessionCard(
                    session: s,
                    res: res,
                    l10n: l10n,
                    isDark: isDark,
                  ),
                ),
              ),
        if (sessions.any((s) => s.status == SessionStatus.holiday))
          _HolidayCard(res: res, l10n: l10n, isDark: isDark),
      ],
    );
  }

  String _formatDate(DateTime d, String locale) {
    if (locale == 'ar') {
      const months = [
        'يناير',
        'فبراير',
        'مارس',
        'أبريل',
        'مايو',
        'يونيو',
        'يوليو',
        'أغسطس',
        'سبتمبر',
        'أكتوبر',
        'نوفمبر',
        'ديسمبر',
      ];
      return '${d.day} ${months[d.month - 1]} ${d.year}';
    }
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[d.month - 1]} ${d.day}, ${d.year}';
  }
}

class _EmptyDay extends StatelessWidget {
  final ResponsiveHelper res;
  final AppLocalizations l10n;
  final bool isDark;

  const _EmptyDay({
    required this.res,
    required this.l10n,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p24)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusXl),
        ),
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

  Color get _statusColor {
    switch (session.status) {
      case SessionStatus.upcoming:
        return AppColors.primary;
      case SessionStatus.completed:
        return AppColors.secondary;
      case SessionStatus.confirmed:
        return AppColors.success;
      case SessionStatus.cancelled:
        return AppColors.error;
      case SessionStatus.waiting:
        return AppColors.warning;
      case SessionStatus.postponed:
        return const Color(0xFFFF9800);
      case SessionStatus.holiday:
        return AppColors.textSecondary;
    }
  }

  String _statusLabel(AppLocalizations l10n) {
    switch (session.status) {
      case SessionStatus.upcoming:
        return l10n.upcomingSessions;
      case SessionStatus.completed:
        return l10n.statusCompleted;
      case SessionStatus.confirmed:
        return l10n.statusConfirmed;
      case SessionStatus.cancelled:
        return l10n.statusCancelled;
      case SessionStatus.waiting:
        return l10n.statusWaiting;
      case SessionStatus.postponed:
        return l10n.statusPostponed;
      case SessionStatus.holiday:
        return l10n.holidayLegend;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusXl),
        ),
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
            height: res.scaleHeight(72),
            decoration: BoxDecoration(
              color: _statusColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(res.scaleRadius(AppSpacing.radiusXl)),
                bottomLeft: Radius.circular(
                  res.scaleRadius(AppSpacing.radiusXl),
                ),
              ),
            ),
          ),
          SizedBox(width: res.scaleWidth(AppSpacing.p12)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: res.scaleHeight(AppSpacing.p12),
              ),
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
                      Icon(
                        Icons.person_outline_rounded,
                        size: res.scaleWidth(13),
                        color: AppColors.textSecondary,
                      ),
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
                      Icon(
                        Icons.access_time_rounded,
                        size: res.scaleWidth(13),
                        color: AppColors.textSecondary,
                      ),
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
                borderRadius: BorderRadius.circular(
                  res.scaleRadius(AppSpacing.radiusLg),
                ),
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

class _HolidayCard extends StatelessWidget {
  final ResponsiveHelper res;
  final AppLocalizations l10n;
  final bool isDark;

  const _HolidayCard({
    required this.res,
    required this.l10n,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusXl),
        ),
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
                bottomLeft: Radius.circular(
                  res.scaleRadius(AppSpacing.radiusXl),
                ),
              ),
            ),
          ),
          SizedBox(width: res.scaleWidth(AppSpacing.p12)),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: res.scaleHeight(AppSpacing.p16),
            ),
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
