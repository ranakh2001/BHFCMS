import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';

class LoginInfoRow extends StatelessWidget {
  const LoginInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.info_outline,
          color: AppColors.primary,
          size: res.scaleText(20),
        ),
        SizedBox(width: res.scaleWidth(8)),
        Expanded(
          child: Text(
            l10n.adminAccountNote,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isDark ? Colors.grey[400] : AppColors.textSecondary,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
