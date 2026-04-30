import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// Centered section title shown at the top of every case-study section.
/// Pass [subtitle] for an optional smaller line below the title.
class FormSectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const FormSectionHeader({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            subtitle!,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
