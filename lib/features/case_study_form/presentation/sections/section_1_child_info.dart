import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_labeled_field.dart';
import '../widgets/form_next_button.dart';

class Section1ChildInfo extends StatefulWidget {
  final Section1Data? initialData;
  final void Function(Section1Data data) onNext;
  final bool isSaving;

  const Section1ChildInfo({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section1ChildInfo> createState() => _Section1ChildInfoState();
}

class _Section1ChildInfoState extends State<Section1ChildInfo> {
  final _formKey = GlobalKey<FormState>();

  late String _referralSource;
  late final TextEditingController _referralOtherCtrl;
  late final TextEditingController _mainReasonCtrl;

  static const _referralOptions = [
    'self',
    'doctor',
    'school',
    'other_center',
    'other',
  ];

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _referralSource = (d?.referralSource.isNotEmpty ?? false)
        ? d!.referralSource
        : '';
    _referralOtherCtrl = TextEditingController(
      text: d?.referralSourceOther ?? '',
    );
    _mainReasonCtrl = TextEditingController(text: d?.mainServiceReason ?? '');
  }

  @override
  void dispose() {
    _referralOtherCtrl.dispose();
    _mainReasonCtrl.dispose();
    super.dispose();
  }

  String _referralLabel(String value, AppLocalizations l10n) {
    switch (value) {
      case 'self':
        return l10n.csReferralSelf;
      case 'doctor':
        return l10n.csReferralDoctor;
      case 'school':
        return l10n.csReferralSchool;
      case 'other_center':
        return l10n.csReferralOtherCenter;
      case 'other':
        return l10n.csReferralOther;
      default:
        return value;
    }
  }

  void _submit(AppLocalizations l10n) {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (_referralSource.isEmpty) {
      setState(() {});
      return;
    }

    final d = widget.initialData;
    widget.onNext(
      Section1Data(
        childName: d?.childName ?? '',
        referenceNumber: d?.referenceNumber ?? '',
        dateOfBirth: d?.dateOfBirth,
        childAge: d?.childAge ?? '',
        gender: d?.gender ?? '',
        nationality: d?.nationality ?? '',
        primaryLanguage: d?.primaryLanguage ?? '',
        address: d?.address ?? '',
        caregiverName: d?.caregiverName ?? '',
        caregiverRelationship: d?.caregiverRelationship ?? '',
        phoneNumber: d?.phoneNumber ?? '',
        email: d?.email ?? '',
        referralSource: _referralSource,
        referralSourceOther: _referralSource == 'other'
            ? _referralOtherCtrl.text.trim()
            : '',
        mainServiceReason: _mainReasonCtrl.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = ResponsiveHelper(context);
    final d = widget.initialData;

    final dateStr = d?.dateOfBirth != null
        ? DateFormat('dd/MM/yyyy').format(d!.dateOfBirth!)
        : '';

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Section title ─────────────────────────────────────────────────
          Text(
            l10n.csSection1Title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.p20),

          // ── Child data display block ──────────────────────────────────────
          _SectionDivider(label: l10n.csChildInfoDisplaySection),
          const SizedBox(height: AppSpacing.p16),

          _ReadOnlyField(label: l10n.csChildName, value: d?.childName ?? ''),
          const SizedBox(height: AppSpacing.p12),
          _ReadOnlyField(
            label: l10n.csReferenceNumber,
            value: d?.referenceNumber ?? '',
          ),
          const SizedBox(height: AppSpacing.p12),
          _ReadOnlyField(label: l10n.csDateOfBirth, value: dateStr),
          const SizedBox(height: AppSpacing.p12),
          _ReadOnlyField(label: l10n.csChildAge, value: d?.childAge ?? ''),
          const SizedBox(height: AppSpacing.p12),
          _ReadOnlyField(label: l10n.csGender, value: d?.gender ?? ''),
          const SizedBox(height: AppSpacing.p12),
          _ReadOnlyField(
            label: l10n.csNationality,
            value: d?.nationality ?? '',
          ),
          const SizedBox(height: AppSpacing.p12),
          _ReadOnlyField(
            label: l10n.csPrimaryLanguage,
            value: d?.primaryLanguage ?? '',
          ),
          const SizedBox(height: AppSpacing.p12),
          _ReadOnlyField(
            label: l10n.csFullAddress,
            value: d?.address ?? '',
            maxLines: 3,
          ),
          const SizedBox(height: AppSpacing.p12),
          _ReadOnlyField(
            label: l10n.csCaregiverName,
            value: d?.caregiverName ?? '',
          ),
          const SizedBox(height: AppSpacing.p12),
          _ReadOnlyField(
            label: l10n.csCaregiverRelationship,
            value: d?.caregiverRelationship ?? '',
          ),
          const SizedBox(height: AppSpacing.p12),
          _ReadOnlyField(
            label: l10n.csPhoneNumber,
            value: d?.phoneNumber ?? '',
          ),
          const SizedBox(height: AppSpacing.p12),
          _ReadOnlyField(label: l10n.csEmailAddress, value: d?.email ?? ''),
          const SizedBox(height: AppSpacing.p20),

          // ── Referral & reason block ───────────────────────────────────────
          _SectionDivider(label: l10n.csReferralInfoSection),
          const SizedBox(height: AppSpacing.p16),

          // Referral source label
          Text(
            l10n.csReferralSource,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: AppSpacing.p8),

          // Radio buttons in a wrap (responsive)
          Wrap(
            spacing: res.scaleSpacing(8),
            runSpacing: res.scaleSpacing(4),
            children: _referralOptions.map((option) {
              final isSelected = _referralSource == option;
              return GestureDetector(
                onTap: () => setState(() => _referralSource = option),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.textSecondary,
                          width: isSelected ? 2 : 1.5,
                        ),
                      ),
                      child: isSelected
                          ? Center(
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary,
                                ),
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _referralLabel(option, l10n),
                      style: TextStyle(
                        fontSize: res.scaleText(13),
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.textPrimary,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          if (_referralSource.isEmpty) ...[
            const SizedBox(height: 4),
            Text(
              l10n.validationRequired,
              style: const TextStyle(color: AppColors.error, fontSize: 12),
            ),
          ],
          const SizedBox(height: AppSpacing.p12),

          // Conditional "other" text field
          if (_referralSource == 'other') ...[
            Text(
              l10n.csReferralOtherNote,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: AppSpacing.p8),
            FormLabeledField(
              label: l10n.csReferralSource,
              hint: l10n.csReferralOtherHint,
              controller: _referralOtherCtrl,
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? l10n.validationRequired
                  : null,
            ),
            const SizedBox(height: AppSpacing.p12),
          ],

          // Main service reason
          FormLabeledField(
            label: l10n.csMainServiceReason,
            hint: l10n.csMainServiceReasonHint,
            controller: _mainReasonCtrl,
            maxLines: 4,
            validator: (v) => (v == null || v.trim().isEmpty)
                ? l10n.validationRequired
                : null,
          ),
          const SizedBox(height: AppSpacing.p32),

          FormNextButton(
            label: l10n.csFormNext,
            onPressed: () => _submit(l10n),
            isLoading: widget.isSaving,
          ),
        ],
      ),
    );
  }
}

// ── Read-only display field ───────────────────────────────────────────────────

class _ReadOnlyField extends StatelessWidget {
  final String label;
  final String value;
  final int maxLines;

  const _ReadOnlyField({
    required this.label,
    required this.value,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: res.scaleHeight(44)),
          padding: EdgeInsets.symmetric(
            horizontal: res.scaleSpacing(14),
            vertical: res.scaleSpacing(10),
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            value.isEmpty ? '—' : value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: value.isEmpty
                  ? AppColors.textSecondary
                  : AppColors.textPrimary,
            ),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}

// ── Section divider with label ────────────────────────────────────────────────

class _SectionDivider extends StatelessWidget {
  final String label;

  const _SectionDivider({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: AppColors.primary, thickness: 0.5),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Expanded(
          child: Divider(color: AppColors.primary, thickness: 0.5),
        ),
      ],
    );
  }
}
