import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/colors.dart';

/// A tappable date field that shows a calendar picker.
class FormDatePickerField extends StatelessWidget {
  final String label;
  final DateTime? value;
  final ValueChanged<DateTime> onChanged;
  final String? errorText;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const FormDatePickerField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.errorText,
    this.firstDate,
    this.lastDate,
  });

  Future<void> _pick(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: value ?? now,
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? now,
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.light(primary: AppColors.primary),
        ),
        child: child!,
      ),
    );
    if (picked != null) onChanged(picked);
  }

  @override
  Widget build(BuildContext context) {
    final formatted =
        value != null ? DateFormat('MM/dd/yyyy').format(value!) : null;

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
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () => _pick(context),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6FA),
              borderRadius: BorderRadius.circular(10),
              border: errorText != null
                  ? Border.all(color: AppColors.error, width: 1.2)
                  : null,
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_month_outlined,
                    size: 18, color: AppColors.primary),
                const SizedBox(width: 10),
                Text(
                  formatted ?? 'MM/DD/YYYY',
                  style: TextStyle(
                    fontSize: 14,
                    color: formatted != null
                        ? AppColors.textPrimary
                        : Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
            child: Text(
              errorText!,
              style: const TextStyle(color: AppColors.error, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
