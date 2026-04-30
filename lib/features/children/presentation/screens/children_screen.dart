import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/domain/entities/user_role.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../../config/routes.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../widgets/child_card.dart';
import '../widgets/receptionist_child_row.dart';

class _ChildData {
  final String name;
  final String sessionType;
  final double progress;
  final int avatarColorValue;
  final bool isActive;

  const _ChildData({
    required this.name,
    required this.sessionType,
    required this.progress,
    required this.avatarColorValue,
    required this.isActive,
  });
}

const List<_ChildData> _mockChildren = [
  _ChildData(
    name: 'محمد أحمد',
    sessionType: 'تحسين النطق',
    progress: 0.75,
    avatarColorValue: 0xFF26A69A,
    isActive: true,
  ),
  _ChildData(
    name: 'سارة محمود',
    sessionType: 'جلسة تخاطب',
    progress: 0.60,
    avatarColorValue: 0xFFF06292,
    isActive: true,
  ),
  _ChildData(
    name: 'يوسف علي',
    sessionType: 'تحسين النطق',
    progress: 0.40,
    avatarColorValue: 0xFF42A5F5,
    isActive: true,
  ),
  _ChildData(
    name: 'عمر خالد',
    sessionType: 'جلسة تخاطب',
    progress: 0.95,
    avatarColorValue: 0xFF7E57C2,
    isActive: false,
  ),
  _ChildData(
    name: 'نور حسن',
    sessionType: 'تحسين النطق',
    progress: 0.88,
    avatarColorValue: 0xFFFF7043,
    isActive: false,
  ),
];

class ChildrenScreen extends ConsumerStatefulWidget {
  const ChildrenScreen({super.key});

  @override
  ConsumerState<ChildrenScreen> createState() => _ChildrenScreenState();
}

class _ChildrenScreenState extends ConsumerState<ChildrenScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _showActive = true;
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<_ChildData> get _filteredChildren {
    return _mockChildren.where((child) {
      final matchesFilter = child.isActive == _showActive;
      final matchesSearch = _searchQuery.isEmpty ||
          child.name.contains(_searchQuery) ||
          child.sessionType.contains(_searchQuery);
      return matchesFilter && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final user = ref.watch(currentUserProvider);
    final isReceptionist = user?.role == UserRole.receptionist;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor:
            isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          l10n.beneficiaries,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                fontSize: res.scaleText(18),
              ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: EdgeInsets.fromLTRB(
                res.scaleSpacing(AppSpacing.p16),
                res.scaleHeight(16),
                res.scaleSpacing(AppSpacing.p16),
                0,
              ),
              child: Container(
                height: res.scaleHeight(50),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.surfaceDark : Colors.white,
                  borderRadius: BorderRadius.circular(
                    res.scaleRadius(AppSpacing.radiusXxl),
                  ),
                  border: Border.all(
                    color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: isDark ? 0.2 : 0.04,
                      ),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) => setState(() => _searchQuery = value),
                  style: TextStyle(
                    fontSize: res.scaleText(14),
                    color: isDark ? Colors.white : AppColors.textPrimary,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: l10n.searchBeneficiary,
                    hintStyle: TextStyle(
                      fontSize: res.scaleText(14),
                      color: AppColors.textSecondary,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      size: res.scaleText(20),
                      color: AppColors.textSecondary,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: res.scaleHeight(14),
                    ),
                  ),
                ),
              ),
            ),

            // Filter tabs
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: res.scaleSpacing(AppSpacing.p16),
                vertical: res.scaleHeight(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _FilterTab(
                      label: l10n.filterActive,
                      isSelected: _showActive,
                      onTap: () => setState(() => _showActive = true),
                      res: res,
                      isDark: isDark,
                    ),
                  ),
                  SizedBox(width: res.scaleWidth(12)),
                  Expanded(
                    child: _FilterTab(
                      label: l10n.filterCompleted,
                      isSelected: !_showActive,
                      onTap: () => setState(() => _showActive = false),
                      res: res,
                      isDark: isDark,
                    ),
                  ),
                ],
              ),
            ),

            // Children list
            Expanded(
              child: _filteredChildren.isEmpty
                  ? _EmptyState(res: res, isDark: isDark)
                  : ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        res.scaleSpacing(AppSpacing.p16),
                        0,
                        res.scaleSpacing(AppSpacing.p16),
                        res.scaleHeight(80),
                      ),
                      itemCount: _filteredChildren.length,
                      separatorBuilder: (_, __) =>
                          SizedBox(height: res.scaleHeight(12)),
                      itemBuilder: (context, index) {
                        final child = _filteredChildren[index];
                        if (isReceptionist) {
                          return ReceptionistChildRow(
                            name: child.name,
                            isActive: child.isActive,
                            reports: [
                              '${l10n.report} 1',
                              '${l10n.report} 2',
                              '${l10n.report} 3'
                            ],
                          );
                        }
                        return ChildCard(
                          name: child.name,
                          sessionType: child.sessionType,
                          progress: child.progress,
                          avatarColorValue: child.avatarColorValue,
                          onViewDetails: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.childDetails,
                              arguments: {
                                'studentName': child.name,
                                'sessionType': child.sessionType,
                                'room': '3',
                                'status': _showActive
                                    ? l10n.statusInProgress
                                    : l10n.statusCompleted,
                                'avatarColorValue': child.avatarColorValue,
                                'statusColorValue': _showActive
                                    ? AppColors.info.toARGB32()
                                    : AppColors.success.toARGB32(),
                              },
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final ResponsiveHelper res;
  final bool isDark;

  const _FilterTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.res,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: res.scaleHeight(42),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : (isDark ? AppColors.surfaceDark : Colors.white),
          borderRadius:
              BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : (isDark ? Colors.grey[700]! : Colors.grey[300]!),
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: res.scaleText(14),
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? Colors.white
                  : (isDark ? Colors.white70 : AppColors.textSecondary),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;

  const _EmptyState({required this.res, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.child_care_rounded,
            size: res.scaleText(64),
            color: isDark ? Colors.grey[600] : Colors.grey[300],
          ),
          SizedBox(height: res.scaleHeight(16)),
          Text(
            'لا توجد نتائج',
            style: TextStyle(
              fontSize: res.scaleText(15),
              color: isDark ? Colors.white54 : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
