import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class DateSelector extends StatefulWidget {
  final ValueChanged<DateTime>? onDateSelected;

  const DateSelector({super.key, this.onDateSelected});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  static const int _daysBeforeToday = 3;
  static const int _totalDays = 7;

  late final DateTime _today;
  late final List<DateTime> _days;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _today = DateTime(now.year, now.month, now.day);
    _selectedDate = _today;
    _days = List.generate(
      _totalDays,
      (i) => _today.add(Duration(days: i - _daysBeforeToday)),
    );
  }

  bool _isToday(DateTime date) => date == _today;

  bool _isSelected(DateTime date) => date == _selectedDate;

  void _selectDate(DateTime date) {
    setState(() => _selectedDate = date);
    widget.onDateSelected?.call(date);
  }

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final locale = Localizations.localeOf(context).languageCode;
    final l10n = AppLocalizations.of(context)!;

    return SizedBox(
      height: res.scaleHeight(85),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: res.scaleSpacing(AppSpacing.p24),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: _days.length,
        separatorBuilder: (_, __) => SizedBox(width: res.scaleWidth(12)),
        itemBuilder: (context, index) {
          final day = _days[index];
          final selected = _isSelected(day);
          final label = _isToday(day)
              ? l10n.today
              : DateFormat('EEE', locale).format(day);

          return GestureDetector(
            onTap: () => _selectDate(day),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: res.scaleWidth(65),
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.primary
                    : (isDark ? AppColors.surfaceDark : Colors.white),
                borderRadius: BorderRadius.circular(
                  res.scaleRadius(AppSpacing.radiusXl),
                ),
                border: selected
                    ? null
                    : Border.all(
                        color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                        width: 1,
                      ),
                boxShadow: selected
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              padding: EdgeInsets.symmetric(vertical: res.scaleHeight(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: selected
                          ? Colors.white
                          : AppColors.textSecondary,
                      fontSize: res.scaleText(12),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: res.scaleHeight(4)),
                  Text(
                    day.day.toString(),
                    style: TextStyle(
                      color: selected
                          ? Colors.white
                          : (isDark ? Colors.white : AppColors.textPrimary),
                      fontSize: res.scaleText(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
