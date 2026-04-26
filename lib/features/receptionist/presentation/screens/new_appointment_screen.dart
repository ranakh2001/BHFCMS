import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';

class NewAppointmentScreen extends ConsumerStatefulWidget {
  const NewAppointmentScreen({super.key});

  @override
  ConsumerState<NewAppointmentScreen> createState() =>
      _NewAppointmentScreenState();
}

class _NewAppointmentScreenState
    extends ConsumerState<NewAppointmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _searchCtrl = TextEditingController();

  String? _selectedChildId;
  String? _selectedTherapist;
  String? _selectedAppointmentType;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _isSaving = false;
  String _searchQuery = '';

  static const _children = [
    _MockItem(id: '1', label: 'ياسين محمد'),
    _MockItem(id: '2', label: 'عمر فاروق'),
    _MockItem(id: '3', label: 'فهد العتيبي'),
    _MockItem(id: '4', label: 'زيد السلطان'),
    _MockItem(id: '5', label: 'سالم المطيري'),
    _MockItem(id: '6', label: 'نواف الغامدي'),
  ];

  static const _therapists = [
    'د. أحمد العمري',
    'د. سارة الغامدي',
    'د. منى الشهري',
    'د. خالد العتيبي',
  ];

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  List<_MockItem> get _filteredChildren => _children
      .where((c) =>
          _searchQuery.isEmpty ||
          c.label.toLowerCase().contains(_searchQuery.toLowerCase()))
      .toList();

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: AppColors.primary),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? const TimeOfDay(hour: 9, minute: 0),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: AppColors.primary),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _selectedTime = picked);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedDate == null || _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              AppLocalizations.of(context)!.fieldRequired),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      return;
    }
    setState(() => _isSaving = true);
    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    setState(() => _isSaving = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.saveSuccess),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
    Navigator.of(context).pop();
  }

  String _formatDate(DateTime dt) {
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
  }

  String _formatTime(TimeOfDay t, BuildContext context) {
    return t.format(context);
  }

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final appointmentTypes = [
      l10n.appointmentTypeSession,
      l10n.appointmentTypeAssessment,
      l10n.appointmentTypeFollowUp,
    ];

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.surfaceDark : Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          l10n.newAppointmentTitle,
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

              // ── Select Child ─────────────────────────────────────────
              _FormCard(
                res: res,
                isDark: isDark,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _FieldLabel(
                        res: res, isDark: isDark, text: l10n.selectChildLabel),
                    SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                    _SearchField(
                      res: res,
                      isDark: isDark,
                      controller: _searchCtrl,
                      hint: l10n.searchHint,
                      onChanged: (v) => setState(() => _searchQuery = v),
                    ),
                    SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                    ..._filteredChildren.map((child) => _ChildSelectTile(
                          res: res,
                          isDark: isDark,
                          item: child,
                          isSelected: _selectedChildId == child.id,
                          onTap: () =>
                              setState(() => _selectedChildId = child.id),
                        )),
                    if (_selectedChildId == null)
                      FormField<String>(
                        validator: (_) => l10n.fieldRequired,
                        builder: (state) => state.hasError
                            ? Padding(
                                padding: EdgeInsets.only(
                                    top: res.scaleHeight(4)),
                                child: Text(state.errorText!,
                                    style: TextStyle(
                                        fontSize: res.scaleText(12),
                                        color: AppColors.error)),
                              )
                            : const SizedBox.shrink(),
                      ),
                  ],
                ),
              ),

              SizedBox(height: res.scaleHeight(AppSpacing.p16)),

              // ── Therapist + Type ──────────────────────────────────────
              _FormCard(
                res: res,
                isDark: isDark,
                child: Column(
                  children: [
                    _DropdownLabeledField<String>(
                      res: res,
                      isDark: isDark,
                      label: l10n.selectTherapistLabel,
                      hint: l10n.selectTherapistHint,
                      value: _selectedTherapist,
                      items: _therapists
                          .map((t) => DropdownMenuItem(
                              value: t,
                              child: Text(t,
                                  style: TextStyle(
                                      fontSize: res.scaleText(14),
                                      color: isDark
                                          ? Colors.white
                                          : AppColors.textPrimary))))
                          .toList(),
                      onChanged: (v) =>
                          setState(() => _selectedTherapist = v),
                      validator: (_) => _selectedTherapist == null
                          ? l10n.fieldRequired
                          : null,
                    ),
                    SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                    _DropdownLabeledField<String>(
                      res: res,
                      isDark: isDark,
                      label: l10n.appointmentTypeLabel,
                      hint: l10n.appointmentTypeHint,
                      value: _selectedAppointmentType,
                      items: appointmentTypes
                          .map((t) => DropdownMenuItem(
                              value: t,
                              child: Text(t,
                                  style: TextStyle(
                                      fontSize: res.scaleText(14),
                                      color: isDark
                                          ? Colors.white
                                          : AppColors.textPrimary))))
                          .toList(),
                      onChanged: (v) =>
                          setState(() => _selectedAppointmentType = v),
                      validator: (_) => _selectedAppointmentType == null
                          ? l10n.fieldRequired
                          : null,
                    ),
                  ],
                ),
              ),

              SizedBox(height: res.scaleHeight(AppSpacing.p16)),

              // ── Date & Time ───────────────────────────────────────────
              _FormCard(
                res: res,
                isDark: isDark,
                child: Column(
                  children: [
                    _DatePickerTile(
                      res: res,
                      isDark: isDark,
                      label: l10n.selectDateLabel,
                      selectedDate: _selectedDate,
                      onTap: _pickDate,
                      formatDate: _formatDate,
                    ),
                    SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                    _TimePickerTile(
                      res: res,
                      isDark: isDark,
                      label: l10n.selectTimeLabel,
                      selectedTime: _selectedTime,
                      onTap: _pickTime,
                      formatTime: (t) => _formatTime(t, context),
                    ),
                  ],
                ),
              ),

              SizedBox(height: res.scaleHeight(AppSpacing.p32)),
              _SaveButton(
                  res: res,
                  isSaving: _isSaving,
                  label: l10n.saveButton,
                  onTap: _save),
              SizedBox(height: res.scaleHeight(AppSpacing.p32)),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Data ──────────────────────────────────────────────────────────────────────

