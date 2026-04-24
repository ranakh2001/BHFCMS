import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_labeled_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_radio_group.dart';
import '../widgets/form_yes_no_question.dart';

class Section8MotorDevelopment extends StatefulWidget {
  final Section8Data? initialData;
  final void Function(Section8Data data) onNext;
  final bool isSaving;

  const Section8MotorDevelopment({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section8MotorDevelopment> createState() =>
      _Section8MotorDevelopmentState();
}

class _Section8MotorDevelopmentState extends State<Section8MotorDevelopment> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _teethingAgeCtrl;
  late final TextEditingController _visualImpairmentDegreeCtrl;
  late final TextEditingController _eyeDiseasesCtrl;
  late final TextEditingController _hearingImpairmentDegreeCtrl;
  late final TextEditingController _earDiseasesCtrl;
  late final TextEditingController _allergyTriggersCtrl;

  bool? _satAtRightTime;
  bool? _crawledAtRightTime;
  bool? _walkedAtRightTime;
  bool? _dropsThings;
  bool? _hasMovementDifficulties;
  bool? _isConstantlyMoving;
  bool? _hasVisualImpairment;
  bool? _hasEyeDiseases;
  bool? _hasHearingImpairment;
  bool? _hasEarDiseases;
  bool? _hasAllergies;
  String? _allergyType;

  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _teethingAgeCtrl = TextEditingController(text: d?.teethingAge ?? '');
    _visualImpairmentDegreeCtrl =
        TextEditingController(text: d?.visualImpairmentDegree ?? '');
    _eyeDiseasesCtrl = TextEditingController(text: d?.eyeDiseasesType ?? '');
    _hearingImpairmentDegreeCtrl =
        TextEditingController(text: d?.hearingImpairmentDegree ?? '');
    _earDiseasesCtrl = TextEditingController(text: d?.earDiseasesType ?? '');
    _allergyTriggersCtrl =
        TextEditingController(text: d?.allergyTriggers ?? '');

    _satAtRightTime = d?.satAtRightTime;
    _crawledAtRightTime = d?.crawledAtRightTime;
    _walkedAtRightTime = d?.walkedAtRightTime;
    _dropsThings = d?.dropsThings;
    _hasMovementDifficulties = d?.hasMovementDifficulties;
    _isConstantlyMoving = d?.isConstantlyMoving;
    _hasVisualImpairment = d?.hasVisualImpairment;
    _hasEyeDiseases = d?.hasEyeDiseases;
    _hasHearingImpairment = d?.hasHearingImpairment;
    _hasEarDiseases = d?.hasEarDiseases;
    _hasAllergies = d?.hasAllergies;
    _allergyType =
        d?.allergyType.isEmpty ?? true ? null : d!.allergyType;
  }

  @override
  void dispose() {
    _teethingAgeCtrl.dispose();
    _visualImpairmentDegreeCtrl.dispose();
    _eyeDiseasesCtrl.dispose();
    _hearingImpairmentDegreeCtrl.dispose();
    _earDiseasesCtrl.dispose();
    _allergyTriggersCtrl.dispose();
    super.dispose();
  }

  String _req(BuildContext context) =>
      AppLocalizations.of(context)!.validationRequired;

  bool _validate(BuildContext context) {
    final formValid = _formKey.currentState?.validate() ?? false;
    bool allValid = true;

    void checkBool(String key, bool? v) {
      if (v == null) {
        _errors[key] = _req(context);
        allValid = false;
      } else {
        _errors[key] = null;
      }
    }

    setState(() {
      checkBool('satAtRightTime', _satAtRightTime);
      checkBool('crawledAtRightTime', _crawledAtRightTime);
      checkBool('walkedAtRightTime', _walkedAtRightTime);
      checkBool('dropsThings', _dropsThings);
      checkBool('hasMovementDifficulties', _hasMovementDifficulties);
      checkBool('isConstantlyMoving', _isConstantlyMoving);
      checkBool('hasVisualImpairment', _hasVisualImpairment);
      checkBool('hasEyeDiseases', _hasEyeDiseases);
      checkBool('hasHearingImpairment', _hasHearingImpairment);
      checkBool('hasEarDiseases', _hasEarDiseases);
      checkBool('hasAllergies', _hasAllergies);
    });

    return formValid && allValid;
  }

