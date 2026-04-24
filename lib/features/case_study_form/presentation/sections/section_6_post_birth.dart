import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_disease_grid.dart';
import '../widgets/form_labeled_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_radio_group.dart';
import '../widgets/form_yes_no_question.dart';

class Section6PostBirth extends StatefulWidget {
  final Section6Data? initialData;
  final void Function(Section6Data data) onNext;
  final bool isSaving;

  const Section6PostBirth({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section6PostBirth> createState() => _Section6PostBirthState();
}

class _Section6PostBirthState extends State<Section6PostBirth> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _medicationTypeCtrl;
  late final TextEditingController _chronicDiseaseCtrl;
  late final TextEditingController _surgicalOperationsCtrl;

  String? _breastfeedingType;
  bool? _meningitis;
  bool? _measles;
  bool? _chickenpox;
  bool? _mumps;
  bool? _tookLongTermMedication;
  bool? _hadFallsOrAccidents;
  bool? _hadHipDislocationExam;
  bool? _hasChronicDiseases;
  bool? _ateWell;
  bool? _hospitalizedBefore;

  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _medicationTypeCtrl =
        TextEditingController(text: d?.longTermMedicationType ?? '');
    _chronicDiseaseCtrl =
        TextEditingController(text: d?.chronicDiseaseType ?? '');
    _surgicalOperationsCtrl =
        TextEditingController(text: d?.surgicalOperations ?? '');

    _breastfeedingType =
        d?.breastfeedingType.isEmpty ?? true ? null : d!.breastfeedingType;
    final dis = d?.diseases ?? const PostBirthDiseaseFlags();
    _meningitis = dis.meningitis;
    _measles = dis.measles;
    _chickenpox = dis.chickenpox;
    _mumps = dis.mumps;
    _tookLongTermMedication = d?.tookLongTermMedication;
    _hadFallsOrAccidents = d?.hadFallsOrAccidents;
    _hadHipDislocationExam = d?.hadHipDislocationExam;
    _hasChronicDiseases = d?.hasChronicDiseases;
    _ateWell = d?.ateWell;
    _hospitalizedBefore = d?.hospitalizedBefore;
  }