class _MockItem {
  final String id;
  final String label;
  const _MockItem({required this.id, required this.label});
}

// ── Widgets ───────────────────────────────────────────────────────────────────

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

class _FieldLabel extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final String text;
  const _FieldLabel(
      {required this.res, required this.isDark, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: res.scaleText(14),
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white70 : AppColors.textPrimary));
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

class _ChildSelectTile extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final _MockItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _ChildSelectTile({
    required this.res,
    required this.isDark,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius:
          BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(bottom: res.scaleHeight(4)),
        padding: EdgeInsets.symmetric(
          horizontal: res.scaleSpacing(AppSpacing.p12),
          vertical: res.scaleHeight(AppSpacing.p8),
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius:
              BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: res.scaleWidth(16),
              backgroundColor: AppColors.primary.withValues(alpha: 0.15),
              child: Text(
                item.label.substring(0, 1),
                style: TextStyle(
                    fontSize: res.scaleText(13),
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary),
              ),
            ),
            SizedBox(width: res.scaleWidth(AppSpacing.p12)),
            Expanded(
              child: Text(item.label,
                  style: TextStyle(
                      fontSize: res.scaleText(14),
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white : AppColors.textPrimary)),
            ),
            if (isSelected)
              Icon(Icons.check_circle_rounded,
                  color: AppColors.primary, size: res.scaleText(20)),
          ],
        ),
      ),
    );
  }
}

class _DropdownLabeledField<T> extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final String label;
  final String hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final String? Function(T?)? validator;

  const _DropdownLabeledField({
    required this.res,
    required this.isDark,
    required this.label,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
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
        DropdownButtonFormField<T>(
          value: value,
          decoration: _inputDeco(res, isDark, hint),
          hint: Text(hint,
              style: TextStyle(
                  fontSize: res.scaleText(14),
                  color: AppColors.textSecondary)),
          items: items,
          onChanged: onChanged,
          validator: validator,
          dropdownColor: isDark ? AppColors.surfaceDark : Colors.white,
          icon: Icon(Icons.keyboard_arrow_down_rounded,
              color: AppColors.textSecondary, size: res.scaleText(20)),
        ),
      ],
    );
  }
}

class _DatePickerTile extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final String label;
  final DateTime? selectedDate;
  final VoidCallback onTap;
  final String Function(DateTime) formatDate;

  const _DatePickerTile({
    required this.res,
    required this.isDark,
    required this.label,
    required this.selectedDate,
    required this.onTap,
    required this.formatDate,
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
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
              res.scaleRadius(AppSpacing.radiusLg)),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: res.scaleSpacing(AppSpacing.p16),
              vertical: res.scaleHeight(AppSpacing.p12),
            ),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF2A2A2A)
                  : const Color(0xFFF5F7FA),
              borderRadius: BorderRadius.circular(
                  res.scaleRadius(AppSpacing.radiusLg)),
              border: Border.all(
                  color: isDark ? Colors.grey[700]! : Colors.grey[200]!),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today_outlined,
                    size: res.scaleText(18),
                    color: selectedDate != null
                        ? AppColors.primary
                        : AppColors.textSecondary),
                SizedBox(width: res.scaleWidth(10)),
                Text(
                  selectedDate != null
                      ? formatDate(selectedDate!)
                      : label,
                  style: TextStyle(
                      fontSize: res.scaleText(14),
                      color: selectedDate != null
                          ? (isDark ? Colors.white : AppColors.textPrimary)
                          : AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TimePickerTile extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final String label;
  final TimeOfDay? selectedTime;
  final VoidCallback onTap;
  final String Function(TimeOfDay) formatTime;

  const _TimePickerTile({
    required this.res,
    required this.isDark,
    required this.label,
    required this.selectedTime,
    required this.onTap,
    required this.formatTime,
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
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
              res.scaleRadius(AppSpacing.radiusLg)),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: res.scaleSpacing(AppSpacing.p16),
              vertical: res.scaleHeight(AppSpacing.p12),
            ),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF2A2A2A)
                  : const Color(0xFFF5F7FA),
              borderRadius: BorderRadius.circular(
                  res.scaleRadius(AppSpacing.radiusLg)),
              border: Border.all(
                  color: isDark ? Colors.grey[700]! : Colors.grey[200]!),
            ),
            child: Row(
              children: [
                Icon(Icons.access_time_rounded,
                    size: res.scaleText(18),
                    color: selectedTime != null
                        ? AppColors.primary
                        : AppColors.textSecondary),
                SizedBox(width: res.scaleWidth(10)),
                Text(
                  selectedTime != null
                      ? formatTime(selectedTime!)
                      : label,
                  style: TextStyle(
                      fontSize: res.scaleText(14),
                      color: selectedTime != null
                          ? (isDark ? Colors.white : AppColors.textPrimary)
                          : AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ),
      ],
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
          disabledBackgroundColor:
              AppColors.primary.withValues(alpha: 0.6),
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
            : Text(label,
                style: TextStyle(
                    fontSize: res.scaleText(16),
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
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
