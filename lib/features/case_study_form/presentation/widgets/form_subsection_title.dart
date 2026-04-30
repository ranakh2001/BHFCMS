import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// Highlighted subsection header used inside case-study sections.
/// Renders a primary-tinted background container with bold text.
class FormSubsectionTitle extends StatelessWidget {
  final String text;

  const FormSubsectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
      ),
    );
  }
}