  @override
  void dispose() {
    _medicationTypeCtrl.dispose();
    _chronicDiseaseCtrl.dispose();
    _surgicalOperationsCtrl.dispose();
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
      if (_breastfeedingType == null) {
        _errors['breastfeedingType'] = _req(context);
        allValid = false;
      } else {
        _errors['breastfeedingType'] = null;
      }
      checkBool('tookLongTermMedication', _tookLongTermMedication);
      checkBool('hadFallsOrAccidents', _hadFallsOrAccidents);
      checkBool('hadHipDislocationExam', _hadHipDislocationExam);
      checkBool('hasChronicDiseases', _hasChronicDiseases);
      checkBool('ateWell', _ateWell);
      checkBool('hospitalizedBefore', _hospitalizedBefore);
    });

    return formValid && allValid;
  }

  void _submit(BuildContext context) {
    if (!_validate(context)) return;
    widget.onNext(
      Section6Data(
        breastfeedingType: _breastfeedingType ?? '',
        diseases: PostBirthDiseaseFlags(
          meningitis: _meningitis,
          measles: _measles,
          chickenpox: _chickenpox,
          mumps: _mumps,
        ),
        tookLongTermMedication: _tookLongTermMedication,
        longTermMedicationType: _tookLongTermMedication == true
            ? _medicationTypeCtrl.text.trim()
            : '',
        hadFallsOrAccidents: _hadFallsOrAccidents,
        hadHipDislocationExam: _hadHipDislocationExam,
        hasChronicDiseases: _hasChronicDiseases,
        chronicDiseaseType: _hasChronicDiseases == true
            ? _chronicDiseaseCtrl.text.trim()
            : '',
        ateWell: _ateWell,
        hospitalizedBefore: _hospitalizedBefore,
        surgicalOperations: _hospitalizedBefore == true
            ? _surgicalOperationsCtrl.text.trim()
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
            l10n.csSection6Title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            '(${l10n.csSection6Subtitle})',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.p24),

          // ── Q1: Breastfeeding type ────────────────────────────────────
          FormRadioGroup<String>(
            label: l10n.csS6BreastfeedingType,
            options: [
              RadioOption(label: l10n.csS6BreastfeedingNatural, value: 'natural'),
              RadioOption(
                  label: l10n.csS6BreastfeedingArtificial, value: 'artificial'),
              RadioOption(label: l10n.csS6BreastfeedingBoth, value: 'both'),
            ],
            groupValue: _breastfeedingType,
            onChanged: (v) => setState(() {
              _breastfeedingType = v;
              _errors['breastfeedingType'] = null;
            }),
            errorText: _errors['breastfeedingType'],
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q2: Diseases grid ─────────────────────────────────────────
          FormDiseaseGrid(
            label: l10n.csS6Diseases,
            conditions: [
              DiseaseCondition(
                label: l10n.csS6Meningitis,
                value: _meningitis,
                onChanged: (v) => setState(() => _meningitis = v),
              ),
              DiseaseCondition(
                label: l10n.csS6Measles,
                value: _measles,
                onChanged: (v) => setState(() => _measles = v),
              ),
              DiseaseCondition(
                label: l10n.csS6Chickenpox,
                value: _chickenpox,
                onChanged: (v) => setState(() => _chickenpox = v),
              ),
              DiseaseCondition(
                label: l10n.csS6Mumps,
                value: _mumps,
                onChanged: (v) => setState(() => _mumps = v),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q3: Long-term medication ──────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS6TookLongTermMedication,
            value: _tookLongTermMedication,
            errorText: _errors['tookLongTermMedication'],
            onChanged: (v) => setState(() {
              _tookLongTermMedication = v;
              _errors['tookLongTermMedication'] = null;
            }),
            conditionalChild: _ConditionalField(
              label: l10n.csS6MedicationType,
              hint: l10n.csS6MedicationTypeHint,
              note: l10n.csIfPreviousYes,
              controller: _medicationTypeCtrl,
              isRequired: _tookLongTermMedication == true,
              requiredMsg: _req(context),
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q4: Falls or accidents ────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS6HadFallsOrAccidents,
            value: _hadFallsOrAccidents,
            errorText: _errors['hadFallsOrAccidents'],
            onChanged: (v) => setState(() {
              _hadFallsOrAccidents = v;
              _errors['hadFallsOrAccidents'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q5: Hip dislocation exam ──────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS6HadHipDislocationExam,
            value: _hadHipDislocationExam,
            errorText: _errors['hadHipDislocationExam'],
            onChanged: (v) => setState(() {
              _hadHipDislocationExam = v;
              _errors['hadHipDislocationExam'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q6: Chronic diseases ──────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS6HasChronicDiseases,
            value: _hasChronicDiseases,
            errorText: _errors['hasChronicDiseases'],
            onChanged: (v) => setState(() {
              _hasChronicDiseases = v;
              _errors['hasChronicDiseases'] = null;
            }),
            conditionalChild: _ConditionalField(
              label: l10n.csS6ChronicDiseaseType,
              hint: l10n.csS6ChronicDiseaseHint,
              note: l10n.csIfPreviousYes,
              controller: _chronicDiseaseCtrl,
              isRequired: _hasChronicDiseases == true,
              requiredMsg: _req(context),
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q7: Ate well ──────────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS6AteWell,
            value: _ateWell,
            errorText: _errors['ateWell'],
            onChanged: (v) => setState(() {
              _ateWell = v;
              _errors['ateWell'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q8: Hospitalized ──────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS6HospitalizedBefore,
            value: _hospitalizedBefore,
            errorText: _errors['hospitalizedBefore'],
            onChanged: (v) => setState(() {
              _hospitalizedBefore = v;
              _errors['hospitalizedBefore'] = null;
            }),
            conditionalChild: _ConditionalField(
              label: l10n.csS6SurgicalOperations,
              hint: l10n.csS6SurgicalOperationsHint,
              note: l10n.csIfPreviousYes,
              controller: _surgicalOperationsCtrl,
              isRequired: _hospitalizedBefore == true,
              requiredMsg: _req(context),
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
