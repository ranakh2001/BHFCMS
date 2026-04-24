import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_date_picker_field.dart';
import '../widgets/form_dropdown_field.dart';
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

  late final TextEditingController _childNameCtrl;
  late final TextEditingController _placeOfBirthCtrl;
  late final TextEditingController _gradeCtrl;
  late final TextEditingController _childAgeCtrl;
  late final TextEditingController _nationalityCtrl;
  late final TextEditingController _familyRankCtrl;

  DateTime? _dateOfBirth;
  DateTime? _centerJoinDate;
  String? _gender;

  String? _dobError;
  String? _joinDateError;
  String? _genderError;

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _childNameCtrl = TextEditingController(text: d?.childName ?? '');
    _placeOfBirthCtrl = TextEditingController(text: d?.placeOfBirth ?? '');
    _gradeCtrl = TextEditingController(text: d?.grade ?? '');
    _childAgeCtrl = TextEditingController(text: d?.childAge ?? '');
    _nationalityCtrl = TextEditingController(text: d?.nationality ?? '');
    _familyRankCtrl = TextEditingController(text: d?.familyRank ?? '');
    _dateOfBirth = d?.dateOfBirth;
    _centerJoinDate = d?.centerJoinDate;
    _gender = d?.gender.isEmpty ?? true ? null : d!.gender;
  }

  @override
  void dispose() {
    _childNameCtrl.dispose();
    _placeOfBirthCtrl.dispose();
    _gradeCtrl.dispose();
    _childAgeCtrl.dispose();
    _nationalityCtrl.dispose();
    _familyRankCtrl.dispose();
    super.dispose();
  }

  bool _validate(AppLocalizations l10n) {
    final formValid = _formKey.currentState?.validate() ?? false;
    bool extraValid = true;

    setState(() {
      _dobError = _dateOfBirth == null ? l10n.validationRequired : null;
      _joinDateError = _centerJoinDate == null ? l10n.validationRequired : null;
      _genderError = (_gender == null || _gender!.isEmpty) ? l10n.validationRequired : null;
    });

    if (_dobError != null || _joinDateError != null || _genderError != null) {
      extraValid = false;
    }

    return formValid && extraValid;
  }

  void _submit(AppLocalizations l10n) {
    if (!_validate(l10n)) return;
    widget.onNext(
      Section1Data(
        childName: _childNameCtrl.text.trim(),
        placeOfBirth: _placeOfBirthCtrl.text.trim(),
        dateOfBirth: _dateOfBirth,
        grade: _gradeCtrl.text.trim(),
        childAge: _childAgeCtrl.text.trim(),
        gender: _gender ?? '',
        nationality: _nationalityCtrl.text.trim(),
        familyRank: _familyRankCtrl.text.trim(),
        centerJoinDate: _centerJoinDate,
      ),
    );
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
            l10n.csSection1Title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.p24),

          FormLabeledField(
            label: l10n.csChildName,
            hint: l10n.csChildNameHint,
            controller: _childNameCtrl,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? l10n.validationRequired : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          FormLabeledField(
            label: l10n.csPlaceOfBirth,
            hint: l10n.csPlaceOfBirthHint,
            controller: _placeOfBirthCtrl,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? l10n.validationRequired : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          FormDatePickerField(
            label: l10n.csDateOfBirth,
            value: _dateOfBirth,
            lastDate: DateTime.now(),
            errorText: _dobError,
            onChanged: (d) => setState(() {
              _dateOfBirth = d;
              _dobError = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          FormLabeledField(
            label: l10n.csGrade,
            hint: l10n.csGradeHint,
            controller: _gradeCtrl,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? l10n.validationRequired : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          FormLabeledField(
            label: l10n.csChildAge,
            hint: l10n.csChildAgeHint,
            controller: _childAgeCtrl,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? l10n.validationRequired : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          FormDropdownField<String>(
            label: l10n.csGender,
            hint: l10n.csGenderHint,
            initialValue: _gender,
            onChanged: (v) => setState(() {
              _gender = v;
              _genderError = null;
            }),
            validator: (v) =>
                (v == null || v.isEmpty) ? l10n.validationRequired : null,
            items: [
              DropdownMenuItem(
                value: 'male',
                child: Text(l10n.csGenderMale),
              ),
              DropdownMenuItem(
                value: 'female',
                child: Text(l10n.csGenderFemale),
              ),
            ],
          ),
          if (_genderError != null) ...[
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                _genderError!,
                style: const TextStyle(color: AppColors.error, fontSize: 12),
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.p16),

          FormLabeledField(
            label: l10n.csNationality,
            hint: l10n.csNationalityHint,
            controller: _nationalityCtrl,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? l10n.validationRequired : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          FormLabeledField(
            label: l10n.csFamilyRank,
            hint: l10n.csFamilyRankHint,
            controller: _familyRankCtrl,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? l10n.validationRequired : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          FormDatePickerField(
            label: l10n.csCenterJoinDate,
            value: _centerJoinDate,
            lastDate: DateTime.now(),
            errorText: _joinDateError,
            onChanged: (d) => setState(() {
              _centerJoinDate = d;
              _joinDateError = null;
            }),
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
