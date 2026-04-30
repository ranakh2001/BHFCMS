import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../models/conversation.dart';
import 'guardian_avatar.dart';

class ConversationListItem extends StatelessWidget {
  final Conversation conversation;
  final VoidCallback onTap;
  final bool showTherapistLabel;

  const ConversationListItem({
    super.key,
    required this.conversation,
    required this.onTap,
    this.showTherapistLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasUnread = conversation.unreadCount > 0;
    final lastMsg = conversation.lastMessage;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: hasUnread
            ? AppColors.primary.withValues(alpha: 0.07)
            : Colors.transparent,
        padding: EdgeInsets.symmetric(
          horizontal: res.scaleSpacing(16),
          vertical: res.scaleSpacing(12),
        ),
        child: Row(
          children: [
            GuardianAvatar(size: res.scaleWidth(48)),
            SizedBox(width: res.scaleSpacing(12)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        conversation.guardianName,
                        style: TextStyle(
                          fontSize: res.scaleText(14),
                          fontWeight: FontWeight.w700,
                          color: isDark ? Colors.white : AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(width: res.scaleSpacing(4)),
                      Text(
                        showTherapistLabel
                            ? '(${l10n.therapistOf(conversation.childName)})'
                            : '(${l10n.guardianOf(conversation.childName)})',
                        style: TextStyle(
                          fontSize: res.scaleText(12),
                          color: isDark
                              ? AppColors.textSecondary
                              : AppColors.textSecondary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: res.scaleHeight(4)),
                  if (lastMsg != null)
                    Text(
                      lastMsg.text,
                      style: TextStyle(
                        fontSize: res.scaleText(12),
                        color: isDark
                            ? AppColors.textSecondary
                            : AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    ),
                ],
              ),
            ),

            if (hasUnread)
              Container(
                width: res.scaleWidth(24),
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: res.scaleSpacing(4)),
                child: Container(
                  width: res.scaleWidth(20),
                  height: res.scaleWidth(20),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${conversation.unreadCount}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: res.scaleText(10),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            else
              SizedBox(width: res.scaleWidth(28)),
            SizedBox(width: res.scaleSpacing(8)),
          ],
        ),
      ),
    );
  }
}
