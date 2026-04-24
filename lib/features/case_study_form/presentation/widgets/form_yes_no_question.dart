import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';

/// A labeled yes/no radio question with optional conditional child widget.
///
/// Covers the dominant UI pattern in the medical sections:
///   question text → [note] → (نعم) (لا) → [error] → [conditional child]
class FormYesNoQuestion extends StatelessWidget {
  final String label;

  /// Small italic note displayed directly below [label].
  final String? note;

  final bool? value;
  final ValueChanged<bool?> onChanged;
  final String? errorText;

  /// Widget shown when the condition is met (e.g. a follow-up text field).
  final Widget? conditionalChild;

  /// When true (default): [conditionalChild] appears when [value] == true.
  /// When false: [conditionalChild] appears when [value] == false.
  final bool showConditionalWhenTrue;

  const FormYesNoQuestion({
    super.key,
    required this.label,
    this.note,
    required this.value,
    required this.onChanged,
    this.errorText,
    this.conditionalChild,
    this.showConditionalWhenTrue = true,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final showChild = conditionalChild != null &&
        (showConditionalWhenTrue ? value == true : value == false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Question label ────────────────────────────────────────────────
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
        ),

        // ── Optional note ─────────────────────────────────────────────────
        if (note != null)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              note!,
              style: const TextStyle(
                fontSize: 11.5,
                color: AppColors.textSecondary,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

        // ── Yes / No row ──────────────────────────────────────────────────
        Row(
          children: [
            _YesNoChip(
              label: l10n.csYes,
              isSelected: value == true,
              onTap: () => onChanged(true),
            ),
            const SizedBox(width: AppSpacing.p16),
            _YesNoChip(
              label: l10n.csNo,
              isSelected: value == false,
              onTap: () => onChanged(false),
            ),
          ],
        ),

        // ── Validation error ──────────────────────────────────────────────
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 4, right: 4),
            child: Text(
              errorText!,
              style: const TextStyle(color: AppColors.error, fontSize: 11.5),
            ),
          ),

        // ── Conditional child ─────────────────────────────────────────────
        if (showChild) ...[
          const SizedBox(height: AppSpacing.p12),
          conditionalChild!,
        ],
      ],
    );
  }
}

/// Minimal inline radio chip used by [FormYesNoQuestion].
class _YesNoChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _YesNoChip({
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
        padding: const EdgeInsets.symmetric(vertical: 6),
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
                  color: isSelected
                      ? AppColors.primary
                      : Colors.grey.shade400,
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
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 13.5,
                fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.normal,
                color:
                    isSelected ? AppColors.primary : AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
