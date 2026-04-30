import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class RadioOption<T> {
  final String label;
  final T value;

  const RadioOption({required this.label, required this.value});
}

/// Inline radio button group with a label above.
/// Uses a custom radio indicator to avoid deprecated Radio widget APIs.
class FormRadioGroup<T> extends StatelessWidget {
  final String label;
  final List<RadioOption<T>> options;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final String? errorText;

  const FormRadioGroup({
    super.key,
    required this.label,
    required this.options,
    required this.groupValue,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
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
        const SizedBox(height: 4),
        Wrap(
          spacing: 0,
          runSpacing: 4,
          children: options.map((opt) => _RadioTile<T>(
                option: opt,
                isSelected: opt.value == groupValue,
                onTap: () => onChanged(opt.value),
              )).toList(),
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

class _RadioTile<T> extends StatelessWidget {
  final RadioOption<T> option;
  final bool isSelected;
  final VoidCallback onTap;

  const _RadioTile({
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 6),
            Text(
              option.label,
              style: TextStyle(
                fontSize: 14,
                fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.normal,
                color:
                    isSelected ? AppColors.primary : AppColors.textPrimary,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
