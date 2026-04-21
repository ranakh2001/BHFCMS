import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';

class TherapistAvatar extends StatelessWidget {
  final ResponsiveHelper res;

  const TherapistAvatar({super.key, required this.res});

  @override
  Widget build(BuildContext context) {
    final size = res.scaleWidth(72);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withValues(alpha: 0.15),
            AppColors.secondary.withValues(alpha: 0.15),
          ],
        ),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.person_rounded,
          size: size * 0.55,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
