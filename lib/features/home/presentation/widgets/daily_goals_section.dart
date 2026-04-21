import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../providers/home_provider.dart';
import 'goal_card.dart';

class DailyGoalsSection extends ConsumerWidget {
  const DailyGoalsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final completions = ref.watch(goalsProvider);

    final goalTitles = [
      'تحسين التواصل البصري',
      'تحسين التواصل البصري',
      'تحسين التواصل البصري',
    ];
    final goalSubtitle = 'محمد أحمد (${l10n.speechSession})';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(AppSpacing.p24)),
          child: Text(
            l10n.todayGoals,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : const Color(0xFF2C3E50),
                  fontSize: res.scaleText(18),
                ),
          ),
        ),
        SizedBox(height: res.scaleHeight(16)),
        ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(AppSpacing.p24)),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: goalTitles.length,
          separatorBuilder: (_, __) => SizedBox(height: res.scaleHeight(12)),
          itemBuilder: (context, index) => GoalCard(
            title: goalTitles[index],
            subtitle: goalSubtitle,
            isCompleted: completions[index],
            onToggle: () => ref.read(goalsProvider.notifier).toggle(index),
          ),
        ),
      ],
    );
  }
}
