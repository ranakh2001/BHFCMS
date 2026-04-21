import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../models/schedule_session.dart';
import '../providers/schedule_provider.dart';
import 'calendar_legend.dart';

class ScheduleCalendar extends StatelessWidget {
  final DateTime displayedMonth;
  final DateTime? selectedDate;
  final SessionMap sessions;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;
  final ValueChanged<DateTime> onDateSelected;

  const ScheduleCalendar({
    super.key,
    required this.displayedMonth,
    required this.selectedDate,
    required this.sessions,
    required this.onPreviousMonth,
    required this.onNextMonth,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXxl)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.06),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
      child: Column(
        children: [
          _CalendarHeader(
            displayedMonth: displayedMonth,
            onPrevious: onPreviousMonth,
            onNext: onNextMonth,
            res: res,
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p12)),
          _DayHeaders(res: res),
          SizedBox(height: res.scaleHeight(AppSpacing.p4)),
          _DayGrid(
            displayedMonth: displayedMonth,
            selectedDate: selectedDate,
            sessions: sessions,
            onDateSelected: onDateSelected,
            res: res,
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p16)),
          const CalendarLegend(),
        ],
      ),
    );
  }
}

// ── Header: < Month Year > ─────────────────────────────────────────────────

class _CalendarHeader extends StatelessWidget {
  final DateTime displayedMonth;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final ResponsiveHelper res;

  const _CalendarHeader({
    required this.displayedMonth,
    required this.onPrevious,
    required this.onNext,
    required this.res,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final monthYear = intl.DateFormat('MMMM yyyy', locale).format(displayedMonth);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _NavArrow(icon: Icons.chevron_left, onTap: onPrevious, res: res),
        Text(
          monthYear,
          style: TextStyle(
            fontSize: res.scaleText(15),
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        _NavArrow(icon: Icons.chevron_right, onTap: onNext, res: res),
      ],
    );
  }
}

class _NavArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final ResponsiveHelper res;

  const _NavArrow({required this.icon, required this.onTap, required this.res});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: res.scaleWidth(32),
        height: res.scaleHeight(32),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: res.scaleWidth(22),
          color: AppColors.primary,
        ),
      ),
    );
  }
}

// ── Day-of-week headers ────────────────────────────────────────────────────
// Week starts Friday. In RTL Row, index 0 renders on the RIGHT → ج(Fri) on right ✓
// In LTR Row, index 0 renders on the LEFT → Fr on left ✓

class _DayHeaders extends StatelessWidget {
  final ResponsiveHelper res;

  const _DayHeaders({required this.res});

  static const _arHeaders = ['ج', 'س', 'ح', 'ن', 'ث', 'ر', 'خ'];
  static const _enHeaders = ['Fr', 'Sa', 'Su', 'Mo', 'Tu', 'We', 'Th'];

  @override
  Widget build(BuildContext context) {
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    final headers = isAr ? _arHeaders : _enHeaders;

    return Row(
      children: headers
          .map((h) => Expanded(
                child: Center(
                  child: Text(
                    h,
                    style: TextStyle(
                      fontSize: res.scaleText(12),
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}

// ── Day grid ───────────────────────────────────────────────────────────────

class _DayGrid extends StatelessWidget {
  final DateTime displayedMonth;
  final DateTime? selectedDate;
  final SessionMap sessions;
  final ValueChanged<DateTime> onDateSelected;
  final ResponsiveHelper res;

  const _DayGrid({
    required this.displayedMonth,
    required this.selectedDate,
    required this.sessions,
    required this.onDateSelected,
    required this.res,
  });

  // Column index 0 = Friday. Dart weekday: Mon=1..Sun=7
  // offset = (weekday - 5 + 7) % 7
  static int _startOffset(int weekday) => (weekday - 5 + 7) % 7;

  @override
  Widget build(BuildContext context) {
    final year = displayedMonth.year;
    final month = displayedMonth.month;
    final daysInMonth = DateTime(year, month + 1, 0).day;
    final firstWeekday = DateTime(year, month, 1).weekday;
    final offset = _startOffset(firstWeekday);

    final today = DateTime.now();
    final todayNorm = DateTime(today.year, today.month, today.day);

    final rowCount = ((offset + daysInMonth) / 7).ceil();

    return Column(
      children: List.generate(rowCount, (row) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: res.scaleHeight(2)),
          child: Row(
            children: List.generate(7, (col) {
              final cellIndex = row * 7 + col;
              final dayNum = cellIndex - offset + 1;

              if (dayNum < 1 || dayNum > daysInMonth) {
                return const Expanded(child: SizedBox());
              }

              final date = DateTime(year, month, dayNum);
              final isToday = date == todayNorm;
              final isSelected = selectedDate != null &&
                  date.year == selectedDate!.year &&
                  date.month == selectedDate!.month &&
                  date.day == selectedDate!.day;
              final daySessions = sessions[date] ?? [];

              return Expanded(
                child: _DayCell(
                  day: dayNum,
                  isToday: isToday,
                  isSelected: isSelected && !isToday,
                  sessions: daySessions,
                  onTap: () => onDateSelected(date),
                  res: res,
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}

// ── Single day cell ────────────────────────────────────────────────────────

class _DayCell extends StatelessWidget {
  final int day;
  final bool isToday;
  final bool isSelected;
  final List<ScheduleSession> sessions;
  final VoidCallback onTap;
  final ResponsiveHelper res;

  const _DayCell({
    required this.day,
    required this.isToday,
    required this.isSelected,
    required this.sessions,
    required this.onTap,
    required this.res,
  });

  @override
  Widget build(BuildContext context) {
    final circleSize = res.scaleWidth(34);

    Color? bgColor;
    Color textColor;
    if (isToday) {
      bgColor = AppColors.primary;
      textColor = Colors.white;
    } else if (isSelected) {
      bgColor = AppColors.primary.withValues(alpha: 0.12);
      textColor = AppColors.primary;
    } else {
      bgColor = null;
      textColor = AppColors.textPrimary;
    }

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: res.scaleHeight(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: circleSize,
              height: circleSize,
              decoration: bgColor != null
                  ? BoxDecoration(color: bgColor, shape: BoxShape.circle)
                  : null,
              alignment: Alignment.center,
              child: Text(
                '$day',
                style: TextStyle(
                  fontSize: res.scaleText(13),
                  fontWeight: isToday || isSelected ? FontWeight.w700 : FontWeight.w400,
                  color: textColor,
                ),
              ),
            ),
            SizedBox(height: res.scaleHeight(3)),
            _SessionDots(sessions: sessions, res: res),
          ],
        ),
      ),
    );
  }
}

// ── Session dot indicators ─────────────────────────────────────────────────

class _SessionDots extends StatelessWidget {
  final List<ScheduleSession> sessions;
  final ResponsiveHelper res;

  const _SessionDots({required this.sessions, required this.res});

  Color _dotColor(SessionStatus status) {
    switch (status) {
      case SessionStatus.upcoming:
        return AppColors.primary;
      case SessionStatus.completed:
        return AppColors.secondary;
      case SessionStatus.holiday:
        return AppColors.textSecondary.withValues(alpha: 0.5);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (sessions.isEmpty) return SizedBox(height: res.scaleHeight(5));

    final visible = sessions.take(3).toList();
    final dotSize = res.scaleWidth(5);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(visible.length, (i) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: res.scaleWidth(1)),
          child: Container(
            width: dotSize,
            height: dotSize,
            decoration: BoxDecoration(
              color: _dotColor(visible[i].status),
              shape: BoxShape.circle,
            ),
          ),
        );
      }),
    );
  }
}
