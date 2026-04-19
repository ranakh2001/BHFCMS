import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextDirection? textDirection;
  final String? Function(String?)? validator;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textDirection,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : AppColors.textPrimary,
              ),
        ),
        SizedBox(height: res.scaleHeight(8)),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textAlign: TextAlign.start,
          textDirection: textDirection,
          style: TextStyle(
            color: isDark ? Colors.white : AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: res.scaleText(16),
          ),
          cursorColor: AppColors.primary,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: isDark ? Colors.grey[400] : AppColors.textSecondary.withValues(alpha: 0.7),
              fontWeight: FontWeight.w400,
              fontSize: res.scaleText(14),
            ),
            fillColor: isDark ? const Color(0xFF2C2C2C) : const Color(0xFFF3F4F6),
            filled: true,
            suffixIcon: Icon(icon, color: isDark ? Colors.grey[400] : AppColors.textSecondary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
              borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.2), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
              borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
              borderSide: const BorderSide(color: AppColors.error, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
              borderSide: const BorderSide(color: AppColors.error, width: 1.5),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: res.scaleSpacing(16),
              vertical: res.scaleHeight(16),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
