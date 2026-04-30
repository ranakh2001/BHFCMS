import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _selectedFamily;
  bool _obscureNew = true;
  bool _obscureConfirm = true;
  bool _isSaving = false;

  static const _families = [
    'عائلة محمد الأحمد',
    'عائلة فهد العتيبي',
    'عائلة عمر فاروق',
    'عائلة زيد السلطان',
    'عائلة سالم المطيري',
  ];

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);
    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    setState(() => _isSaving = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.saveSuccess),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.surfaceDark : Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          l10n.resetPasswordTitle,
          style: TextStyle(
            fontSize: res.scaleText(18),
            fontWeight: FontWeight.w700,
            color: isDark ? Colors.white : AppColors.textPrimary,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: res.scaleText(20),
            color: isDark ? Colors.white : AppColors.textPrimary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
            children: [
              SizedBox(height: res.scaleHeight(AppSpacing.p8)),
              _SectionCard(
                res: res,
                isDark: isDark,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _FieldLabel(
                        res: res,
                        isDark: isDark,
                        text: l10n.assignFamily),
                    SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                    _FamilyDropdown(
                      res: res,
                      isDark: isDark,
                      value: _selectedFamily,
                      families: _families,
                      hint: l10n.selectFamilyHint,
                      onChanged: (v) => setState(() => _selectedFamily = v),
                      validator: (_) =>
                          _selectedFamily == null ? l10n.fieldRequired : null,
                    ),
                    SizedBox(height: res.scaleHeight(AppSpacing.p20)),
                    _FieldLabel(
                        res: res,
                        isDark: isDark,
                        text: l10n.newPasswordLabel),
                    SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                    _PasswordField(
                      res: res,
                      isDark: isDark,
                      controller: _newPasswordController,
                      hint: l10n.newPasswordHint,
                      obscure: _obscureNew,
                      onToggle: () =>
                          setState(() => _obscureNew = !_obscureNew),
                      validator: (v) {
                        if (v == null || v.isEmpty) return l10n.fieldRequired;
                        if (v.length < 6) return l10n.passwordsMustMatch;
                        return null;
                      },
                    ),
                    SizedBox(height: res.scaleHeight(AppSpacing.p20)),
                    _FieldLabel(
                        res: res,
                        isDark: isDark,
                        text: l10n.confirmPasswordLabel),
                    SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                    _PasswordField(
                      res: res,
                      isDark: isDark,
                      controller: _confirmPasswordController,
                      hint: l10n.confirmPasswordHint,
                      obscure: _obscureConfirm,
                      onToggle: () =>
                          setState(() => _obscureConfirm = !_obscureConfirm),
                      validator: (v) {
                        if (v == null || v.isEmpty) return l10n.fieldRequired;
                        if (v != _newPasswordController.text) {
                          return l10n.passwordsMustMatch;
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: res.scaleHeight(AppSpacing.p32)),
              _SaveButton(
                  res: res, isSaving: _isSaving, label: l10n.saveButton, onTap: _save),
              SizedBox(height: res.scaleHeight(AppSpacing.p32)),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Shared Widgets ────────────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final Widget child;

  const _SectionCard(
      {required this.res, required this.isDark, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p20)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius:
            BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final String text;

  const _FieldLabel(
      {required this.res, required this.isDark, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: res.scaleText(14),
        fontWeight: FontWeight.w600,
        color: isDark ? Colors.white70 : AppColors.textPrimary,
      ),
    );
  }
}

class _FamilyDropdown extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final String? value;
  final List<String> families;
  final String hint;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const _FamilyDropdown({
    required this.res,
    required this.isDark,
    required this.value,
    required this.families,
    required this.hint,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: _inputDecoration(res, isDark, hint),
      hint: Text(hint,
          style: TextStyle(
              fontSize: res.scaleText(14), color: AppColors.textSecondary)),
      items: families
          .map((f) => DropdownMenuItem(
              value: f,
              child: Text(f,
                  style: TextStyle(
                      fontSize: res.scaleText(14),
                      color: isDark ? Colors.white : AppColors.textPrimary))))
          .toList(),
      onChanged: onChanged,
      validator: validator,
      dropdownColor: isDark ? AppColors.surfaceDark : Colors.white,
      icon: Icon(Icons.keyboard_arrow_down_rounded,
          color: AppColors.textSecondary, size: res.scaleText(20)),
    );
  }
}

class _PasswordField extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final VoidCallback onToggle;
  final String? Function(String?)? validator;

  const _PasswordField({
    required this.res,
    required this.isDark,
    required this.controller,
    required this.hint,
    required this.obscure,
    required this.onToggle,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      style: TextStyle(
          fontSize: res.scaleText(14),
          color: isDark ? Colors.white : AppColors.textPrimary),
      decoration: _inputDecoration(res, isDark, hint).copyWith(
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: AppColors.textSecondary,
            size: res.scaleText(20),
          ),
          onPressed: onToggle,
        ),
      ),
      validator: validator,
    );
  }
}

class _SaveButton extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isSaving;
  final String label;
  final VoidCallback onTap;

  const _SaveButton(
      {required this.res,
      required this.isSaving,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: res.scaleHeight(52),
      child: ElevatedButton(
        onPressed: isSaving ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.6),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
          ),
          elevation: 2,
        ),
        child: isSaving
            ? SizedBox(
                width: res.scaleWidth(22),
                height: res.scaleWidth(22),
                child: const CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 2.5),
              )
            : Text(
                label,
                style: TextStyle(
                  fontSize: res.scaleText(16),
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}

InputDecoration _inputDecoration(
    ResponsiveHelper res, bool isDark, String hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle:
        TextStyle(fontSize: res.scaleText(14), color: AppColors.textSecondary),
    filled: true,
    fillColor: isDark ? const Color(0xFF2A2A2A) : const Color(0xFFF5F7FA),
    contentPadding: EdgeInsets.symmetric(
      horizontal: res.scaleSpacing(AppSpacing.p16),
      vertical: res.scaleHeight(AppSpacing.p12),
    ),
    border: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
      borderSide: BorderSide(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
      borderSide: const BorderSide(color: AppColors.error, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
      borderSide: const BorderSide(color: AppColors.error, width: 1.5),
    ),
  );
}
