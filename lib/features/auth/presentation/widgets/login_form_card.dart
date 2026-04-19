import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/app_validators.dart';
import '../../../../core/utils/responsive_helper.dart';
import 'login_text_field.dart';
import 'primary_login_button.dart';

class LoginFormCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onLogin;

  const LoginFormCard({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.isLoading,
    this.errorMessage,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p24)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
        border: Border.all(
          color: isDark ? Colors.grey.withValues(alpha: 0.2) : Colors.grey.withValues(alpha: 0.15),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (errorMessage != null) ...[
              Container(
                padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p12)),
                margin: EdgeInsets.only(bottom: res.scaleSpacing(AppSpacing.p16)),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
                  border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.error_outline, color: AppColors.error, size: res.scaleText(20)),
                    SizedBox(width: res.scaleWidth(8)),
                    Expanded(
                      child: Text(
                        errorMessage!,
                        style: TextStyle(
                          color: AppColors.error,
                          fontSize: res.scaleText(13),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            
            LoginTextField(
              controller: emailController,
              label: l10n.emailLabel,
              hintText: l10n.emailHint,
              icon: CupertinoIcons.envelope,
              keyboardType: TextInputType.emailAddress,
              textDirection: TextDirection.ltr,
              validator: (value) => AppValidators.validateEmail(value, l10n),
            ),
            SizedBox(height: res.scaleHeight(AppSpacing.p20)),
            
            LoginTextField(
              controller: passwordController,
              label: l10n.passwordLabel,
              hintText: l10n.passwordHint,
              icon: CupertinoIcons.lock,
              obscureText: true,
              textDirection: TextDirection.ltr,
              validator: (value) => AppValidators.validatePassword(value, l10n),
            ),
            SizedBox(height: res.scaleHeight(AppSpacing.p32)),

            PrimaryLoginButton(
              onPressed: onLogin,
              isLoading: isLoading,
              text: l10n.loginButton,
            ),
          ],
        ),
      ),
    );
  }
}
