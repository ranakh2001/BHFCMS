import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/routes.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../messages/presentation/screens/chat_detail_screen.dart';

// ── Route argument key ────────────────────────────────────────────────────────

const kArgIsTherapist = 'isTherapist';

// ── Mock data ─────────────────────────────────────────────────────────────────

class _EmployeeMock {
  final String name;
  final String roleKey; // 'therapist' | 'receptionist'
  final String email;
  final String phone;
  final bool isActive;
  final int cancelledSessions;
  final int incompleteSessions;
  final int completedSessions;
  final List<_CaseData> cases;

  const _EmployeeMock({
    required this.name,
    required this.roleKey,
    required this.email,
    required this.phone,
    required this.isActive,
    this.cancelledSessions = 0,
    this.incompleteSessions = 0,
    this.completedSessions = 0,
    this.cases = const [],
  });
}

class _CaseData {
  final String name;
  final String diagnosis;
  final int avatarColorValue;

  const _CaseData({
    required this.name,
    required this.diagnosis,
    required this.avatarColorValue,
  });
}

const _therapistMock = _EmployeeMock(
  name: 'محمد سمير',
  roleKey: 'therapist',
  email: 'therapist@test.com',
  phone: '00970592698128',
  isActive: true,
  cancelledSessions: 28,
  incompleteSessions: 28,
  completedSessions: 28,
  cases: [
    _CaseData(
      name: 'محمد أحمد',
      diagnosis: 'تحسين النطق',
      avatarColorValue: 0xFF26A69A,
    ),
    _CaseData(
      name: 'سارة أحمد',
      diagnosis: 'صعوبة في النطق',
      avatarColorValue: 0xFFF06292,
    ),
  ],
);

const _receptionistMock = _EmployeeMock(
  name: 'محمد سمير',
  roleKey: 'receptionist',
  email: 'reception@test.com',
  phone: '00970592698128',
  isActive: true,
  cases: [],
);

// ── Screen ────────────────────────────────────────────────────────────────────

class SupervisorEmployeeProfileScreen extends ConsumerStatefulWidget {
  const SupervisorEmployeeProfileScreen({super.key});

  @override
  ConsumerState<SupervisorEmployeeProfileScreen> createState() =>
      _SupervisorEmployeeProfileScreenState();
}

