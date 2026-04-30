import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class AddFamilyScreen extends ConsumerStatefulWidget {
  const AddFamilyScreen({super.key});

  @override
  ConsumerState<AddFamilyScreen> createState() => _AddFamilyScreenState();
}

class _AddFamilyScreenState extends ConsumerState<AddFamilyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _usernameCtrl = TextEditingController();
  final _fatherMobileCtrl = TextEditingController();
  final _motherMobileCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _searchCtrl = TextEditingController();

  bool _obscurePassword = true;
  bool _isSaving = false;
  String _searchQuery = '';

  final List<_MockChild> _allChildren = const [
    _MockChild(id: '1', name: 'ياسين محمد'),
    _MockChild(id: '2', name: 'عمر فاروق'),
    _MockChild(id: '3', name: 'فهد العتيبي'),
    _MockChild(id: '4', name: 'زيد السلطان'),
    _MockChild(id: '5', name: 'سالم المطيري'),
    _MockChild(id: '6', name: 'نواف الغامدي'),
  ];

  final Set<String> _selectedChildren = {};

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _usernameCtrl.dispose();
    _fatherMobileCtrl.dispose();
    _motherMobileCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _searchCtrl.dispose();
    super.dispose();
  }

  List<_MockChild> get _filteredChildren => _allChildren
      .where((c) =>
          _searchQuery.isEmpty ||
          c.name.toLowerCase().contains(_searchQuery.toLowerCase()))
      .toList();

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
            borderRadius: BorderRadius.circular(10)),
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
          l10n.addFamilyTitle,
          style: TextStyle(
            fontSize: res.scaleText(18),
            fontWeight: FontWeight.w700,
            color: isDark ? Colors.white : AppColors.textPrimary,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              size: res.scaleText(20),
              color: isDark ? Colors.white : AppColors.textPrimary),
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

              // ── Personal Info ──────────────────────────────────────
              _SectionHeader(
                  res: res, isDark: isDark, title: l10n.personalInfo),
              SizedBox(height: res.scaleHeight(AppSpacing.p12)),
              _FormCard(
                res: res,
                isDark: isDark,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _LabeledField(
                            res: res,
                            isDark: isDark,
                            label: l10n.firstName,
                            hint: l10n.nameHint,
                            controller: _firstNameCtrl,
                            validator: (v) =>
                                (v == null || v.isEmpty) ? l10n.fieldRequired : null,
                          ),
                        ),
                        SizedBox(width: res.scaleWidth(AppSpacing.p12)),
                        Expanded(
                          child: _LabeledField(
                            res: res,
                            isDark: isDark,
                            label: l10n.lastName,
                            hint: l10n.nameHint,
                            controller: _lastNameCtrl,
                            validator: (v) =>
                                (v == null || v.isEmpty) ? l10n.fieldRequired : null,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                    _LabeledField(
                      res: res,
                      isDark: isDark,
                      label: l10n.usernameLabel,
                      hint: l10n.usernameHint,
                      controller: _usernameCtrl,
                      validator: (v) =>
                          (v == null || v.isEmpty) ? l10n.fieldRequired : null,
                    ),
                    SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                    _LabeledField(
                      res: res,
                      isDark: isDark,
                      label: l10n.fatherMobile,
                      hint: l10n.fatherMobileHint,
                      controller: _fatherMobileCtrl,
                      keyboardType: TextInputType.phone,
                      validator: (v) =>
                          (v == null || v.isEmpty) ? l10n.fieldRequired : null,
                    ),
                    SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                    _LabeledField(
                      res: res,
                      isDark: isDark,
                      label: l10n.motherMobile,
                      hint: l10n.motherMobileHint,
                      controller: _motherMobileCtrl,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                    _LabeledField(
                      res: res,
                      isDark: isDark,
                      label: l10n.emailLabel,
                      hint: l10n.emailHint,
                      controller: _emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) =>
                          (v == null || v.isEmpty) ? l10n.fieldRequired : null,
                    ),
                    SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                    _PasswordLabeledField(
                      res: res,
                      isDark: isDark,
                      label: l10n.passwordLabel,
                      hint: l10n.passwordHint,
                      controller: _passwordCtrl,
                      obscure: _obscurePassword,
                      onToggle: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                      validator: (v) =>
                          (v == null || v.isEmpty) ? l10n.fieldRequired : null,
                    ),
                  ],
                ),
              ),

              SizedBox(height: res.scaleHeight(AppSpacing.p24)),

              // ── Assign Children ────────────────────────────────────
              _SectionHeader(
                  res: res, isDark: isDark, title: l10n.assignChildrenTitle),
              SizedBox(height: res.scaleHeight(AppSpacing.p12)),
              _FormCard(
                res: res,
                isDark: isDark,
                child: Column(
                  children: [
                    // Search field
                    _SearchField(
                      res: res,
                      isDark: isDark,
                      controller: _searchCtrl,
                      hint: l10n.searchHint,
                      onChanged: (v) => setState(() => _searchQuery = v),
                    ),
                    SizedBox(height: res.scaleHeight(AppSpacing.p12)),
                    // Children list
                    ..._filteredChildren.map((child) => _ChildCheckTile(
                          res: res,
                          isDark: isDark,
                          child: child,
                          isSelected: _selectedChildren.contains(child.id),
                          onToggle: (selected) => setState(() {
                            if (selected) {
                              _selectedChildren.add(child.id);
                            } else {
                              _selectedChildren.remove(child.id);
                            }
                          }),
                        )),
                    if (_filteredChildren.isEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: res.scaleHeight(AppSpacing.p16)),
                        child: Text(
                          l10n.searchHint,
                          style: TextStyle(
                            fontSize: res.scaleText(14),
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              SizedBox(height: res.scaleHeight(AppSpacing.p32)),
              _SaveButton(
                res: res,
                isSaving: _isSaving,
                label: l10n.saveButton,
                onTap: _save,
              ),
              SizedBox(height: res.scaleHeight(AppSpacing.p32)),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Data ──────────────────────────────────────────────────────────────────────

class _MockChild {
  final String id;
  final String name;
  const _MockChild({required this.id, required this.name});
}

// ── Shared Widgets ────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final String title;

  const _SectionHeader(
      {required this.res, required this.isDark, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: res.scaleText(16),
        fontWeight: FontWeight.w700,
        color: isDark ? Colors.white : AppColors.textPrimary,
      ),
    );
  }
}

class _FormCard extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final Widget child;

  const _FormCard(
      {required this.res, required this.isDark, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
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

class _LabeledField extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _LabeledField({
    required this.res,
    required this.isDark,
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: res.scaleText(13),
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white70 : AppColors.textPrimary)),
        SizedBox(height: res.scaleHeight(6)),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style: TextStyle(
              fontSize: res.scaleText(14),
              color: isDark ? Colors.white : AppColors.textPrimary),
          decoration: _inputDeco(res, isDark, hint),
          validator: validator,
        ),
      ],
    );
  }
}

