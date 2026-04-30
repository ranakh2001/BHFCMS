import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// Labeled single-line text input consistent with other form fields.
class FormTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hint;
  final String? errorText;

  const FormTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
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
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
            filled: true,
            fillColor: const Color(0xFFF5F6FA),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: errorText != null
                  ? const BorderSide(color: AppColors.error, width: 1.2)
                  : BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColors.primary, width: 1.4),
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
