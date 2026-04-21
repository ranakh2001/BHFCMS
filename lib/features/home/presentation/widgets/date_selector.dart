import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class DateSelector extends StatelessWidget {
  // Mock data representing the days
  final List<Map<String, dynamic>> dates = const [
    {"day": "السبت", "number": "11", "isSelected": false},
    {"day": "الأحد", "number": "12", "isSelected": false},
    {"day": "اليوم", "number": "13", "isSelected": true},
    {"day": "الثلاثاء", "number": "14", "isSelected": false},
    {"day": "الأربعاء", "number": "15", "isSelected": false},
  ];

  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: res.scaleHeight(85), 
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(AppSpacing.p24)),
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        separatorBuilder: (context, index) => SizedBox(width: res.scaleWidth(12)),
        itemBuilder: (context, index) {
          final data = dates[index];
          final bool isSelected = data["isSelected"];
          
          return Container(
            width: res.scaleWidth(65),
            decoration: BoxDecoration(
              color: isSelected 
                  ? AppColors.primary 
                  : (isDark ? AppColors.surfaceDark : Colors.white),
              borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
              border: isSelected 
                  ? null 
                  : Border.all(
                      color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                      width: 1,
                    ),
              boxShadow: isSelected ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ] : [],
            ),
            padding: EdgeInsets.symmetric(vertical: res.scaleHeight(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data["day"],
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppColors.textSecondary,
                    fontSize: res.scaleText(12),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: res.scaleHeight(4)),
                Text(
                  data["number"],
                  style: TextStyle(
                    color: isSelected 
                        ? Colors.white 
                        : (isDark ? Colors.white : AppColors.textPrimary),
                    fontSize: res.scaleText(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
