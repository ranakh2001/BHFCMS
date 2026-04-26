import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_labeled_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_radio_group.dart';
import '../widgets/form_yes_no_question.dart';

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

  // Pregnancy basics
  late final TextEditingController _liveBirthCtrl;
  late final TextEditingController _stillbirthCtrl;
  late final TextEditingController _motherAgeCtrl;
  late final TextEditingController _fatherAgeCtrl;
  String _parentKinship = '';
  bool? _wasPlanned;
  bool? _usedFertilityTreatment;

  // Medications
  String _medications = '';
  late final TextEditingController _medicationsOtherCtrl;

  // Pregnancy difficulties (tri-state: 'yes'|'no'|'unsure')
  String _feverInfection = '';
  String _bleedingMiscarriage = '';
  String _highBpDiabetes = '';
  String _severeStressAccidents = '';

  // Labor & delivery
  String _usedPitocin = '';
  String _prematureBirth = '';
  late final TextEditingController _prematureWeeksCtrl;
  String _deliveryComplications = '';
  late final TextEditingController _complicationsTypeCtrl;
  String _nicuResuscitation = '';
  late final TextEditingController _nicuReasonCtrl;
  late final TextEditingController _nicuDurationCtrl;
  String _deliveryType = '';
  late final TextEditingController _cesareanReasonCtrl;

  // First month problems (multi-select)
  late Set<String> _firstMonthProblems;

  // Validation errors
  String? _kinshipError;
  String? _plannedError;
  String? _fertilityError;
  String? _medicationsError;

  static const _firstMonthOptions = [
    'breastfeeding',
    'sleep',
    'jaundice',
    'congenital',
    'fainting',
    'crying',
    'digestive',
    'reflux',
  ];

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _liveBirthCtrl = TextEditingController(text: d?.liveBirthCount ?? '');
    _stillbirthCtrl = TextEditingController(text: d?.stillbirthCount ?? '');
    _motherAgeCtrl = TextEditingController(text: d?.motherAgeAtBirth ?? '');
    _fatherAgeCtrl = TextEditingController(text: d?.fatherAgeAtBirth ?? '');
    _parentKinship = d?.parentKinship ?? '';
    _wasPlanned = d?.wasPlanned;
    _usedFertilityTreatment = d?.usedFertilityTreatment;
    _medications = d?.medications ?? '';
    _medicationsOtherCtrl = TextEditingController(
      text: d?.medicationsOther ?? '',
    );
    _feverInfection = d?.feverInfection ?? '';
    _bleedingMiscarriage = d?.bleedingMiscarriage ?? '';
    _highBpDiabetes = d?.highBpDiabetes ?? '';
    _severeStressAccidents = d?.severeStressAccidents ?? '';
    _usedPitocin = d?.usedPitocin ?? '';
    _prematureBirth = d?.prematureBirth ?? '';
    _prematureWeeksCtrl = TextEditingController(text: d?.prematureWeeks ?? '');
    _deliveryComplications = d?.deliveryComplications ?? '';
    _complicationsTypeCtrl = TextEditingController(
      text: d?.complicationsType ?? '',
    );
    _nicuResuscitation = d?.nicuResuscitation ?? '';
    _nicuReasonCtrl = TextEditingController(text: d?.nicuReason ?? '');
    _nicuDurationCtrl = TextEditingController(text: d?.nicuDuration ?? '');
    _deliveryType = d?.deliveryType ?? '';
    _cesareanReasonCtrl = TextEditingController(text: d?.cesareanReason ?? '');
    _firstMonthProblems = Set.from(d?.firstMonthProblems ?? []);
  }

  @override
  void dispose() {
    _liveBirthCtrl.dispose();
    _stillbirthCtrl.dispose();
    _motherAgeCtrl.dispose();
    _fatherAgeCtrl.dispose();
    _medicationsOtherCtrl.dispose();
    _prematureWeeksCtrl.dispose();
    _complicationsTypeCtrl.dispose();
    _nicuReasonCtrl.dispose();
    _nicuDurationCtrl.dispose();
    _cesareanReasonCtrl.dispose();
    super.dispose();
  }

  bool _validate(AppLocalizations l10n) {
    final formValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      _kinshipError = _parentKinship.isEmpty ? l10n.validationRequired : null;
      _plannedError = _wasPlanned == null ? l10n.validationRequired : null;
      _fertilityError = _usedFertilityTreatment == null
          ? l10n.validationRequired
          : null;
      _medicationsError = _medications.isEmpty ? l10n.validationRequired : null;
    });
    return formValid &&
        _kinshipError == null &&
        _plannedError == null &&
        _fertilityError == null &&
        _medicationsError == null;
  }

  void _submit(AppLocalizations l10n) {
    if (!_validate(l10n)) return;
    widget.onNext(
      Section3Data(
        liveBirthCount: _liveBirthCtrl.text.trim(),
        stillbirthCount: _stillbirthCtrl.text.trim(),
        motherAgeAtBirth: _motherAgeCtrl.text.trim(),
        fatherAgeAtBirth: _fatherAgeCtrl.text.trim(),
        parentKinship: _parentKinship,
        wasPlanned: _wasPlanned,
        usedFertilityTreatment: _usedFertilityTreatment,
        medications: _medications,
        medicationsOther: _medications == 'other'
            ? _medicationsOtherCtrl.text.trim()
            : '',
        feverInfection: _feverInfection,
        bleedingMiscarriage: _bleedingMiscarriage,
        highBpDiabetes: _highBpDiabetes,
        severeStressAccidents: _severeStressAccidents,
        usedPitocin: _usedPitocin,
        prematureBirth: _prematureBirth,
        prematureWeeks: _prematureBirth == 'yes'
            ? _prematureWeeksCtrl.text.trim()
            : '',
        deliveryComplications: _deliveryComplications,
        complicationsType: _deliveryComplications == 'yes'
            ? _complicationsTypeCtrl.text.trim()
            : '',
        nicuResuscitation: _nicuResuscitation,
        nicuReason: _nicuResuscitation == 'yes'
            ? _nicuReasonCtrl.text.trim()
            : '',
        nicuDuration: _nicuResuscitation == 'yes'
            ? _nicuDurationCtrl.text.trim()
            : '',
        deliveryType: _deliveryType,
        cesareanReason: _deliveryType == 'cesarean'
            ? _cesareanReasonCtrl.text.trim()
            : '',
        firstMonthProblems: _firstMonthProblems.toList(),
      ),
    );
  }

  String _firstMonthLabel(String key, AppLocalizations l10n) {
    switch (key) {
      case 'breastfeeding':
        return l10n.csFirstMonthBreastfeeding;
      case 'sleep':
        return l10n.csFirstMonthSleep;
      case 'jaundice':
        return l10n.csFirstMonthJaundice;
      case 'congenital':
        return l10n.csFirstMonthCongenital;
      case 'fainting':
        return l10n.csFirstMonthFainting;
      case 'crying':
        return l10n.csFirstMonthCrying;
      case 'digestive':
        return l10n.csFirstMonthDigestive;
      case 'reflux':
        return l10n.csFirstMonthReflux;
      default:
        return key;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = ResponsiveHelper(context);

    final triOptions = [
      RadioOption(label: l10n.csYes, value: 'yes'),
      RadioOption(label: l10n.csNo, value: 'no'),
      RadioOption(label: l10n.csTriUnsure, value: 'unsure'),
    ];

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Title ─────────────────────────────────────────────────────────
          Text(
            l10n.csSection3Title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.p16),

          // ══════════════════════════════════════════════════════════════════
          // SUBSECTION: Pregnancy and Birth
          // ══════════════════════════════════════════════════════════════════
          _SectionDivider(label: l10n.csPregnancyBirthSubsection),
          const SizedBox(height: AppSpacing.p16),

          // Live births & deaths side by side
          Row(
            children: [
              Expanded(
                child: _NumberField(
                  label: l10n.csLiveBirthCount,
                  hint: l10n.csLiveBirthCountHint,
                  controller: _liveBirthCtrl,
                ),
              ),
              SizedBox(width: res.scaleSpacing(12)),
              Expanded(
                child: _NumberField(
                  label: l10n.csStillbirthCount,
                  hint: l10n.csStillbirthCountHint,
                  controller: _stillbirthCtrl,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.p12),

          // Mother & father age side by side
          Row(
            children: [
              Expanded(
                child: _NumberField(
                  label: l10n.csMotherAgeAtBirth,
                  hint: l10n.csMotherAgeAtBirthHint,
                  controller: _motherAgeCtrl,
                ),
              ),
              SizedBox(width: res.scaleSpacing(12)),
              Expanded(
                child: _NumberField(
                  label: l10n.csFatherAgeAtBirth,
                  hint: l10n.csFatherAgeAtBirthHint,
                  controller: _fatherAgeCtrl,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.p16),

          // Parent kinship
          FormRadioGroup<String>(
            label: l10n.csParentKinship,
            groupValue: _parentKinship.isEmpty ? null : _parentKinship,
            errorText: _kinshipError,
            onChanged: (v) => setState(() {
              _parentKinship = v ?? '';
              _kinshipError = null;
            }),
            options: [
              RadioOption(label: l10n.csKinshipFirst, value: 'first'),
              RadioOption(label: l10n.csKinshipSecond, value: 'second'),
              RadioOption(label: l10n.csKinshipNone, value: 'none'),
            ],
          ),
          const SizedBox(height: AppSpacing.p16),

          // Was pregnancy planned?
          FormYesNoQuestion(
            label: l10n.csWasPregnancyPlanned,
            value: _wasPlanned,
            errorText: _plannedError,
            onChanged: (v) => setState(() {
              _wasPlanned = v;
              _plannedError = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // Used fertility treatment?
          FormYesNoQuestion(
            label: l10n.csUsedFertilityTreatment,
            value: _usedFertilityTreatment,
            errorText: _fertilityError,
            onChanged: (v) => setState(() {
              _usedFertilityTreatment = v;
              _fertilityError = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // Medications during pregnancy
          FormRadioGroup<String>(
            label: l10n.csMedicationsTitle,
            groupValue: _medications.isEmpty ? null : _medications,
            errorText: _medicationsError,
            onChanged: (v) => setState(() {
              _medications = v ?? '';
              _medicationsError = null;
            }),
            options: [
              RadioOption(label: l10n.csMedVitamins, value: 'vitamins'),
              RadioOption(label: l10n.csMedSupplements, value: 'supplements'),
              RadioOption(
                label: l10n.csMedAntidepressants,
                value: 'antidepressants',
              ),
              RadioOption(label: l10n.csMedAntiSeizure, value: 'anti_seizure'),
              RadioOption(label: l10n.csMedOther, value: 'other'),
              RadioOption(label: l10n.csMedUnsure, value: 'unsure'),
            ],
          ),
          if (_medications == 'other') ...[
            const SizedBox(height: AppSpacing.p8),
            Text(
              l10n.csMedicationsOtherNote,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 6),
            FormLabeledField(
              label: l10n.csMedicationsTitle,
              hint: l10n.csMedicationsOtherHint,
              controller: _medicationsOtherCtrl,
              validator: (v) =>
                  (_medications == 'other' && (v == null || v.trim().isEmpty))
                  ? l10n.validationRequired
                  : null,
            ),
          ],
          const SizedBox(height: AppSpacing.p20),

          // ══════════════════════════════════════════════════════════════════
          // SUBSECTION: Pregnancy difficulties
          // ══════════════════════════════════════════════════════════════════
          _SectionDivider(label: l10n.csPregnancyDifficultiesSection),
          const SizedBox(height: AppSpacing.p16),

          _TriStateRow(
            label: l10n.csFeverInfection,
            value: _feverInfection,
            options: triOptions,
            onChanged: (v) => setState(() => _feverInfection = v),
          ),
          const SizedBox(height: AppSpacing.p12),
          _TriStateRow(
            label: l10n.csBleedingMiscarriage,
            value: _bleedingMiscarriage,
            options: triOptions,
            onChanged: (v) => setState(() => _bleedingMiscarriage = v),
          ),
          const SizedBox(height: AppSpacing.p12),
          _TriStateRow(
            label: l10n.csHighBpDiabetes,
            value: _highBpDiabetes,
            options: triOptions,
            onChanged: (v) => setState(() => _highBpDiabetes = v),
          ),
          const SizedBox(height: AppSpacing.p12),
          _TriStateRow(
            label: l10n.csSevereStressAccidents,
            value: _severeStressAccidents,
            options: triOptions,
            onChanged: (v) => setState(() => _severeStressAccidents = v),
          ),
          const SizedBox(height: AppSpacing.p20),

          // ══════════════════════════════════════════════════════════════════
          // SUBSECTION: Labor and delivery
          // ══════════════════════════════════════════════════════════════════
          _SectionDivider(label: l10n.csLaborDeliverySection),
          const SizedBox(height: AppSpacing.p16),

          // Pitocin
          _TriStateRow(
            label: l10n.csUsedPitocin,
            value: _usedPitocin,
            options: triOptions,
            onChanged: (v) => setState(() => _usedPitocin = v),
          ),
          const SizedBox(height: AppSpacing.p12),

          // Premature birth
          _TriStateRow(
            label: l10n.csPrematureBirth,
            value: _prematureBirth,
            options: triOptions,
            onChanged: (v) => setState(() => _prematureBirth = v),
          ),
          if (_prematureBirth == 'yes') ...[
            const SizedBox(height: AppSpacing.p8),
            _ConditionalNote(text: l10n.csIfYes),
            const SizedBox(height: 6),
            FormLabeledField(
              label: l10n.csPrematureWeeks,
              hint: l10n.csPrematureWeeksHint,
              controller: _prematureWeeksCtrl,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ],
          const SizedBox(height: AppSpacing.p12),

          // Complications
          _TriStateRow(
            label: l10n.csDeliveryComplications,
            value: _deliveryComplications,
            options: triOptions,
            onChanged: (v) => setState(() => _deliveryComplications = v),
          ),
          if (_deliveryComplications == 'yes') ...[
            const SizedBox(height: AppSpacing.p8),
            _ConditionalNote(text: l10n.csIfYes),
            const SizedBox(height: 6),
            FormLabeledField(
              label: l10n.csDeliveryComplicationsType,
              hint: l10n.csDeliveryComplicationsHint,
              controller: _complicationsTypeCtrl,
            ),
          ],
          const SizedBox(height: AppSpacing.p12),

          // NICU / Resuscitation
          _TriStateRow(
            label: l10n.csNICU,
            value: _nicuResuscitation,
            options: triOptions,
            onChanged: (v) => setState(() => _nicuResuscitation = v),
          ),
          if (_nicuResuscitation == 'yes') ...[
            const SizedBox(height: AppSpacing.p8),
            _ConditionalNote(text: l10n.csIfYes),
            const SizedBox(height: 6),
            FormLabeledField(
              label: l10n.csNICUReason,
              hint: l10n.csNICUReasonHint,
              controller: _nicuReasonCtrl,
            ),
            const SizedBox(height: AppSpacing.p8),
            FormLabeledField(
              label: l10n.csNICUDuration,
              hint: l10n.csNICUDurationHint,
              controller: _nicuDurationCtrl,
            ),
          ],
          const SizedBox(height: AppSpacing.p16),

          // Delivery type
          FormRadioGroup<String>(
            label: l10n.csDeliveryType,
            groupValue: _deliveryType.isEmpty ? null : _deliveryType,
            onChanged: (v) => setState(() => _deliveryType = v ?? ''),
            options: [
              RadioOption(label: l10n.csDeliveryNatural, value: 'natural'),
              RadioOption(label: l10n.csDeliveryCesarean, value: 'cesarean'),
            ],
          ),
          if (_deliveryType == 'cesarean') ...[
            const SizedBox(height: AppSpacing.p8),
            _ConditionalNote(text: l10n.csIfYes),
            const SizedBox(height: 6),
            FormLabeledField(
              label: l10n.csCesareanReason,
              hint: l10n.csCesareanReasonHint,
              controller: _cesareanReasonCtrl,
            ),
          ],
          const SizedBox(height: AppSpacing.p20),

          // ── First month problems (checkboxes) ─────────────────────────────
          Text(
            l10n.csFirstMonthProblems,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: res.scaleSpacing(8),
            runSpacing: res.scaleSpacing(8),
            children: _firstMonthOptions.map((key) {
              final isChecked = _firstMonthProblems.contains(key);
              return GestureDetector(
                onTap: () => setState(() {
                  if (isChecked) {
                    _firstMonthProblems.remove(key);
                  } else {
                    _firstMonthProblems.add(key);
                  }
                }),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: isChecked ? AppColors.primary : Colors.white,
                        border: Border.all(
                          color: isChecked
                              ? AppColors.primary
                              : Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                      child: isChecked
                          ? const Icon(
                              Icons.check,
                              size: 14,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _firstMonthLabel(key, l10n),
                      style: TextStyle(
                        fontSize: res.scaleText(13),
                        color: isChecked
                            ? AppColors.primary
                            : AppColors.textPrimary,
                        fontWeight: isChecked
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
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

// ── Helpers ───────────────────────────────────────────────────────────────────

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

class _ConditionalNote extends StatelessWidget {
  final String text;
  const _ConditionalNote({required this.text});

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: Theme.of(context).textTheme.bodySmall?.copyWith(
      color: AppColors.textSecondary,
      fontStyle: FontStyle.italic,
    ),
    textAlign: TextAlign.start,
  );
}

class _NumberField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const _NumberField({
    required this.label,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.start,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
            filled: true,
            fillColor: const Color(0xFFF3F4F6),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

/// A labeled row of radio options (used for tri-state and binary questions).
class _TriStateRow extends StatelessWidget {
  final String label;
  final String value;
  final List<RadioOption<String>> options;
  final void Function(String) onChanged;

  const _TriStateRow({
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        // Options on the leading side
        Wrap(
          spacing: 0,
          children: options.map((opt) {
            final isSelected = value == opt.value;
            return GestureDetector(
              onTap: () => onChanged(opt.value),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                      child: isSelected
                          ? Center(
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary,
                                ),
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      opt.label,
                      style: TextStyle(
                        fontSize: 12,
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.textPrimary,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                    const SizedBox(width: 4),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(width: 8),

        // Label on the trailing side
      ],
    );
  }
}
