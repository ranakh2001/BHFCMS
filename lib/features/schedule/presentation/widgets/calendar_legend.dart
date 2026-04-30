import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';

class CalendarLegend extends StatelessWidget {
  const CalendarLegend({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = ResponsiveHelper(context);

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: res.scaleWidth(12),
      runSpacing: res.scaleHeight(6),
      children: [
        _LegendItem(
          color: AppColors.primary,
          label: l10n.upcomingSessionLegend,
          res: res,
        ),
        _LegendItem(
          color: AppColors.secondary,
          label: l10n.completedSessionLegend,
          res: res,
        ),
        _LegendItem(
          color: AppColors.warning,
          label: l10n.incompleteSessions,
          res: res,
        ),
        _LegendItem(
          color: const Color(0xFF607D8B),
          label: l10n.deletedSessions,
          res: res,
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final ResponsiveHelper res;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.res,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: res.scaleWidth(8),
          height: res.scaleWidth(8),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: res.scaleWidth(4)),
        Text(
          label,
          style: TextStyle(
            fontSize: res.scaleText(10),
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
