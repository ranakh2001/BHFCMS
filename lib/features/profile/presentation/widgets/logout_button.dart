import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';

class LogoutButton extends StatelessWidget {
  final ResponsiveHelper res;
  final AppLocalizations l10n;
  final VoidCallback onLogout;

  const LogoutButton({
    super.key,
    required this.res,
    required this.l10n,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: res.scaleHeight(52),
      child: ElevatedButton(
        onPressed: onLogout,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.supporting2.withValues(alpha: 0.18),
          foregroundColor: AppColors.supporting2,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(res.scaleRadius(16)),
          ),
        ),
        child: Text(
          l10n.logout,
          style: TextStyle(
            fontSize: res.scaleText(16),
            fontWeight: FontWeight.w700,
            color: AppColors.supporting2,
          ),
        ),
      ),
    );
  }
}
