import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_labeled_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_radio_group.dart';
import '../widgets/form_yes_no_question.dart';

class Section5BirthPeriod extends StatefulWidget {
  final Section5Data? initialData;
  final void Function(Section5Data data) onNext;
  final bool isSaving;

  const Section5BirthPeriod({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section5BirthPeriod> createState() => _Section5BirthPeriodState();
}

class _Section5BirthPeriodState extends State<Section5BirthPeriod> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _breechDurationCtrl;
  late final TextEditingController _congenitalDeformitiesCtrl;
  late final TextEditingController _birthWeightCtrl;

  String? _birthType;
  String? _birthPlace;
  bool? _usedBirthTools;
  bool? _tookDeliveryMedication;
  bool? _oxygenDeficiency;
  bool? _umbilicalCordWrapped;
  bool? _breechPosition;
  bool? _hadJaundice;
  bool? _hadCongenitalDeformities;
  bool? _hadRhTest;

  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _breechDurationCtrl =
        TextEditingController(text: d?.breechDuration ?? '');
    _congenitalDeformitiesCtrl =
        TextEditingController(text: d?.congenitalDeformitiesType ?? '');
    _birthWeightCtrl = TextEditingController(text: d?.birthWeight ?? '');

    _birthType = d?.birthType.isEmpty ?? true ? null : d!.birthType;
    _birthPlace = d?.birthPlace.isEmpty ?? true ? null : d!.birthPlace;
    _usedBirthTools = d?.usedBirthTools;
    _tookDeliveryMedication = d?.tookDeliveryMedication;
    _oxygenDeficiency = d?.oxygenDeficiency;
    _umbilicalCordWrapped = d?.umbilicalCordWrapped;
    _breechPosition = d?.breechPosition;
    _hadJaundice = d?.hadJaundice;
    _hadCongenitalDeformities = d?.hadCongenitalDeformities;
    _hadRhTest = d?.hadRhTest;
  }

  @override
  void dispose() {
    _breechDurationCtrl.dispose();
    _congenitalDeformitiesCtrl.dispose();
    _birthWeightCtrl.dispose();
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

    void checkStr(String key, String? v) {
      if (v == null || v.isEmpty) {
        _errors[key] = _req(context);
        allValid = false;
      } else {
        _errors[key] = null;
      }
    }

    setState(() {
      checkStr('birthType', _birthType);
      checkStr('birthPlace', _birthPlace);
      checkBool('usedBirthTools', _usedBirthTools);
      checkBool('tookDeliveryMedication', _tookDeliveryMedication);
      checkBool('oxygenDeficiency', _oxygenDeficiency);
      checkBool('umbilicalCordWrapped', _umbilicalCordWrapped);
      checkBool('breechPosition', _breechPosition);
      checkBool('hadJaundice', _hadJaundice);
      checkBool('hadCongenitalDeformities', _hadCongenitalDeformities);
      checkBool('hadRhTest', _hadRhTest);
    });

    return formValid && allValid;
  }