  void _submit(BuildContext context) {
    if (!_validate(context)) return;
    widget.onNext(
      Section8Data(
        satAtRightTime: _satAtRightTime,
        crawledAtRightTime: _crawledAtRightTime,
        walkedAtRightTime: _walkedAtRightTime,
        teethingAge: _teethingAgeCtrl.text.trim(),
        dropsThings: _dropsThings,
        hasMovementDifficulties: _hasMovementDifficulties,
        isConstantlyMoving: _isConstantlyMoving,
        hasVisualImpairment: _hasVisualImpairment,
        visualImpairmentDegree: _hasVisualImpairment == true
            ? _visualImpairmentDegreeCtrl.text.trim()
            : '',
        hasEyeDiseases: _hasEyeDiseases,
        eyeDiseasesType:
            _hasEyeDiseases == true ? _eyeDiseasesCtrl.text.trim() : '',
        hasHearingImpairment: _hasHearingImpairment,
        hearingImpairmentDegree: _hasHearingImpairment == true
            ? _hearingImpairmentDegreeCtrl.text.trim()
            : '',
        hasEarDiseases: _hasEarDiseases,
        earDiseasesType:
            _hasEarDiseases == true ? _earDiseasesCtrl.text.trim() : '',
        hasAllergies: _hasAllergies,
        allergyType:
            _hasAllergies == true ? (_allergyType ?? '') : '',
        allergyTriggers: _hasAllergies == true
            ? _allergyTriggersCtrl.text.trim()
            : '',
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
          // ── Header ────────────────────────────────────────────────────
          Text(
            l10n.csSection8Title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            '(${l10n.csSection8Subtitle})',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.p24),

          // ── Q1: Sat at right time ─────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS8SatAtRightTime,
            value: _satAtRightTime,
            errorText: _errors['satAtRightTime'],
            onChanged: (v) => setState(() {
              _satAtRightTime = v;
              _errors['satAtRightTime'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q2: Crawled at right time ─────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS8CrawledAtRightTime,
            value: _crawledAtRightTime,
            errorText: _errors['crawledAtRightTime'],
            onChanged: (v) => setState(() {
              _crawledAtRightTime = v;
              _errors['crawledAtRightTime'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q3: Walked at right time ──────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS8WalkedAtRightTime,
            value: _walkedAtRightTime,
            errorText: _errors['walkedAtRightTime'],
            onChanged: (v) => setState(() {
              _walkedAtRightTime = v;
              _errors['walkedAtRightTime'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q4: Teething age ──────────────────────────────────────────
          FormLabeledField(
            label: l10n.csS8TeethingAge,
            hint: l10n.csS8TeethingAgeHint,
            controller: _teethingAgeCtrl,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? _req(context) : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q5: Drops things ──────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS8DropsThings,
            value: _dropsThings,
            errorText: _errors['dropsThings'],
            onChanged: (v) => setState(() {
              _dropsThings = v;
              _errors['dropsThings'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q6: Movement difficulties ─────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS8HasMovementDifficulties,
            value: _hasMovementDifficulties,
            errorText: _errors['hasMovementDifficulties'],
            onChanged: (v) => setState(() {
              _hasMovementDifficulties = v;
              _errors['hasMovementDifficulties'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q7: Constantly moving ─────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS8IsConstantlyMoving,
            value: _isConstantlyMoving,
            errorText: _errors['isConstantlyMoving'],
            onChanged: (v) => setState(() {
              _isConstantlyMoving = v;
              _errors['isConstantlyMoving'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q8: Visual impairment ─────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS8HasVisualImpairment,
            value: _hasVisualImpairment,
            errorText: _errors['hasVisualImpairment'],
            onChanged: (v) => setState(() {
              _hasVisualImpairment = v;
              _errors['hasVisualImpairment'] = null;
            }),
            conditionalChild: _ConditionalField(
              label: l10n.csS8VisualImpairmentDegree,
              hint: l10n.csS8VisualImpairmentHint,
              note: l10n.csIfPreviousYes,
              controller: _visualImpairmentDegreeCtrl,
              isRequired: _hasVisualImpairment == true,
              requiredMsg: _req(context),
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q9: Eye diseases ──────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS8HasEyeDiseases,
            value: _hasEyeDiseases,
            errorText: _errors['hasEyeDiseases'],
            onChanged: (v) => setState(() {
              _hasEyeDiseases = v;
              _errors['hasEyeDiseases'] = null;
            }),
            conditionalChild: _ConditionalField(
              label: l10n.csS8EyeDiseasesType,
              hint: l10n.csS8EyeDiseasesHint,
              note: l10n.csIfPreviousYes,
              controller: _eyeDiseasesCtrl,
              isRequired: _hasEyeDiseases == true,
              requiredMsg: _req(context),
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q10: Hearing impairment ───────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS8HasHearingImpairment,
            value: _hasHearingImpairment,
            errorText: _errors['hasHearingImpairment'],
            onChanged: (v) => setState(() {
              _hasHearingImpairment = v;
              _errors['hasHearingImpairment'] = null;
            }),
            conditionalChild: _ConditionalField(
              label: l10n.csS8HearingImpairmentDegree,
              hint: l10n.csS8HearingImpairmentHint,
              note: l10n.csIfPreviousYes,
              controller: _hearingImpairmentDegreeCtrl,
              isRequired: _hasHearingImpairment == true,
              requiredMsg: _req(context),
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q11: Ear diseases ─────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS8HasEarDiseases,
            value: _hasEarDiseases,
            errorText: _errors['hasEarDiseases'],
            onChanged: (v) => setState(() {
              _hasEarDiseases = v;
              _errors['hasEarDiseases'] = null;
            }),
            conditionalChild: _ConditionalField(
              label: l10n.csS8EarDiseasesType,
              hint: l10n.csS8EarDiseasesHint,
              note: l10n.csIfPreviousYes,
              controller: _earDiseasesCtrl,
              isRequired: _hasEarDiseases == true,
              requiredMsg: _req(context),
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q12: Allergies ────────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS8HasAllergies,
            value: _hasAllergies,
            errorText: _errors['hasAllergies'],
            onChanged: (v) => setState(() {
              _hasAllergies = v;
              _errors['hasAllergies'] = null;
            }),
            conditionalChild: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Allergy type radio
                FormRadioGroup<String>(
                  label: l10n.csS8AllergyType,
                  options: [
                    RadioOption(
                        label: l10n.csS8AllergyFood, value: 'food'),
                    RadioOption(
                        label: l10n.csS8AllergyEnvironmental,
                        value: 'environmental'),
                  ],
                  groupValue: _allergyType,
                  onChanged: (v) =>
                      setState(() => _allergyType = v),
                ),
                const SizedBox(height: AppSpacing.p8),
                // Allergy triggers
                FormLabeledField(
                  label: l10n.csS8AllergyTriggers,
                  hint: l10n.csS8AllergyTriggersHint,
                  controller: _allergyTriggersCtrl,
                  validator: (v) =>
                      (_hasAllergies == true &&
                              (v == null || v.trim().isEmpty))
                          ? _req(context)
                          : null,
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.csIfPreviousYes,
                  style: const TextStyle(
                    fontSize: 11.5,
                    color: AppColors.textSecondary,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
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
              (isRequired && (v == null || v.trim().isEmpty))
                  ? requiredMsg
                  : null,
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
