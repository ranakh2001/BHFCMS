import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/routes.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import 'supervisor_employee_profile_screen.dart';

class SupervisorCenterScreen extends ConsumerStatefulWidget {
  const SupervisorCenterScreen({super.key});

  @override
  ConsumerState<SupervisorCenterScreen> createState() =>
      _SupervisorCenterScreenState();
}

class _SupervisorCenterScreenState
    extends ConsumerState<SupervisorCenterScreen> {
  bool _showBeneficiaries = true;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final user = ref.watch(currentUserProvider);
    final centerName = user?.name != null
        ? AppLocalizations.of(context)!.centerName
        : AppLocalizations.of(context)!.centerName;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: res.scaleHeight(AppSpacing.p20)),

            // ── Title ──────────────────────────────────────────────
            Text(
              centerName,
              style: TextStyle(
                fontSize: res.scaleText(18),
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),

            SizedBox(height: res.scaleHeight(AppSpacing.p20)),

            // ── Toggle Tabs ────────────────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: res.scaleSpacing(AppSpacing.p16),
              ),
              child: _ToggleTabs(
                res: res,
                isDark: isDark,
                showBeneficiaries: _showBeneficiaries,
                beneficiariesLabel: l10n.beneficiariesTab,
                employeesLabel: l10n.employeesTab,
                onToggle: (val) => setState(() {
                  _showBeneficiaries = val;
                  _searchQuery = '';
                  _searchController.clear();
                }),
              ),
            ),

            SizedBox(height: res.scaleHeight(AppSpacing.p16)),

            // ── Content ────────────────────────────────────────────
            Expanded(
              child: _showBeneficiaries
                  ? _BeneficiariesTab(
                      res: res,
                      isDark: isDark,
                      l10n: l10n,
                      searchController: _searchController,
                      searchQuery: _searchQuery,
                      onSearchChanged: (q) => setState(() => _searchQuery = q),
                    )
                  : _EmployeesTab(res: res, isDark: isDark, l10n: l10n),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Toggle Tabs ───────────────────────────────────────────────────────────────

class _ToggleTabs extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final bool showBeneficiaries;
  final String beneficiariesLabel;
  final String employeesLabel;
  final ValueChanged<bool> onToggle;

  const _ToggleTabs({
    required this.res,
    required this.isDark,
    required this.showBeneficiaries,
    required this.beneficiariesLabel,
    required this.employeesLabel,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _TabButton(
            label: beneficiariesLabel,
            isSelected: showBeneficiaries,
            res: res,
            onTap: () => onToggle(true),
          ),
        ),
        SizedBox(width: res.scaleWidth(AppSpacing.p8)),
        Expanded(
          child: _TabButton(
            label: employeesLabel,
            isSelected: !showBeneficiaries,
            res: res,
            onTap: () => onToggle(false),
          ),
        ),
      ],
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ResponsiveHelper res;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.res,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: res.scaleHeight(10)),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(
            res.scaleRadius(AppSpacing.radiusXxl),
          ),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: res.scaleText(14),
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

// ── Beneficiaries Tab ─────────────────────────────────────────────────────────

class _BeneficiaryData {
  final String name;
  final String sessionType;
  final double progress;
  final int avatarColorValue;
  final bool isActive;

  const _BeneficiaryData({
    required this.name,
    required this.sessionType,
    required this.progress,
    required this.avatarColorValue,
    required this.isActive,
  });
}

const _mockBeneficiaries = [
  _BeneficiaryData(
    name: 'محمد أحمد',
    sessionType: 'تحسين النطق',
    progress: 0.75,
    avatarColorValue: 0xFF26A69A,
    isActive: true,
  ),
  _BeneficiaryData(
    name: 'سارة محمود',
    sessionType: 'جلسة تخاطب',
    progress: 0.60,
    avatarColorValue: 0xFFF06292,
    isActive: true,
  ),
  _BeneficiaryData(
    name: 'يوسف علي',
    sessionType: 'تحسين النطق',
    progress: 0.40,
    avatarColorValue: 0xFF42A5F5,
    isActive: true,
  ),
  _BeneficiaryData(
    name: 'عمر خالد',
    sessionType: 'جلسة تخاطب',
    progress: 0.95,
    avatarColorValue: 0xFF7E57C2,
    isActive: false,
  ),
  _BeneficiaryData(
    name: 'نور حسن',
    sessionType: 'تحسين النطق',
    progress: 0.88,
    avatarColorValue: 0xFFFF7043,
    isActive: false,
  ),
];

