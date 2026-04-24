import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_labeled_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_radio_group.dart';

class Section3Socioeconomic extends StatefulWidget {
  final Section3Data? initialData;
  final void Function(Section3Data data) onNext;
  final bool isSaving;

  const Section3Socioeconomic({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section3Socioeconomic> createState() => _Section3SocioeconomicState();
}

class _Section3SocioeconomicState extends State<Section3Socioeconomic> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _homeLangCtrl;
  late final TextEditingController _schoolLangCtrl;
  late final TextEditingController _livingOtherCtrl;
  late final TextEditingController _familyRelCtrl;
  late final TextEditingController _memberCountCtrl;

  String? _maritalStatus;
  String? _livingWith;
  String? _familyProvider;
  String? _familyIncome;
  bool? _hasHealthConditions;

  late List<_ConditionEntry> _conditions;

  String? _maritalError;
  String? _livingWithError;
  String? _providerError;
  String? _incomeError;
  String? _healthError;

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _homeLangCtrl = TextEditingController(text: d?.homeLanguage ?? '');
    _schoolLangCtrl = TextEditingController(text: d?.schoolLanguage ?? '');
    _livingOtherCtrl =
        TextEditingController(text: d?.childLivingWithOther ?? '');
    _familyRelCtrl = TextEditingController(text: d?.familyRelationship ?? '');
    _memberCountCtrl = TextEditingController(text: d?.familyMembersCount ?? '');

    _maritalStatus = _emptyToNull(d?.maritalStatus);
    _livingWith = _emptyToNull(d?.childLivingWith);
    _familyProvider = _emptyToNull(d?.familyProvider);
    _familyIncome = _emptyToNull(d?.familyIncome);
    _hasHealthConditions = d?.hasFamilyHealthConditions;

    _conditions = (d?.healthConditions ?? [])
        .map((c) => _ConditionEntry(
              personCtrl: TextEditingController(text: c.personRelation),
              diseaseCtrl: TextEditingController(text: c.diseaseName),
            ))
        .toList();

    if (_hasHealthConditions == true && _conditions.isEmpty) {
      _conditions.add(_ConditionEntry());
    }
  }

  String? _emptyToNull(String? s) => (s == null || s.isEmpty) ? null : s;

  @override
  void dispose() {
    _homeLangCtrl.dispose();
    _schoolLangCtrl.dispose();
    _livingOtherCtrl.dispose();
    _familyRelCtrl.dispose();
    _memberCountCtrl.dispose();
    for (final c in _conditions) {
      c.dispose();
    }
    super.dispose();
  }

  bool _validate(String required) {
    final formValid = _formKey.currentState?.validate() ?? false;

    setState(() {
      _maritalError = _maritalStatus == null ? required : null;
      _livingWithError = _livingWith == null ? required : null;
      _providerError = _familyProvider == null ? required : null;
      _incomeError = _familyIncome == null ? required : null;
      _healthError = _hasHealthConditions == null ? required : null;
    });

    final radioValid = _maritalError == null &&
        _livingWithError == null &&
        _providerError == null &&
        _incomeError == null &&
        _healthError == null;

    return formValid && radioValid;
  }

  void _submit(String required) {
    if (!_validate(required)) return;
    widget.onNext(
      Section3Data(
        homeLanguage: _homeLangCtrl.text.trim(),
        schoolLanguage: _schoolLangCtrl.text.trim(),
        maritalStatus: _maritalStatus ?? '',
        childLivingWith: _livingWith ?? '',
        childLivingWithOther: _livingWith == 'other'
            ? _livingOtherCtrl.text.trim()
            : '',
        familyRelationship: _familyRelCtrl.text.trim(),
        familyProvider: _familyProvider ?? '',
        familyIncome: _familyIncome ?? '',
        familyMembersCount: _memberCountCtrl.text.trim(),
        hasFamilyHealthConditions: _hasHealthConditions ?? false,
        healthConditions: (_hasHealthConditions ?? false)
            ? _conditions
                .map((c) => FamilyHealthCondition(
                      personRelation: c.personCtrl.text.trim(),
                      diseaseName: c.diseaseCtrl.text.trim(),
                    ))
                .toList()
            : [],
      ),
    );
  }

  void _addCondition() => setState(() => _conditions.add(_ConditionEntry()));

