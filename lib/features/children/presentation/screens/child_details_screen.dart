import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/permissions/user_role_policy.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../messages/presentation/screens/chat_detail_screen.dart';
import '../providers/reports_provider.dart';
import '../widgets/child_header_card.dart';
import '../widgets/session_tab.dart';
import '../widgets/session_goals_tab.dart';
import '../widgets/treatment_plan_tab.dart';
import '../widgets/overview_tab.dart';
import '../widgets/reports_tab.dart';

class ChildDetailsScreen extends ConsumerStatefulWidget {
  const ChildDetailsScreen({super.key});

  @override
  ConsumerState<ChildDetailsScreen> createState() => _ChildDetailsScreenState();
}

class _ChildDetailsScreenState extends ConsumerState<ChildDetailsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  // Tracks whether the Reports tab is currently included
  bool _reportsTabActive = false;

  @override
  void initState() {
    super.initState();
    // Start with 4 tabs; _maybeRebuildTabs() refines this after first frame
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) return;
  }

  // Called from build() to sync TabController length with actual tab count.
  void _maybeRebuildTabs(bool showReports) {
    if (showReports == _reportsTabActive) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        final prevIndex = _tabController.index;
        _tabController.removeListener(_onTabChanged);
        _tabController.dispose();
        _reportsTabActive = showReports;
        _tabController = TabController(
          length: showReports ? 5 : 4,
          initialIndex: prevIndex.clamp(0, showReports ? 4 : 3),
          vsync: this,
        );
        _tabController.addListener(_onTabChanged);
      });
    });
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
    final policy = ref.watch(currentPolicyProvider);

    final canManageSessions = policy?.canManageSessions ?? false;
    final canViewAiSuggestions = policy?.canViewAiSuggestions ?? false;
    final isSupervisor = policy?.isSupervisor ?? false;
    final isFamily = policy?.isFamily ?? false;
    final canUploadMedia = policy?.canUploadMedia ?? false;
    final canShareWithParent = policy?.canShareWithParent ?? false;

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

    // Determine whether to show the Reports tab
    bool showReportsTab = isSupervisor;
    if (isFamily) {
      final reportsState = ref.watch(reportsProvider);
      final visibleReports = reportsState
          .reportsForChild(studentName)
          .where((r) => r.isVisibleToFamily)
          .toList();
      showReportsTab = visibleReports.isNotEmpty;
    }

    // Sync TabController length without triggering a mid-build setState
    _maybeRebuildTabs(showReportsTab);

    // Build the tab label list dynamically
    final tabs = [
      l10n.overviewTab,
      l10n.treatmentPlanTab,
      l10n.sessionGoalsTab,
      l10n.sessionTab,
      if (showReportsTab) l10n.reportsTab,
    ];

    // Guard: if TabController hasn't been rebuilt yet, render with current length
    final effectiveTabs =
        tabs.length == _tabController.length ? tabs : tabs.sublist(0, _tabController.length);

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
        leading: isFamily
            ? const SizedBox.shrink()
            : IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: isDark ? Colors.white : AppColors.primary,
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
            onChatTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const ChatDetailScreen(conversationId: '1'),
              ),
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p12)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: res.scaleSpacing(AppSpacing.p16),
            ),
            child: _buildTabBar(effectiveTabs, res, isDark),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p8)),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                OverviewTab(
                  isDark: isDark,
                  res: res,
                  canViewAiSuggestions: canViewAiSuggestions,
                  isSupervisor: isSupervisor,
                  onViewTreatmentPlan: () => _tabController.animateTo(1),
                ),
                TreatmentPlanTab(
                  isDark: isDark,
                  res: res,
                  canEdit: canManageSessions,
                ),
                SessionGoalsTab(
                  isDark: isDark,
                  res: res,
                  canEdit: canManageSessions,
                ),
                SessionTab(
                  isDark: isDark,
                  res: res,
                  canManageSessions: canManageSessions,
                  canUploadMedia: canUploadMedia,
                  canShareWithParent: canShareWithParent,
                  isParent: isFamily,
                ),
                if (_reportsTabActive)
                  ReportsTab(
                    isDark: isDark,
                    res: res,
                    childId: studentName,
                    isSupervisor: isSupervisor,
                    isFamily: isFamily,
                  ),
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
