import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../widgets/child_header_card.dart';
import '../widgets/session_tab.dart';
import '../widgets/session_goals_tab.dart';
import '../widgets/treatment_plan_tab.dart';
import '../widgets/overview_tab.dart';
import '../widgets/session_notes_bottom_sheet.dart';

class ChildDetailsScreen extends StatefulWidget {
  const ChildDetailsScreen({super.key});

  @override
  State<ChildDetailsScreen> createState() => _ChildDetailsScreenState();
}

class _ChildDetailsScreenState extends State<ChildDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Tab order: Overview=0, TreatmentPlan=1, SessionGoals=2, Session=3
  static const int _sessionGoalsIndex = 2;
  bool _notesShownForCurrentVisit = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) return;
    if (_tabController.index != _sessionGoalsIndex) return;
    // _notesShownForCurrentVisit = false;
    // if (!_notesShownForCurrentVisit) {
    //   _notesShownForCurrentVisit = true;
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     if (mounted) SessionNotesBottomSheet.show(context);
    //   });
    // }
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
        {};
    final studentName = args['studentName'] as String? ?? 'سارة أحمد';
    final sessionType = args['sessionType'] as String? ?? 'صعوبة في النطق';
    final status = args['status'] as String? ?? l10n.activeStatus;
    final avatarColorValue = args['avatarColorValue'] as int? ?? 0xFF26A69A;
    final statusColorValue =
        args['statusColorValue'] as int? ?? AppColors.success.toARGB32();

    final avatarColor = Color(avatarColorValue);
    final statusColor = Color(statusColorValue);

    final nameParts = studentName.split(' ');
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final familyName = nameParts.length > 1
        ? '${isArabic ? 'عائلة' : 'Family of'} ${nameParts.last}'
        : studentName;

    // Tab order: Overview → Treatment Plan → Goals → Session
    final tabs = [
      l10n.overviewTab,
      l10n.treatmentPlanTab,
      l10n.sessionGoalsTab,
      l10n.sessionTab,
    ];

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: isDark
            ? AppColors.backgroundDark
            : AppColors.backgroundLight,
        elevation: 0,
        centerTitle: true,
        title: Text(
          l10n.childFile,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : AppColors.primary,
            fontSize: res.scaleText(18),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: isDark ? Colors.white : AppColors.textPrimary,
            size: res.scaleText(20),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: res.scaleHeight(AppSpacing.p8)),
          ChildHeaderCard(
            name: studentName,
            familyName: familyName,
            condition: sessionType,
            status: status,
            avatarColor: avatarColor,
            statusColor: statusColor,
            isDark: isDark,
            res: res,
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p12)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: res.scaleSpacing(AppSpacing.p16),
            ),
            child: _buildTabBar(tabs, res, isDark),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p8)),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                OverviewTab(isDark: isDark, res: res),
                TreatmentPlanTab(isDark: isDark, res: res),
                SessionGoalsTab(isDark: isDark, res: res),
                SessionTab(isDark: isDark, res: res),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(List<String> tabs, ResponsiveHelper res, bool isDark) {
    return AnimatedBuilder(
      animation: _tabController,
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : Colors.white,
            borderRadius: BorderRadius.circular(
              res.scaleRadius(AppSpacing.radiusXl),
            ),
            border: Border.all(
              color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
            ),
          ),
          child: Row(
            children: List.generate(tabs.length, (i) {
              final selected = _tabController.index == i;
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _tabController.animateTo(i)),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    margin: EdgeInsets.all(res.scaleSpacing(3)),
                    padding: EdgeInsets.symmetric(
                      vertical: res.scaleHeight(8),
                      horizontal: res.scaleSpacing(4),
                    ),
                    decoration: BoxDecoration(
                      color: selected ? AppColors.primary : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        res.scaleRadius(AppSpacing.radiusLg),
                      ),
                      boxShadow: selected
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.3),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : [],
                    ),
                    child: Text(
                      tabs[i],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: res.scaleText(11),
                        fontWeight: selected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: selected
                            ? Colors.white
                            : (isDark
                                  ? Colors.white60
                                  : AppColors.textSecondary),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
