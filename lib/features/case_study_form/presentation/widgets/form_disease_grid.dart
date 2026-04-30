import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';

/// A data item for a single disease condition row.
class DiseaseCondition {
  final String label;
  final bool? value;
  final ValueChanged<bool?> onChanged;

  const DiseaseCondition({
    required this.label,
    required this.value,
    required this.onChanged,
  });
}

/// 2-column grid of yes/no disease conditions with a section label.
///
/// Renders [conditions] two per row, matching the pregnancy-diseases design.
class FormDiseaseGrid extends StatelessWidget {
  final String label;
  final List<DiseaseCondition> conditions;

  const FormDiseaseGrid({
    super.key,
    required this.label,
    required this.conditions,
  });

  @override
  Widget build(BuildContext context) {
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    final rows = <Widget>[];

    for (int i = 0; i < conditions.length; i += 2) {
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.p8),
          child: Row(
            children: [
              Expanded(
                child: _DiseaseCell(
                  condition: conditions[i],
                  isAr: isAr,
                ),
              ),
              const SizedBox(width: AppSpacing.p8),
              if (i + 1 < conditions.length)
                Expanded(
                  child: _DiseaseCell(
                    condition: conditions[i + 1],
                    isAr: isAr,
                  ),
                )
              else
                const Expanded(child: SizedBox()),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
        ),
        const SizedBox(height: AppSpacing.p8),
        ...rows,
      ],
    );
  }
}

/// One cell in the grid: disease name + inline yes/no.
class _DiseaseCell extends StatelessWidget {
  final DiseaseCondition condition;
  final bool isAr;

  const _DiseaseCell({required this.condition, required this.isAr});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            condition.label,
            style: const TextStyle(fontSize: 13, color: AppColors.textPrimary),
          ),
        ),
        _MiniRadio(
          label: isAr ? 'نعم' : 'Yes',
          isSelected: condition.value == true,
          onTap: () => condition.onChanged(true),
        ),
        const SizedBox(width: AppSpacing.p8),
        _MiniRadio(
          label: isAr ? 'لا' : 'No',
          isSelected: condition.value == false,
          onTap: () => condition.onChanged(false),
        ),
      ],
    );
  }
}

class _MiniRadio extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _MiniRadio({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 140),
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : Colors.grey.shade400,
                  width: 1.8,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 9,
                        height: 9,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.5,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
                fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
