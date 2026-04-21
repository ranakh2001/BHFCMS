import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import 'session_card.dart';

class UpcomingSessionsSection extends StatelessWidget {
  const UpcomingSessionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Dummy data matching the exact layout shown in design
    final sessions = [
      {
        "type": l10n.speechSession,
        "student": "محمد أحمد",
        "room": l10n.room("4"),
        "status": l10n.statusCompleted,
        "statusColor": AppColors.success,
        "avatarColor": const Color(0xFF66BB6A), 
      },
      {
        "type": l10n.speechSession,
        "student": "محمد أحمد",
        "room": l10n.room("9"),
        "status": l10n.statusInProgress,
        "statusColor": const Color(0xFF8BC34A),
        "avatarColor": const Color(0xFF42A5F5), 
      },
      {
        "type": l10n.speechSession,
        "student": "محمد أحمد",
        "room": l10n.room("4"),
        "status": "12:00 pm", 
        "statusColor": const Color(0xFF8BC34A),
        "avatarColor": const Color(0xFFAB47BC), 
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(AppSpacing.p24)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.upcomingSessions,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF2C3E50),
                      fontSize: res.scaleText(18),
                    ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  l10n.viewAll,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: res.scaleText(14),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: res.scaleHeight(16)),
        
        // Sessions List
        ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(AppSpacing.p24)),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sessions.length,
          separatorBuilder: (context, index) => SizedBox(height: res.scaleHeight(12)),
          itemBuilder: (context, index) {
            final session = sessions[index];
            final avatarColor = session["avatarColor"] as Color;
            final statusColor = session["statusColor"] as Color;
            return SessionCard(
              sessionType: session["type"] as String,
              studentName: session["student"] as String,
              room: session["room"] as String,
              status: session["status"] as String,
              statusColor: statusColor,
              avatarColor: avatarColor,
              onTap: () => Navigator.of(context).pushNamed(
                '/child-details',
                arguments: {
                  'studentName': session["student"] as String,
                  'sessionType': session["type"] as String,
                  'room': session["room"] as String,
                  'status': session["status"] as String,
                  'avatarColorValue': avatarColor.toARGB32(),
                  'statusColorValue': statusColor.toARGB32(),
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
