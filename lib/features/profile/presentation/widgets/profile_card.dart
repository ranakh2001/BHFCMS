import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../auth/domain/entities/user_role.dart';
import 'therapist_avatar.dart';

class ProfileCard extends StatelessWidget {
  final ResponsiveHelper res;
  final AppLocalizations l10n;
  final bool isDark;
  final User user;

  const ProfileCard({
    super.key,
    required this.res,
    required this.l10n,
    required this.isDark,
    required this.user,
  });

  String _roleLabel() {
    switch (user.role) {
      case UserRole.therapist:
        return l10n.speechTherapist;
      case UserRole.parent:
        return l10n.parentRole;
      case UserRole.receptionist:
        return l10n.receptionistRole;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(res.scaleRadius(18)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // ── Accent bar ──────────────────────────────────────────
          Container(
            width: res.scaleWidth(5),
            height: res.scaleHeight(110),
            decoration: const BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
          ),

          // ── Avatar ──────────────────────────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: res.scaleSpacing(14),
              vertical: res.scaleSpacing(16),
            ),
            child: TherapistAvatar(res: res),
          ),

          // ── Name / role / center ─────────────────────────────────
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: res.scaleSpacing(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: res.scaleText(16),
                      fontWeight: FontWeight.w800,
                      color: isDark ? Colors.white : AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: res.scaleHeight(4)),
                  Text(
                    _roleLabel(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: res.scaleText(12),
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: res.scaleHeight(8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        l10n.centerName,
                        style: TextStyle(
                          fontSize: res.scaleText(11),
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: res.scaleSpacing(4)),
                      Icon(
                        Icons.business_rounded,
                        size: res.scaleWidth(14),
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: res.scaleSpacing(4)),
        ],
      ),
    );
  }
}