  void _submit(BuildContext context) {
    if (!_validate(context)) return;
    widget.onNext(
      Section5Data(
        birthType: _birthType ?? '',
        birthPlace: _birthPlace ?? '',
        usedBirthTools: _usedBirthTools,
        tookDeliveryMedication: _tookDeliveryMedication,
        oxygenDeficiency: _oxygenDeficiency,
        umbilicalCordWrapped: _umbilicalCordWrapped,
        breechPosition: _breechPosition,
        breechDuration: _breechPosition == true
            ? _breechDurationCtrl.text.trim()
            : '',
        hadJaundice: _hadJaundice,
        hadCongenitalDeformities: _hadCongenitalDeformities,
        congenitalDeformitiesType: _hadCongenitalDeformities == true
            ? _congenitalDeformitiesCtrl.text.trim()
            : '',
        birthWeight: _birthWeightCtrl.text.trim(),
        hadRhTest: _hadRhTest,
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
            l10n.csSection5Title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            '(${l10n.csSection5Subtitle})',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.p24),

          // ── Q1: Birth type ────────────────────────────────────────────
          FormRadioGroup<String>(
            label: l10n.csS5BirthType,
            options: [
              RadioOption(label: l10n.csS5BirthTypeNatural, value: 'natural'),
              RadioOption(label: l10n.csS5BirthTypeCesarean, value: 'cesarean'),
            ],
            groupValue: _birthType,
            onChanged: (v) => setState(() {
              _birthType = v;
              _errors['birthType'] = null;
            }),
            errorText: _errors['birthType'],
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q2: Birth place ───────────────────────────────────────────
          FormRadioGroup<String>(
            label: l10n.csS5BirthPlace,
            options: [
              RadioOption(label: l10n.csS5BirthPlaceHome, value: 'home'),
              RadioOption(label: l10n.csS5BirthPlaceHospital, value: 'hospital'),
            ],
            groupValue: _birthPlace,
            onChanged: (v) => setState(() {
              _birthPlace = v;
              _errors['birthPlace'] = null;
            }),
            errorText: _errors['birthPlace'],
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q3: Birth tools ───────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS5UsedBirthTools,
            value: _usedBirthTools,
            errorText: _errors['usedBirthTools'],
            onChanged: (v) => setState(() {
              _usedBirthTools = v;
              _errors['usedBirthTools'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q4: Delivery medication ───────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS5TookDeliveryMedication,
            value: _tookDeliveryMedication,
            errorText: _errors['tookDeliveryMedication'],
            onChanged: (v) => setState(() {
              _tookDeliveryMedication = v;
              _errors['tookDeliveryMedication'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q5: Oxygen deficiency ─────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS5OxygenDeficiency,
            value: _oxygenDeficiency,
            errorText: _errors['oxygenDeficiency'],
            onChanged: (v) => setState(() {
              _oxygenDeficiency = v;
              _errors['oxygenDeficiency'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q6: Umbilical cord ────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS5UmbilicalCordWrapped,
            value: _umbilicalCordWrapped,
            errorText: _errors['umbilicalCordWrapped'],
            onChanged: (v) => setState(() {
              _umbilicalCordWrapped = v;
              _errors['umbilicalCordWrapped'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q7: Breech position ───────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS5BreechPosition,
            value: _breechPosition,
            errorText: _errors['breechPosition'],
            onChanged: (v) => setState(() {
              _breechPosition = v;
              _errors['breechPosition'] = null;
            }),
            conditionalChild: _ConditionalField(
              label: l10n.csS5BreechDurationLabel,
              hint: l10n.csS5BreechDurationHint,
              note: l10n.csIfPreviousYes,
              controller: _breechDurationCtrl,
              isRequired: _breechPosition == true,
              requiredMsg: _req(context),
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q8: Jaundice ──────────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS5HadJaundice,
            value: _hadJaundice,
            errorText: _errors['hadJaundice'],
            onChanged: (v) => setState(() {
              _hadJaundice = v;
              _errors['hadJaundice'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q9: Congenital deformities ────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS5HadCongenitalDeformities,
            value: _hadCongenitalDeformities,
            errorText: _errors['hadCongenitalDeformities'],
            onChanged: (v) => setState(() {
              _hadCongenitalDeformities = v;
              _errors['hadCongenitalDeformities'] = null;
            }),
            conditionalChild: _ConditionalField(
              label: l10n.csS5CongenitalDeformitiesType,
              hint: l10n.csS5CongenitalDeformitiesHint,
              note: l10n.csIfPreviousYes,
              controller: _congenitalDeformitiesCtrl,
              isRequired: _hadCongenitalDeformities == true,
              requiredMsg: _req(context),
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q10: Birth weight ─────────────────────────────────────────
          FormLabeledField(
            label: l10n.csS5BirthWeight,
            hint: l10n.csS5BirthWeightHint,
            controller: _birthWeightCtrl,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? _req(context) : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q11: RH test ──────────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS5HadRhTest,
            value: _hadRhTest,
            errorText: _errors['hadRhTest'],
            onChanged: (v) => setState(() {
              _hadRhTest = v;
              _errors['hadRhTest'] = null;
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