class _PasswordLabeledField extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscure;
  final VoidCallback onToggle;
  final String? Function(String?)? validator;

  const _PasswordLabeledField({
    required this.res,
    required this.isDark,
    required this.label,
    required this.hint,
    required this.controller,
    required this.obscure,
    required this.onToggle,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: res.scaleText(13),
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white70 : AppColors.textPrimary)),
        SizedBox(height: res.scaleHeight(6)),
        TextFormField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(
              fontSize: res.scaleText(14),
              color: isDark ? Colors.white : AppColors.textPrimary),
          decoration: _inputDeco(res, isDark, hint).copyWith(
            suffixIcon: IconButton(
              icon: Icon(
                obscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.textSecondary,
                size: res.scaleText(20),
              ),
              onPressed: onToggle,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final TextEditingController controller;
  final String hint;
  final ValueChanged<String> onChanged;

  const _SearchField({
    required this.res,
    required this.isDark,
    required this.controller,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: TextStyle(
          fontSize: res.scaleText(14),
          color: isDark ? Colors.white : AppColors.textPrimary),
      decoration: _inputDeco(res, isDark, hint).copyWith(
        prefixIcon: Icon(Icons.search_rounded,
            color: AppColors.textSecondary, size: res.scaleText(20)),
      ),
    );
  }
}

class _ChildCheckTile extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final _MockChild child;
  final bool isSelected;
  final ValueChanged<bool> onToggle;

  const _ChildCheckTile({
    required this.res,
    required this.isDark,
    required this.child,
    required this.isSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onToggle(!isSelected),
      borderRadius:
          BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: res.scaleHeight(6)),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: res.scaleWidth(22),
              height: res.scaleWidth(22),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : (isDark ? Colors.grey[500]! : Colors.grey[400]!),
                  width: 2,
                ),
                borderRadius:
                    BorderRadius.circular(res.scaleRadius(AppSpacing.radiusSm)),
              ),
              child: isSelected
                  ? Icon(Icons.check_rounded,
                      color: Colors.white, size: res.scaleText(14))
                  : null,
            ),
            SizedBox(width: res.scaleWidth(AppSpacing.p12)),
            Expanded(
              child: Text(
                child.name,
                style: TextStyle(
                  fontSize: res.scaleText(14),
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white : AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
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

InputDecoration _inputDeco(ResponsiveHelper res, bool isDark, String hint) {
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
