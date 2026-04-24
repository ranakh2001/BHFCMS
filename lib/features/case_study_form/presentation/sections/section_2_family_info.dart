import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_labeled_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_radio_group.dart';

class Section2FamilyInfo extends StatefulWidget {
  final Section2Data? initialData;
  final void Function(Section2Data data) onNext;
  final bool isSaving;

  const Section2FamilyInfo({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section2FamilyInfo> createState() => _Section2FamilyInfoState();
}

class _Section2FamilyInfoState extends State<Section2FamilyInfo> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _fatherNameCtrl;
  late final TextEditingController _fatherEduCtrl;
  late final TextEditingController _motherNameCtrl;
  late final TextEditingController _motherEduCtrl;
  late final TextEditingController _kinshipTypeCtrl;

  bool? _hasKinship;
  String? _kinshipError;

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _fatherNameCtrl = TextEditingController(text: d?.fatherName ?? '');
    _fatherEduCtrl = TextEditingController(text: d?.fatherEducation ?? '');
    _motherNameCtrl = TextEditingController(text: d?.motherName ?? '');
    _motherEduCtrl = TextEditingController(text: d?.motherEducation ?? '');
    _kinshipTypeCtrl = TextEditingController(text: d?.kinshipType ?? '');
    _hasKinship = d?.hasParentKinship;
  }

  @override
  void dispose() {
    _fatherNameCtrl.dispose();
    _fatherEduCtrl.dispose();
    _motherNameCtrl.dispose();
    _motherEduCtrl.dispose();
    _kinshipTypeCtrl.dispose();
    super.dispose();
  }

  bool _validate(String required) {
    final formValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      _kinshipError = _hasKinship == null ? required : null;
    });
    return formValid && _kinshipError == null;
  }

  void _submit(String required) {
    if (!_validate(required)) return;
    widget.onNext(
      Section2Data(
        fatherName: _fatherNameCtrl.text.trim(),
        fatherEducation: _fatherEduCtrl.text.trim(),
        motherName: _motherNameCtrl.text.trim(),
        motherEducation: _motherEduCtrl.text.trim(),
        hasParentKinship: _hasKinship ?? false,
        kinshipType: (_hasKinship ?? false) ? _kinshipTypeCtrl.text.trim() : '',
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
            l10n.csSection2Title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.p24),

          FormLabeledField(
            label: l10n.csFatherName,
            hint: l10n.csFatherNameHint,
            controller: _fatherNameCtrl,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? l10n.validationRequired : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          FormLabeledField(
            label: l10n.csFatherEducation,
            hint: l10n.csFatherEducationHint,
            controller: _fatherEduCtrl,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? l10n.validationRequired : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          FormLabeledField(
            label: l10n.csMotherName,
            hint: l10n.csMotherNameHint,
            controller: _motherNameCtrl,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? l10n.validationRequired : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          FormLabeledField(
            label: l10n.csMotherEducation,
            hint: l10n.csMotherEducationHint,
            controller: _motherEduCtrl,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? l10n.validationRequired : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          FormRadioGroup<bool>(
            label: l10n.csParentsKinship,
            groupValue: _hasKinship,
            onChanged: (v) => setState(() {
              _hasKinship = v;
              _kinshipError = null;
            }),
            errorText: _kinshipError,
            options: [
              RadioOption(label: l10n.csYes, value: true),
              RadioOption(label: l10n.csNo, value: false),
            ],
          ),
          const SizedBox(height: AppSpacing.p16),

          if (_hasKinship == true) ...[
            FormLabeledField(
              label: l10n.csKinshipType,
              hint: l10n.csKinshipTypeHint,
              controller: _kinshipTypeCtrl,
              validator: (v) =>
                  (_hasKinship == true && (v == null || v.trim().isEmpty))
                      ? l10n.validationRequired
                      : null,
            ),
            const SizedBox(height: AppSpacing.p8),
            Text(
              l10n.csKinshipNote,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.p16),
          ],

          const SizedBox(height: AppSpacing.p16),
          FormNextButton(
            label: l10n.csFormNext,
            onPressed: () => _submit(l10n.validationRequired),
            isLoading: widget.isSaving,
          ),
        ],
      ),
    );
  }
}
