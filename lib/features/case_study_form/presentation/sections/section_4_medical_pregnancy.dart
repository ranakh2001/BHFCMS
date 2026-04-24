import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../widgets/form_disease_grid.dart';
import '../widgets/form_labeled_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_yes_no_question.dart';

/// Section 4 — Medical Information & Birth History (Pregnancy Period).
///
/// Every question uses [FormYesNoQuestion] or [FormLabeledField] — no
/// raw yes/no radio logic is written inline in this file.
class Section4MedicalPregnancy extends StatefulWidget {
  final Section4Data? initialData;
  final void Function(Section4Data data) onNext;
  final bool isSaving;

  const Section4MedicalPregnancy({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section4MedicalPregnancy> createState() =>
      _Section4MedicalPregnancyState();
}

class _Section4MedicalPregnancyState extends State<Section4MedicalPregnancy> {
  final _formKey = GlobalKey<FormState>();

  // ── Text controllers ───────────────────────────────────────────────────────
  late final TextEditingController _medicationTypeCtrl;
  late final TextEditingController _injuriesDescCtrl;
  late final TextEditingController _pregnancyDurationCtrl;
  late final TextEditingController _infectiousDiseaseTypeCtrl;
  late final TextEditingController _chronicDiseaseTypeCtrl;
  late final TextEditingController _labTestsDescCtrl;
  late final TextEditingController _totalPregnanciesCtrl;

  // ── Boolean state ──────────────────────────────────────────────────────────
  bool? _tookMedication;
  bool? _hadDoctorFollowUp;
  bool? _followUpWasRegular;
  bool? _exposedToRadiation;
  bool? _hadInjuries;
  bool? _hadPsychologicalTrauma;
  bool? _pregnancyWasNineMonths;
  bool? _hadInfectiousDiseases;
  bool? _hasChronicDiseases;
  bool? _hadLabTests;
  bool? _tookStabilizingMedication;
  bool? _hadMiscarriage;
  bool? _exposedToSmoking;

  // ── Disease flags ──────────────────────────────────────────────────────────
  bool? _diabetes;
  bool? _bloodPressure;
  bool? _albuminuria;
  bool? _preeclampsia;
  bool? _rubella;
  bool? _bleeding;

  // ── Validation error map (keyed by field name) ────────────────────────────
  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;

    _medicationTypeCtrl =
        TextEditingController(text: d?.medicationType ?? '');
    _injuriesDescCtrl =
        TextEditingController(text: d?.injuriesDescription ?? '');
    _pregnancyDurationCtrl =
        TextEditingController(text: d?.pregnancyDuration ?? '');
    _infectiousDiseaseTypeCtrl =
        TextEditingController(text: d?.infectiousDiseaseType ?? '');
    _chronicDiseaseTypeCtrl =
        TextEditingController(text: d?.chronicDiseaseType ?? '');
    _labTestsDescCtrl =
        TextEditingController(text: d?.labTestsDescription ?? '');
    _totalPregnanciesCtrl =
        TextEditingController(text: d?.totalPregnanciesCount ?? '');

    _tookMedication = d?.tookMedication;
    _hadDoctorFollowUp = d?.hadDoctorFollowUp;
    _followUpWasRegular = d?.followUpWasRegular;
    _exposedToRadiation = d?.exposedToRadiation;
    _hadInjuries = d?.hadInjuriesOrFalls;
    _hadPsychologicalTrauma = d?.hadPsychologicalTrauma;
    _pregnancyWasNineMonths = d?.pregnancyWasNineMonths;
    _hadInfectiousDiseases = d?.hadInfectiousDiseases;
    _hasChronicDiseases = d?.hasChronicDiseases;
    _hadLabTests = d?.hadLabTests;
    _tookStabilizingMedication = d?.tookStabilizingMedication;
    _hadMiscarriage = d?.hadMiscarriage;
    _exposedToSmoking = d?.exposedToSmoking;

    final dis = d?.pregnancyDiseases ?? const PregnancyDiseaseFlags();
    _diabetes = dis.diabetes;
    _bloodPressure = dis.bloodPressure;
    _albuminuria = dis.albuminuria;
    _preeclampsia = dis.preeclampsia;
    _rubella = dis.rubella;
    _bleeding = dis.bleeding;
  }

  @override
  void dispose() {
    _medicationTypeCtrl.dispose();
    _injuriesDescCtrl.dispose();
    _pregnancyDurationCtrl.dispose();
    _infectiousDiseaseTypeCtrl.dispose();
    _chronicDiseaseTypeCtrl.dispose();
    _labTestsDescCtrl.dispose();
    _totalPregnanciesCtrl.dispose();
    super.dispose();
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  String _req(BuildContext context) => AppLocalizations.of(context)!.validationRequired;

  void _setError(String key, String? value) => _errors[key] = value;

  bool _validateBoolField(String key, bool? value, BuildContext context) {
    if (value == null) {
      _setError(key, _req(context));
      return false;
    }
    _setError(key, null);
    return true;
  }

  bool _validate(BuildContext context) {
    final formValid = _formKey.currentState?.validate() ?? false;

    // Validate all yes/no questions
    bool allBoolsValid = true;
    void checkBool(String key, bool? v) {
      if (!_validateBoolField(key, v, context)) allBoolsValid = false;
    }

    setState(() {
      checkBool('tookMedication', _tookMedication);
      checkBool('hadDoctorFollowUp', _hadDoctorFollowUp);
      checkBool('followUpWasRegular', _followUpWasRegular);
      checkBool('exposedToRadiation', _exposedToRadiation);
      checkBool('hadInjuries', _hadInjuries);
      checkBool('hadPsychologicalTrauma', _hadPsychologicalTrauma);
      checkBool('pregnancyWasNineMonths', _pregnancyWasNineMonths);
      checkBool('hadInfectiousDiseases', _hadInfectiousDiseases);
      checkBool('hasChronicDiseases', _hasChronicDiseases);
      checkBool('hadLabTests', _hadLabTests);
      checkBool('tookStabilizingMedication', _tookStabilizingMedication);
      checkBool('hadMiscarriage', _hadMiscarriage);
      checkBool('exposedToSmoking', _exposedToSmoking);
    });

    return formValid && allBoolsValid;
  }

  void _submit(BuildContext context) {
    if (!_validate(context)) return;

    widget.onNext(
      Section4Data(
        tookMedication: _tookMedication,
        medicationType:
            _tookMedication == true ? _medicationTypeCtrl.text.trim() : '',
        hadDoctorFollowUp: _hadDoctorFollowUp,
        followUpWasRegular: _followUpWasRegular,
        exposedToRadiation: _exposedToRadiation,
        hadInjuriesOrFalls: _hadInjuries,
        injuriesDescription:
            _hadInjuries == true ? _injuriesDescCtrl.text.trim() : '',
        hadPsychologicalTrauma: _hadPsychologicalTrauma,
        pregnancyWasNineMonths: _pregnancyWasNineMonths,
        pregnancyDuration: _pregnancyWasNineMonths == false
            ? _pregnancyDurationCtrl.text.trim()
            : '',
        pregnancyDiseases: PregnancyDiseaseFlags(
          diabetes: _diabetes,
          bloodPressure: _bloodPressure,
          albuminuria: _albuminuria,
          preeclampsia: _preeclampsia,
          rubella: _rubella,
          bleeding: _bleeding,
        ),
        hadInfectiousDiseases: _hadInfectiousDiseases,
        infectiousDiseaseType: _hadInfectiousDiseases == true
            ? _infectiousDiseaseTypeCtrl.text.trim()
            : '',
        hasChronicDiseases: _hasChronicDiseases,
        chronicDiseaseType: _hasChronicDiseases == true
            ? _chronicDiseaseTypeCtrl.text.trim()
            : '',
        hadLabTests: _hadLabTests,
        labTestsDescription:
            _hadLabTests == true ? _labTestsDescCtrl.text.trim() : '',
        tookStabilizingMedication: _tookStabilizingMedication,
        totalPregnanciesCount: _totalPregnanciesCtrl.text.trim(),
        hadMiscarriage: _hadMiscarriage,
        exposedToSmoking: _exposedToSmoking,
      ),
    );
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Section header ────────────────────────────────────────────
          Text(
            l10n.csSection4Title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            '(${l10n.csSection4Subtitle})',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.p24),

          // ── Q1: Medication ────────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS4TookMedication,
            value: _tookMedication,
            errorText: _errors['tookMedication'],
            onChanged: (v) => setState(() {
              _tookMedication = v;
              _errors['tookMedication'] = null;
            }),
            conditionalChild: FormLabeledField(
              label: l10n.csS4MedicationType,
              hint: l10n.csS4MedicationTypeHint,
              controller: _medicationTypeCtrl,
              validator: (v) => (_tookMedication == true &&
                      (v == null || v.trim().isEmpty))
                  ? _req(context)
                  : null,
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q2: Doctor follow-up ──────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS4HadDoctorFollowUp,
            value: _hadDoctorFollowUp,
            errorText: _errors['hadDoctorFollowUp'],
            onChanged: (v) => setState(() {
              _hadDoctorFollowUp = v;
              _errors['hadDoctorFollowUp'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q3: Regular follow-up ─────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS4FollowUpRegular,
            value: _followUpWasRegular,
            errorText: _errors['followUpWasRegular'],
            onChanged: (v) => setState(() {
              _followUpWasRegular = v;
              _errors['followUpWasRegular'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q4: Radiation ─────────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS4ExposedToRadiation,
            value: _exposedToRadiation,
            errorText: _errors['exposedToRadiation'],
            onChanged: (v) => setState(() {
              _exposedToRadiation = v;
              _errors['exposedToRadiation'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q5: Injuries / falls / accidents ─────────────────────────
          FormYesNoQuestion(
            label: l10n.csS4HadInjuries,
            value: _hadInjuries,
            errorText: _errors['hadInjuries'],
            onChanged: (v) => setState(() {
              _hadInjuries = v;
              _errors['hadInjuries'] = null;
            }),
            conditionalChild: FormLabeledField(
              label: l10n.csS4InjuriesType,
              hint: l10n.csS4InjuriesTypeHint,
              controller: _injuriesDescCtrl,
              validator: (v) =>
                  (_hadInjuries == true && (v == null || v.trim().isEmpty))
                      ? _req(context)
                      : null,
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q6: Psychological trauma ──────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS4PsychologicalTrauma,
            note: l10n.csS4PsychologicalTraumaNote,
            value: _hadPsychologicalTrauma,
            errorText: _errors['hadPsychologicalTrauma'],
            onChanged: (v) => setState(() {
              _hadPsychologicalTrauma = v;
              _errors['hadPsychologicalTrauma'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q7: Nine-month pregnancy ──────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS4NineMonths,
            value: _pregnancyWasNineMonths,
            errorText: _errors['pregnancyWasNineMonths'],
            onChanged: (v) => setState(() {
              _pregnancyWasNineMonths = v;
              _errors['pregnancyWasNineMonths'] = null;
            }),
            showConditionalWhenTrue: false,
            conditionalChild: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormLabeledField(
                  label: l10n.csS4DurationLabel,
                  hint: l10n.csS4DurationHint,
                  controller: _pregnancyDurationCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (v) => (_pregnancyWasNineMonths == false &&
                          (v == null || v.trim().isEmpty))
                      ? _req(context)
                      : null,
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.csIfPreviousNo,
                  style: const TextStyle(
                    fontSize: 11.5,
                    color: AppColors.textSecondary,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q8: Pregnancy disease grid ────────────────────────────────
          FormDiseaseGrid(
            label: l10n.csS4DiseasesDuringPregnancy,
            conditions: [
              DiseaseCondition(
                label: l10n.csS4Diabetes,
                value: _diabetes,
                onChanged: (v) => setState(() => _diabetes = v),
              ),
              DiseaseCondition(
                label: l10n.csS4BloodPressure,
                value: _bloodPressure,
                onChanged: (v) => setState(() => _bloodPressure = v),
              ),
              DiseaseCondition(
                label: l10n.csS4Albuminuria,
                value: _albuminuria,
                onChanged: (v) => setState(() => _albuminuria = v),
              ),
              DiseaseCondition(
                label: l10n.csS4Preeclampsia,
                value: _preeclampsia,
                onChanged: (v) => setState(() => _preeclampsia = v),
              ),
              DiseaseCondition(
                label: l10n.csS4Rubella,
                value: _rubella,
                onChanged: (v) => setState(() => _rubella = v),
              ),
              DiseaseCondition(
                label: l10n.csS4Bleeding,
                value: _bleeding,
                onChanged: (v) => setState(() => _bleeding = v),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q9: Infectious diseases ───────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS4InfectiousDiseases,
            value: _hadInfectiousDiseases,
            errorText: _errors['hadInfectiousDiseases'],
            onChanged: (v) => setState(() {
              _hadInfectiousDiseases = v;
              _errors['hadInfectiousDiseases'] = null;
            }),
            conditionalChild: _ConditionalField(
              label: l10n.csS4InfectiousDiseaseType,
              hint: l10n.csS4DiseaseTypeHint,
              note: l10n.csIfPreviousYes,
              controller: _infectiousDiseaseTypeCtrl,
              isRequired: _hadInfectiousDiseases == true,
              requiredMsg: _req(context),
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q10: Chronic diseases ─────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS4ChronicDiseases,
            value: _hasChronicDiseases,
            errorText: _errors['hasChronicDiseases'],
            onChanged: (v) => setState(() {
              _hasChronicDiseases = v;
              _errors['hasChronicDiseases'] = null;
            }),
            conditionalChild: _ConditionalField(
              label: l10n.csS4ChronicDiseaseType,
              hint: l10n.csS4DiseaseTypeHint,
              note: l10n.csIfPreviousYes,
              controller: _chronicDiseaseTypeCtrl,
              isRequired: _hasChronicDiseases == true,
              requiredMsg: _req(context),
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q11: Lab tests ────────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS4LabTests,
            value: _hadLabTests,
            errorText: _errors['hadLabTests'],
            onChanged: (v) => setState(() {
              _hadLabTests = v;
              _errors['hadLabTests'] = null;
            }),
            conditionalChild: _ConditionalField(
              label: l10n.csS4LabTestsType,
              hint: l10n.csS4LabTestsHint,
              note: l10n.csIfPreviousYes,
              controller: _labTestsDescCtrl,
              isRequired: _hadLabTests == true,
              requiredMsg: _req(context),
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q12: Stabilizing medication ───────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS4StabilizingMedication,
            value: _tookStabilizingMedication,
            errorText: _errors['tookStabilizingMedication'],
            onChanged: (v) => setState(() {
              _tookStabilizingMedication = v;
              _errors['tookStabilizingMedication'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q13: Total pregnancies (text) ─────────────────────────────
          FormLabeledField(
            label: l10n.csS4TotalPregnancies,
            hint: l10n.csS4TotalPregnanciesHint,
            controller: _totalPregnanciesCtrl,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? _req(context) : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q14: Miscarriage ──────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS4HadMiscarriage,
            value: _hadMiscarriage,
            errorText: _errors['hadMiscarriage'],
            onChanged: (v) => setState(() {
              _hadMiscarriage = v;
              _errors['hadMiscarriage'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q15: Smoking exposure ─────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS4ExposedToSmoking,
            value: _exposedToSmoking,
            errorText: _errors['exposedToSmoking'],
            onChanged: (v) => setState(() {
              _exposedToSmoking = v;
              _errors['exposedToSmoking'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p32),

          FormNextButton(
            label: l10n.csFormNext,
            onPressed: () => _submit(context),
            isLoading: widget.isSaving,
          ),
        ],
      ),
    );
  }
}

/// Private helper: a label + text field + italic note combo used
/// for every conditional follow-up text input in this section.
class _ConditionalField extends StatelessWidget {
  final String label;
  final String hint;
  final String note;
  final TextEditingController controller;
  final bool isRequired;
  final String requiredMsg;

  const _ConditionalField({
    required this.label,
    required this.hint,
    required this.note,
    required this.controller,
    required this.isRequired,
    required this.requiredMsg,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FormLabeledField(
          label: label,
          hint: hint,
          controller: controller,
          validator: (v) =>
              (isRequired && (v == null || v.trim().isEmpty)) ? requiredMsg : null,
        ),
        const SizedBox(height: 4),
        Text(
          note,
          style: const TextStyle(
            fontSize: 11.5,
            color: AppColors.textSecondary,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