class _BeneficiariesTab extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;
  final TextEditingController searchController;
  final String searchQuery;
  final ValueChanged<String> onSearchChanged;

  const _BeneficiariesTab({
    required this.res,
    required this.isDark,
    required this.l10n,
    required this.searchController,
    required this.searchQuery,
    required this.onSearchChanged,
  });

  List<_BeneficiaryData> get _filtered => _mockBeneficiaries.where((b) {
        return searchQuery.isEmpty ||
            b.name.contains(searchQuery) ||
            b.sessionType.contains(searchQuery);
      }).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: res.scaleSpacing(AppSpacing.p16),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: isDark ? AppColors.surfaceDark : Colors.white,
              borderRadius: BorderRadius.circular(
                res.scaleRadius(AppSpacing.radiusXxl),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: searchController,
              onChanged: onSearchChanged,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: res.scaleText(13),
                color: isDark ? Colors.white : AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: l10n.searchBeneficiary,
                hintStyle: TextStyle(
                  fontSize: res.scaleText(13),
                  color: AppColors.textSecondary,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: res.scaleSpacing(AppSpacing.p16),
                  vertical: res.scaleHeight(AppSpacing.p12),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: res.scaleHeight(AppSpacing.p12)),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: res.scaleSpacing(AppSpacing.p16),
            ),
            itemCount: _filtered.length,
            separatorBuilder: (_, __) =>
                SizedBox(height: res.scaleHeight(AppSpacing.p12)),
            itemBuilder: (context, index) {
              final b = _filtered[index];
              return _BeneficiaryCard(
                res: res,
                isDark: isDark,
                l10n: l10n,
                data: b,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _BeneficiaryCard extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;
  final _BeneficiaryData data;

  const _BeneficiaryCard({
    required this.res,
    required this.isDark,
    required this.l10n,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final color = Color(data.avatarColorValue);
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        AppRoutes.childDetails,
        arguments: {
          'studentName': data.name,
          'sessionType': data.sessionType,
          'status': data.isActive ? l10n.filterActive : l10n.filterCompleted,
          'avatarColorValue': data.avatarColorValue,
          'statusColorValue': data.isActive
              ? AppColors.success.toARGB32()
              : AppColors.textSecondary.toARGB32(),
        },
      ),
      child: Container(
        padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p12)),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : Colors.white,
          borderRadius: BorderRadius.circular(
            res.scaleRadius(AppSpacing.radiusXl),
          ),
          border: Border(
            right: BorderSide(color: color, width: 4),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: res.scaleWidth(22),
              backgroundColor: color.withValues(alpha: 0.15),
              child: Icon(
                Icons.child_care_rounded,
                color: color,
                size: res.scaleWidth(22),
              ),
            ),
            SizedBox(width: res.scaleWidth(AppSpacing.p12)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: TextStyle(
                      fontSize: res.scaleText(14),
                      fontWeight: FontWeight.w700,
                      color: isDark ? Colors.white : AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: res.scaleHeight(4)),
                  Text(
                    data.sessionType,
                    style: TextStyle(
                      fontSize: res.scaleText(12),
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: res.scaleHeight(6)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(res.scaleRadius(4)),
                    child: LinearProgressIndicator(
                      value: data.progress,
                      minHeight: res.scaleHeight(4),
                      backgroundColor: color.withValues(alpha: 0.15),
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: res.scaleWidth(AppSpacing.p8)),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: res.scaleSpacing(6),
                vertical: res.scaleHeight(4),
              ),
              decoration: BoxDecoration(
                color: data.isActive
                    ? AppColors.success.withValues(alpha: 0.1)
                    : AppColors.textSecondary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(
                  res.scaleRadius(AppSpacing.radiusLg),
                ),
              ),
              child: Text(
                data.isActive ? l10n.filterActive : l10n.filterCompleted,
                style: TextStyle(
                  fontSize: res.scaleText(10),
                  fontWeight: FontWeight.w600,
                  color:
                      data.isActive ? AppColors.success : AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Employees Tab ─────────────────────────────────────────────────────────────

class _EmployeeData {
  final String name;
  final String role;
  final int avatarColorValue;
  final bool isTherapist;

  const _EmployeeData({
    required this.name,
    required this.role,
    required this.avatarColorValue,
    this.isTherapist = true,
  });
}

const _mockEmployees = [
  _EmployeeData(
    name: 'احمد محمد',
    role: 'اخصائي نطق',
    avatarColorValue: 0xFF5C6BC0,
  ),
  _EmployeeData(
    name: 'سارة الأحمد',
    role: 'اخصائي نطق',
    avatarColorValue: 0xFFF06292,
  ),
  _EmployeeData(
    name: 'خالد إبراهيم',
    role: 'اخصائي نطق',
    avatarColorValue: 0xFF26A69A,
  ),
  _EmployeeData(
    name: 'نور حسن',
    role: 'موظف استقبال',
    avatarColorValue: 0xFFFFA726,
    isTherapist: false,
  ),
];

class _EmployeesTab extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;

  const _EmployeesTab({
    required this.res,
    required this.isDark,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(AppSpacing.p16),
      ),
      itemCount: _mockEmployees.length,
      separatorBuilder: (_, __) =>
          SizedBox(height: res.scaleHeight(AppSpacing.p12)),
      itemBuilder: (context, index) {
        final emp = _mockEmployees[index];
        return _EmployeeCard(
          res: res,
          isDark: isDark,
          l10n: l10n,
          data: emp,
        );
      },
    );
  }
}

class _EmployeeCard extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;
  final _EmployeeData data;

  const _EmployeeCard({
    required this.res,
    required this.isDark,
    required this.l10n,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final color = Color(data.avatarColorValue);
    return Container(
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p12)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusXl),
        ),
        border: const Border(
          right: BorderSide(color: AppColors.primary, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: TextStyle(
                    fontSize: res.scaleText(14),
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: res.scaleHeight(4)),
                Text(
                  data.role,
                  style: TextStyle(
                    fontSize: res.scaleText(12),
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                SizedBox(
                  height: res.scaleHeight(32),
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.supervisorEmployeeProfile,
                      arguments: {kArgIsTherapist: data.isTherapist},
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      padding: EdgeInsets.symmetric(
                        horizontal: res.scaleSpacing(AppSpacing.p12),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          res.scaleRadius(AppSpacing.radiusXxl),
                        ),
                      ),
                    ),
                    child: Text(
                      l10n.viewDetails,
                      style: TextStyle(
                        fontSize: res.scaleText(12),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: res.scaleWidth(AppSpacing.p12)),
          // Avatar
          CircleAvatar(
            radius: res.scaleWidth(28),
            backgroundColor: color.withValues(alpha: 0.15),
            child: Icon(
              Icons.people_outline_rounded,
              color: color,
              size: res.scaleWidth(28),
            ),
          ),
        ],
      ),
    );
  }
}