class _SupervisorEmployeeProfileScreenState
    extends ConsumerState<SupervisorEmployeeProfileScreen> {
  bool _isActive = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Map<String, dynamic>) {
      final isTherapist = args[kArgIsTherapist] as bool? ?? true;
      _isActive = isTherapist
          ? _therapistMock.isActive
          : _receptionistMock.isActive;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final args = ModalRoute.of(context)?.settings.arguments;
    final isTherapist = args is Map<String, dynamic>
        ? (args[kArgIsTherapist] as bool? ?? true)
        : true;
    final employee = isTherapist ? _therapistMock : _receptionistMock;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // AppBar
              _AppBar(res: res, isDark: isDark, l10n: l10n),

              // Content
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: res.scaleSpacing(AppSpacing.p16),
                ),
                child: Column(
                  children: [
                    SizedBox(height: res.scaleHeight(AppSpacing.p8)),

                    // Employee info card
                    _EmployeeInfoCard(
                      res: res,
                      isDark: isDark,
                      l10n: l10n,
                      employee: employee,
                      onChatTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              const ChatDetailScreen(conversationId: 'emp_1'),
                        ),
                      ),
                    ),

                    SizedBox(height: res.scaleHeight(AppSpacing.p16)),

                    // Status toggle
                    _EmployeeStatusToggle(
                      res: res,
                      isDark: isDark,
                      l10n: l10n,
                      value: _isActive,
                      onChanged: (val) => setState(() => _isActive = val),
                    ),

                    SizedBox(height: res.scaleHeight(AppSpacing.p16)),

                    // Monthly sessions (therapist only)
                    if (isTherapist) ...[
                      _MonthlySessionsCard(
                        res: res,
                        isDark: isDark,
                        l10n: l10n,
                        employee: employee,
                      ),
                      SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                    ],

                    // Accompanied cases
                    _AccompaniedCasesSection(
                      res: res,
                      isDark: isDark,
                      l10n: l10n,
                      employee: employee,
                      isTherapist: isTherapist,
                    ),

                    SizedBox(height: res.scaleHeight(AppSpacing.p24)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── App bar ───────────────────────────────────────────────────────────────────

class _AppBar extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;

  const _AppBar({required this.res, required this.isDark, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(AppSpacing.p16),
        vertical: res.scaleHeight(AppSpacing.p12),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.primary,
                size: res.scaleWidth(24),
              ),
            ),
          ),
          Text(
            l10n.employeeFile,
            style: TextStyle(
              fontSize: res.scaleText(18),
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Employee info card ────────────────────────────────────────────────────────

class _EmployeeInfoCard extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;
  final _EmployeeMock employee;
  final VoidCallback? onChatTap;

  const _EmployeeInfoCard({
    required this.res,
    required this.isDark,
    required this.l10n,
    required this.employee,
    this.onChatTap,
  });

  String _roleLabel(AppLocalizations l10n) {
    return employee.roleKey == 'therapist'
        ? l10n.speechTherapist
        : l10n.receptionistRole;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusXl),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Accent bar
          Container(
            width: res.scaleWidth(5),
            height: res.scaleHeight(120),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(res.scaleRadius(AppSpacing.radiusXl)),
                bottomRight: Radius.circular(
                  res.scaleRadius(AppSpacing.radiusXl),
                ),
              ),
            ),
          ),

          // Avatar
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: res.scaleSpacing(AppSpacing.p16),
              vertical: res.scaleSpacing(AppSpacing.p16),
            ),
            child: _EmployeeAvatar(
              res: res,
              isTherapist: employee.roleKey == 'therapist',
            ),
          ),

          // Info
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: res.scaleSpacing(AppSpacing.p16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    employee.name,
                    style: TextStyle(
                      fontSize: res.scaleText(16),
                      fontWeight: FontWeight.w800,
                      color: isDark ? Colors.white : AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: res.scaleHeight(3)),
                  Text(
                    _roleLabel(l10n),
                    style: TextStyle(
                      fontSize: res.scaleText(12),
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                  _InfoLine(
                    res: res,
                    icon: Icons.email_outlined,
                    text: employee.email,
                  ),
                  SizedBox(height: res.scaleHeight(4)),
                  _InfoLine(
                    res: res,
                    icon: Icons.phone_outlined,
                    text: employee.phone,
                  ),
                ],
              ),
            ),
          ),

          // Chat button
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: res.scaleSpacing(AppSpacing.p12),
            ),
            child: GestureDetector(
              onTap: onChatTap,
              child: Tooltip(
                message: l10n.chatButton,
                child: Container(
                  padding: EdgeInsets.all(res.scaleSpacing(8)),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(
                      res.scaleRadius(AppSpacing.radiusMd),
                    ),
                  ),
                  child: Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: AppColors.primary,
                    size: res.scaleText(20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoLine extends StatelessWidget {
  final ResponsiveHelper res;
  final IconData icon;
  final String text;

  const _InfoLine({required this.res, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: res.scaleWidth(13), color: AppColors.textSecondary),
        SizedBox(width: res.scaleWidth(4)),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontSize: res.scaleText(11),
              color: AppColors.textSecondary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _EmployeeAvatar extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isTherapist;

  const _EmployeeAvatar({required this.res, required this.isTherapist});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: res.scaleWidth(58),
      height: res.scaleWidth(58),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(res.scaleRadius(12)),
      ),
      child: Center(
        child: Text(
          isTherapist ? '👨‍⚕️' : '🧑‍💼',
          style: TextStyle(fontSize: res.scaleText(30)),
        ),
      ),
    );
  }
}

// ── Employee status toggle ────────────────────────────────────────────────────

class _EmployeeStatusToggle extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _EmployeeStatusToggle({
    required this.res,
    required this.isDark,
    required this.l10n,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(AppSpacing.p16),
        vertical: res.scaleHeight(AppSpacing.p12),
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusXl),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            l10n.employeeStatus,
            style: TextStyle(
              fontSize: res.scaleText(15),
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

// ── Monthly sessions card ─────────────────────────────────────────────────────

class _MonthlySessionsCard extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;
  final _EmployeeMock employee;

  const _MonthlySessionsCard({
    required this.res,
    required this.isDark,
    required this.l10n,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusXl),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.monthlySessionsTitle,
            style: TextStyle(
              fontSize: res.scaleText(15),
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p16)),
          Row(
            children: [
              Expanded(
                child: _SessionStatBox(
                  res: res,
                  isDark: isDark,
                  count: employee.completedSessions,
                  label: l10n.statusCompleted,
                  color: AppColors.secondary,
                ),
              ),

              SizedBox(width: res.scaleWidth(AppSpacing.p8)),
              Expanded(
                child: _SessionStatBox(
                  res: res,
                  isDark: isDark,
                  count: employee.incompleteSessions,
                  label: l10n.incompleteSessions,
                  color: AppColors.warning,
                ),
              ),
              SizedBox(width: res.scaleWidth(AppSpacing.p8)),
              Expanded(
                child: _SessionStatBox(
                  res: res,
                  isDark: isDark,
                  count: employee.cancelledSessions,
                  label: l10n.cancelledSessions,
                  color: AppColors.supporting2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SessionStatBox extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final int count;
  final String label;
  final Color color;

  const _SessionStatBox({
    required this.res,
    required this.isDark,
    required this.count,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(AppSpacing.p8),
        vertical: res.scaleHeight(AppSpacing.p12),
      ),
      decoration: BoxDecoration(
        color: isDark
            ? color.withValues(alpha: 0.15)
            : color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusLg),
        ),
      ),
      child: Column(
        children: [
          Text(
            '$count',
            style: TextStyle(
              fontSize: res.scaleText(26),
              fontWeight: FontWeight.w800,
              color: isDark ? Colors.white : color,
            ),
          ),
          SizedBox(height: res.scaleHeight(4)),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: res.scaleText(11),
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.textSecondary : color,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Accompanied cases section ─────────────────────────────────────────────────

class _AccompaniedCasesSection extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;
  final _EmployeeMock employee;
  final bool isTherapist;

  const _AccompaniedCasesSection({
    required this.res,
    required this.isDark,
    required this.l10n,
    required this.employee,
    required this.isTherapist,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: res.scaleHeight(AppSpacing.p12),
            right: res.scaleSpacing(AppSpacing.p4),
          ),
          child: Text(
            l10n.accompaniedCases,
            style: TextStyle(
              fontSize: res.scaleText(16),
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
        ),
        if (employee.cases.isEmpty)
          _EmptyCasesState(
            res: res,
            isDark: isDark,
            l10n: l10n,
            isTherapist: isTherapist,
          )
        else
          ...employee.cases.map(
            (c) => Padding(
              padding: EdgeInsets.only(bottom: res.scaleHeight(AppSpacing.p12)),
              child: _CaseCard(res: res, isDark: isDark, l10n: l10n, data: c),
            ),
          ),
      ],
    );
  }
}

class _EmptyCasesState extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;
  final bool isTherapist;

  const _EmptyCasesState({
    required this.res,
    required this.isDark,
    required this.l10n,
    required this.isTherapist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p24)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusXl),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.folder_open_rounded,
            size: res.scaleWidth(40),
            color: AppColors.textSecondary.withValues(alpha: 0.5),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p12)),
          Text(
            isTherapist ? l10n.noConversations : l10n.noReceptionistCases,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: res.scaleText(13),
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _CaseCard extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;
  final _CaseData data;

  const _CaseCard({
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
        border: Border(right: BorderSide(color: color, width: 4)),
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
          // Avatar
          CircleAvatar(
            radius: res.scaleWidth(24),
            backgroundColor: color.withValues(alpha: 0.15),
            child: Icon(
              Icons.child_care_rounded,
              color: color,
              size: res.scaleWidth(22),
            ),
          ),
          SizedBox(width: res.scaleWidth(AppSpacing.p12)),
          // Info + button
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
                SizedBox(height: res.scaleHeight(3)),
                Text(
                  data.diagnosis,
                  style: TextStyle(
                    fontSize: res.scaleText(12),
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                SizedBox(
                  height: res.scaleHeight(32),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.childDetails,
                      arguments: {
                        'studentName': data.name,
                        'sessionType': data.diagnosis,
                        'status': l10n.filterActive,
                        'avatarColorValue': data.avatarColorValue,
                        'statusColorValue': AppColors.success.toARGB32(),
                      },
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
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
        ],
      ),
    );
  }
}
