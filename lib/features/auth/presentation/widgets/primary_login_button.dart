import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class PrimaryLoginButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String text;

  const PrimaryLoginButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);

    return SizedBox(
      width: double.infinity,
      height: res.scaleHeight(50),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                height: res.scaleHeight(24),
                width: res.scaleHeight(24),
                child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: res.scaleText(16),
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