  void _removeCondition(int index) {
    _conditions[index].dispose();
    setState(() => _conditions.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.csSection3Title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.p24),

          FormLabeledField(
            label: l10n.csHomeLanguage,
            hint: l10n.csHomeLanguageHint,
            controller: _homeLangCtrl,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? l10n.validationRequired : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          FormLabeledField(
            label: l10n.csSchoolLanguage,
            hint: l10n.csSchoolLanguageHint,
            controller: _schoolLangCtrl,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? l10n.validationRequired : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          FormRadioGroup<String>(
            label: l10n.csMaritalStatus,
            groupValue: _maritalStatus,
            onChanged: (v) => setState(() {
              _maritalStatus = v;
              _maritalError = null;
            }),
            errorText: _maritalError,
            options: [
              RadioOption(label: l10n.csMarried, value: 'married'),
              RadioOption(label: l10n.csDivorced, value: 'divorced'),
            ],
          ),
          const SizedBox(height: AppSpacing.p16),

          FormRadioGroup<String>(
            label: l10n.csChildLivingWith,
            groupValue: _livingWith,
            onChanged: (v) => setState(() {
              _livingWith = v;
              _livingWithError = null;
            }),
            errorText: _livingWithError,
            options: [
              RadioOption(label: l10n.csLivesWithBoth, value: 'both'),
              RadioOption(label: l10n.csLivesWithFather, value: 'father'),
              RadioOption(label: l10n.csLivesWithMother, value: 'mother'),
              RadioOption(label: l10n.csLivesWithOther, value: 'other'),
            ],
          ),

          if (_livingWith == 'other') ...[
            const SizedBox(height: AppSpacing.p8),
            FormLabeledField(
              label: l10n.csChildLivingWith,
              hint: l10n.csChildLivingOtherHint,
              controller: _livingOtherCtrl,
              validator: (v) => (_livingWith == 'other' &&
                      (v == null || v.trim().isEmpty))
                  ? l10n.validationRequired
                  : null,
            ),
            const SizedBox(height: AppSpacing.p4),
            Text(
              l10n.csChildLivingOtherNote,
              style: const TextStyle(
                  fontSize: 12, color: AppColors.textSecondary),
            ),
          ],
          const SizedBox(height: AppSpacing.p16),

          FormLabeledField(
            label: l10n.csFamilyRelationship,
            hint: l10n.csFamilyRelationshipHint,
            controller: _familyRelCtrl,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? l10n.validationRequired : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          FormRadioGroup<String>(
            label: l10n.csFamilyProvider,
            groupValue: _familyProvider,
            onChanged: (v) => setState(() {
              _familyProvider = v;
              _providerError = null;
            }),
            errorText: _providerError,
            options: [
              RadioOption(label: l10n.csFamilyProviderFather, value: 'father'),
              RadioOption(label: l10n.csFamilyProviderMother, value: 'mother'),
              RadioOption(label: l10n.csFamilyProviderRelative, value: 'relative'),
              RadioOption(label: l10n.csLivesWithOther, value: 'other'),
            ],
          ),
          const SizedBox(height: AppSpacing.p16),

          FormRadioGroup<String>(
            label: l10n.csFamilyIncome,
            groupValue: _familyIncome,
            onChanged: (v) => setState(() {
              _familyIncome = v;
              _incomeError = null;
            }),
            errorText: _incomeError,
            options: [
              RadioOption(label: l10n.csIncomeExcellent, value: 'excellent'),
              RadioOption(label: l10n.csIncomeAverage, value: 'average'),
              RadioOption(label: l10n.csIncomeWeak, value: 'weak'),
            ],
          ),
          const SizedBox(height: AppSpacing.p16),

          FormLabeledField(
            label: l10n.csFamilyMembersCount,
            hint: l10n.csFamilyMembersCountHint,
            controller: _memberCountCtrl,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? l10n.validationRequired : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          FormRadioGroup<bool>(
            label: l10n.csFamilyHealthConditions,
            groupValue: _hasHealthConditions,
            onChanged: (v) {
              setState(() {
                _hasHealthConditions = v;
                _healthError = null;
                if (v == true && _conditions.isEmpty) {
                  _conditions.add(_ConditionEntry());
                }
              });
            },
            errorText: _healthError,
            options: [
              RadioOption(label: l10n.csYes, value: true),
              RadioOption(label: l10n.csNo, value: false),
            ],
          ),

          if (_hasHealthConditions == true) ...[
            const SizedBox(height: AppSpacing.p16),
            ..._conditions.asMap().entries.map((e) =>
                _buildConditionEntry(context, e.key, e.value, l10n)),

            const SizedBox(height: AppSpacing.p8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: _addCondition,
                  icon: const Icon(Icons.add_circle_outline,
                      size: 18, color: AppColors.primary),
                  label: Text(
                    l10n.csAddAnotherPerson,
                    style: const TextStyle(
                        color: AppColors.primary, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  ' ${l10n.csOptional}',
                  style: const TextStyle(
                      color: AppColors.textSecondary, fontSize: 12),
                ),
              ],
            ),
          ],

          const SizedBox(height: AppSpacing.p32),
          FormNextButton(
            label: l10n.csFormNext,
            onPressed: () => _submit(l10n.validationRequired),
            isLoading: widget.isSaving,
          ),
        ],
      ),
    );
  }

  Widget _buildConditionEntry(
    BuildContext context,
    int index,
    _ConditionEntry entry,
    AppLocalizations l10n,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (index > 0)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Divider(endIndent: 8),
              IconButton(
                icon: const Icon(Icons.remove_circle_outline,
                    color: AppColors.error, size: 20),
                onPressed: () => _removeCondition(index),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        FormLabeledField(
          label: l10n.csAffectedPerson,
          hint: l10n.csAffectedPersonHint,
          controller: entry.personCtrl,
          validator: (v) =>
              (_hasHealthConditions == true && index == 0 &&
                      (v == null || v.trim().isEmpty))
                  ? l10n.validationRequired
                  : null,
        ),
        const SizedBox(height: AppSpacing.p12),
        FormLabeledField(
          label: l10n.csDiseaseName,
          hint: l10n.csDiseaseNameHint,
          controller: entry.diseaseCtrl,
          validator: (v) =>
              (_hasHealthConditions == true && index == 0 &&
                      (v == null || v.trim().isEmpty))
                  ? l10n.validationRequired
                  : null,
        ),
        const SizedBox(height: AppSpacing.p16),
      ],
    );
  }
}

class _ConditionEntry {
  final TextEditingController personCtrl;
  final TextEditingController diseaseCtrl;

  _ConditionEntry({
    TextEditingController? personCtrl,
    TextEditingController? diseaseCtrl,
  })  : personCtrl = personCtrl ?? TextEditingController(),
        diseaseCtrl = diseaseCtrl ?? TextEditingController();

  void dispose() {
    personCtrl.dispose();
    diseaseCtrl.dispose();
  }
}
