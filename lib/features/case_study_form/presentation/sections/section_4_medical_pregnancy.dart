import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_card.dart';
import '../widgets/form_dropdown_field.dart';
import '../widgets/form_labeled_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_notes_field.dart';
import '../widgets/form_section_header.dart';
import '../widgets/form_subsection_title.dart';
import '../widgets/form_yes_no_question.dart';

// ── Local mutable state for one treatment entry ────────────────────────────
class _TreatState {
  String type;
  final TextEditingController org;
  final TextEditingController duration;
  final TextEditingController notes;

  _TreatState({
    this.type = '',
    String org = '',
    String duration = '',
    String notes = '',
  }) : org = TextEditingController(text: org),
       duration = TextEditingController(text: duration),
       notes = TextEditingController(text: notes);

  void dispose() {
    org.dispose();
    duration.dispose();
    notes.dispose();
  }

  TreatmentEntry toEntry() => TreatmentEntry(
    treatmentType: type,
    organization: org.text.trim(),
    duration: duration.text.trim(),
    notes: notes.text.trim(),
  );
}

// ── Local mutable state for one medication entry ───────────────────────────
class _MedState {
  final TextEditingController name;
  final TextEditingController dosage;
  final TextEditingController duration;
  final TextEditingController notes;

  _MedState({
    String name = '',
    String dosage = '',
    String duration = '',
    String notes = '',
  }) : name = TextEditingController(text: name),
       dosage = TextEditingController(text: dosage),
       duration = TextEditingController(text: duration),
       notes = TextEditingController(text: notes);

  void dispose() {
    name.dispose();
    dosage.dispose();
    duration.dispose();
    notes.dispose();
  }

  MedicationEntry toEntry() => MedicationEntry(
    name: name.text.trim(),
    dosageAndTiming: dosage.text.trim(),
    duration: duration.text.trim(),
    notes: notes.text.trim(),
  );
}

// ── Section 4 widget ───────────────────────────────────────────────────────
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
  bool? _hearingVision;
  bool? _seizures;
  bool? _sleepNutrition;
  bool? _bloodAnemia;
  bool? _dental;
  bool? _fatty;

  final List<_TreatState> _treatments = [];
  final List<_MedState> _medications = [];

  String _asd = '';
  String _adhd = '';
  String _learningDelay = '';
  String _downSyndrome = '';
  String _otherDiag = '';

  String _auditoryResult = '';
  String _brainResult = '';
  String _geneticResult = '';
  String _psychoResult = '';
  late final TextEditingController _auditoryNotes;
  late final TextEditingController _brainNotes;
  late final TextEditingController _geneticNotes;
  late final TextEditingController _psychoNotes;

  bool? _hasAllergies;
  late final TextEditingController _allergyType;
  String _specialDiet = '';
  late final TextEditingController _specialDietOther;
  bool? _hasAltVaccines;
  late final TextEditingController _altVaccinesDesc;
  bool? _allVaccinesOnTime;

  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;

    _hearingVision = d?.hearingVisionIssues;
    _seizures = d?.seizuresHeadInjury;
    _sleepNutrition = d?.sleepNutritionIssues;
    _bloodAnemia = d?.bloodAnemiaRespHeart;
    _dental = d?.dentalPerceptionIssues;
    _fatty = d?.fattyFailureStunting;

    for (final t in d?.previousTreatments ?? []) {
      _treatments.add(
        _TreatState(
          type: t.treatmentType,
          org: t.organization,
          duration: t.duration,
          notes: t.notes,
        ),
      );
    }
    if (_treatments.isEmpty) _treatments.add(_TreatState());

    for (final m in d?.currentMedications ?? []) {
      _medications.add(
        _MedState(
          name: m.name,
          dosage: m.dosageAndTiming,
          duration: m.duration,
          notes: m.notes,
        ),
      );
    }
    if (_medications.isEmpty) _medications.add(_MedState());

    _asd = d?.asdDiagnosis ?? '';
    _adhd = d?.adhdDiagnosis ?? '';
    _learningDelay = d?.learningDelayDiagnosis ?? '';
    _downSyndrome = d?.downSyndromeDiagnosis ?? '';
    _otherDiag = d?.otherDiagnosis ?? '';

    _auditoryResult = d?.auditoryVisualAssessment.result ?? '';
    _brainResult = d?.brainScanEEG.result ?? '';
    _geneticResult = d?.geneticTest.result ?? '';
    _psychoResult = d?.psychoIQTest.result ?? '';
    _auditoryNotes = TextEditingController(
      text: d?.auditoryVisualAssessment.notes ?? '',
    );
    _brainNotes = TextEditingController(text: d?.brainScanEEG.notes ?? '');
    _geneticNotes = TextEditingController(text: d?.geneticTest.notes ?? '');
    _psychoNotes = TextEditingController(text: d?.psychoIQTest.notes ?? '');

    _hasAllergies = d?.hasAllergies;
    _allergyType = TextEditingController(text: d?.allergyType ?? '');
    _specialDiet = d?.specialDiet ?? '';
    _specialDietOther = TextEditingController(text: d?.specialDietOther ?? '');
    _hasAltVaccines = d?.hasAlternativeVaccines;
    _altVaccinesDesc = TextEditingController(
      text: d?.alternativeVaccinesDesc ?? '',
    );
    _allVaccinesOnTime = d?.allVaccinesOnTime;
  }

  @override
  void dispose() {
    for (final t in _treatments) {
      t.dispose();
    }
    for (final m in _medications) {
      m.dispose();
    }
    _auditoryNotes.dispose();
    _brainNotes.dispose();
    _geneticNotes.dispose();
    _psychoNotes.dispose();
    _allergyType.dispose();
    _specialDietOther.dispose();
    _altVaccinesDesc.dispose();
    super.dispose();
  }

  String _req(BuildContext context) =>
      AppLocalizations.of(context)!.validationRequired;

  bool _validate(BuildContext context) {
    setState(() {
      _errors['hasAllergies'] = _hasAllergies == null ? _req(context) : null;
      _errors['allVaccinesOnTime'] = _allVaccinesOnTime == null
          ? _req(context)
          : null;
    });
    return _hasAllergies != null && _allVaccinesOnTime != null;
  }

  void _submit(BuildContext context) {
    if (!_validate(context)) return;
    widget.onNext(
      Section4Data(
        hearingVisionIssues: _hearingVision,
        seizuresHeadInjury: _seizures,
        sleepNutritionIssues: _sleepNutrition,
        bloodAnemiaRespHeart: _bloodAnemia,
        dentalPerceptionIssues: _dental,
        fattyFailureStunting: _fatty,
        previousTreatments: _treatments.map((t) => t.toEntry()).toList(),
        currentMedications: _medications.map((m) => m.toEntry()).toList(),
        asdDiagnosis: _asd,
        adhdDiagnosis: _adhd,
        learningDelayDiagnosis: _learningDelay,
        downSyndromeDiagnosis: _downSyndrome,
        otherDiagnosis: _otherDiag,
        auditoryVisualAssessment: AssessmentResult(
          result: _auditoryResult,
          notes: _auditoryNotes.text.trim(),
        ),
        brainScanEEG: AssessmentResult(
          result: _brainResult,
          notes: _brainNotes.text.trim(),
        ),
        geneticTest: AssessmentResult(
          result: _geneticResult,
          notes: _geneticNotes.text.trim(),
        ),
        psychoIQTest: AssessmentResult(
          result: _psychoResult,
          notes: _psychoNotes.text.trim(),
        ),
        hasAllergies: _hasAllergies,
        allergyType: _hasAllergies == true ? _allergyType.text.trim() : '',
        specialDiet: _specialDiet,
        specialDietOther: _specialDiet == 'other'
            ? _specialDietOther.text.trim()
            : '',
        hasAlternativeVaccines: _hasAltVaccines,
        alternativeVaccinesDesc: _hasAltVaccines == true
            ? _altVaccinesDesc.text.trim()
            : '',
        allVaccinesOnTime: _allVaccinesOnTime,
      ),
    );
  }

  void _toggleDiet(String value) =>
      setState(() => _specialDiet = _specialDiet == value ? '' : value);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = ResponsiveHelper(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Section title ────────────────────────────────────────────────
        FormSectionHeader(title: l10n.csSection4Title),
        const SizedBox(height: AppSpacing.p24),

        // ── 1. Comprehensive Medical History ─────────────────────────────
        FormSubsectionTitle(l10n.csS4ComprehensiveTitle),
        const SizedBox(height: AppSpacing.p12),
        _MedHistGrid(
          yesLabel: l10n.csS4MedHistYes,
          noLabel: l10n.csS4MedHistNo,
          rows: [
            _MedHistItem(
              label: l10n.csS4HearingVision,
              value: _hearingVision,
              onChanged: (v) => setState(() => _hearingVision = v),
            ),
            _MedHistItem(
              label: l10n.csS4SeizuresHeadInjury,
              value: _seizures,
              onChanged: (v) => setState(() => _seizures = v),
            ),
            _MedHistItem(
              label: l10n.csS4SleepNutrition,
              value: _sleepNutrition,
              onChanged: (v) => setState(() => _sleepNutrition = v),
            ),
            _MedHistItem(
              label: l10n.csS4BloodAnemiaResp,
              value: _bloodAnemia,
              onChanged: (v) => setState(() => _bloodAnemia = v),
            ),
            _MedHistItem(
              label: l10n.csS4DentalPerception,
              value: _dental,
              onChanged: (v) => setState(() => _dental = v),
            ),
            _MedHistItem(
              label: l10n.csS4FattyFailureStunting,
              value: _fatty,
              onChanged: (v) => setState(() => _fatty = v),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── 2. Previous Treatment History ─────────────────────────────────
        FormSubsectionTitle(l10n.csS4PrevTreatmentTitle),
        const SizedBox(height: AppSpacing.p12),
        for (int i = 0; i < _treatments.length; i++) ...[
          _TreatmentCard(
            index: i,
            state: _treatments[i],
            l10n: l10n,
            canRemove: _treatments.length > 1,
            onRemove: () => setState(() => _treatments.removeAt(i)),
            onTypeChanged: (v) => setState(() => _treatments[i].type = v ?? ''),
          ),
          const SizedBox(height: AppSpacing.p12),
        ],
        _AddButton(
          label: l10n.csS4AddTreatment,
          onTap: () => setState(() => _treatments.add(_TreatState())),
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── 3. Current Medications ────────────────────────────────────────
        FormSubsectionTitle(l10n.csS4CurrentMedsTitle),
        const SizedBox(height: AppSpacing.p12),
        for (int i = 0; i < _medications.length; i++) ...[
          _MedicationCard(
            index: i,
            state: _medications[i],
            l10n: l10n,
            canRemove: _medications.length > 1,
            onRemove: () => setState(() => _medications.removeAt(i)),
          ),
          const SizedBox(height: AppSpacing.p12),
        ],
        _AddButton(
          label: l10n.csS4AddMedication,
          onTap: () => setState(() => _medications.add(_MedState())),
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── 4. Diagnoses ──────────────────────────────────────────────────
        FormSubsectionTitle(l10n.csS4DiagnosesTitle),
        const SizedBox(height: AppSpacing.p12),
        _DiagnosisTable(
          diagnosedLabel: l10n.csS4DiagnosedOption,
          suspectedLabel: l10n.csS4SuspectedOption,
          rows: [
            _DiagRow(
              label: l10n.csS4ASD,
              value: _asd,
              onChanged: (v) => setState(() => _asd = v),
            ),
            _DiagRow(
              label: l10n.csS4ADHD,
              value: _adhd,
              onChanged: (v) => setState(() => _adhd = v),
            ),
            _DiagRow(
              label: l10n.csS4LearningDelay,
              value: _learningDelay,
              onChanged: (v) => setState(() => _learningDelay = v),
            ),
            _DiagRow(
              label: l10n.csS4DownSyndrome,
              value: _downSyndrome,
              onChanged: (v) => setState(() => _downSyndrome = v),
            ),
            _DiagRow(
              label: l10n.csS4OtherDiagnosis,
              value: _otherDiag,
              onChanged: (v) => setState(() => _otherDiag = v),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── 5. Medical Assessments ────────────────────────────────────────
        FormSubsectionTitle(l10n.csS4MedAssessTitle),
        const SizedBox(height: AppSpacing.p12),
        _AssessmentSection(
          normalLabel: l10n.csS4NormalOption,
          abnormalLabel: l10n.csS4AbnormalOption,
          notesHint: l10n.csS4AssessmentNotes,
          rows: [
            _AssessRow(
              label: l10n.csS4AuditoryVisual,
              result: _auditoryResult,
              notesCtrl: _auditoryNotes,
              onResultChanged: (v) => setState(() => _auditoryResult = v),
            ),
            _AssessRow(
              label: l10n.csS4BrainScanEEG,
              result: _brainResult,
              notesCtrl: _brainNotes,
              onResultChanged: (v) => setState(() => _brainResult = v),
            ),
            _AssessRow(
              label: l10n.csS4GeneticTest,
              result: _geneticResult,
              notesCtrl: _geneticNotes,
              onResultChanged: (v) => setState(() => _geneticResult = v),
            ),
            _AssessRow(
              label: l10n.csS4PsychoIQ,
              result: _psychoResult,
              notesCtrl: _psychoNotes,
              onResultChanged: (v) => setState(() => _psychoResult = v),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── 6. Diet, Allergy & Alternative Medicines ──────────────────────
        FormSubsectionTitle(l10n.csS4DietAllergyTitle),
        const SizedBox(height: AppSpacing.p12),

        FormYesNoQuestion(
          label: l10n.csS4HasAllergiesQuestion,
          value: _hasAllergies,
          errorText: _errors['hasAllergies'],
          onChanged: (v) => setState(() {
            _hasAllergies = v;
            _errors['hasAllergies'] = null;
          }),
          conditionalChild: FormLabeledField(
            label: l10n.csS4AllergyTypeLabel,
            hint: l10n.csS4AllergyTypeHint,
            controller: _allergyType,
          ),
        ),
        const SizedBox(height: AppSpacing.p16),

        Text(
          l10n.csS4SpecialDietQuestion,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.p8),
        Wrap(
          spacing: res.scaleSpacing(16),
          runSpacing: res.scaleSpacing(8),
          children: [
            _RadioLabelItem(
              label: l10n.csS4GlutenFree,
              selected: _specialDiet == 'gluten_free',
              onTap: () => _toggleDiet('gluten_free'),
            ),
            _RadioLabelItem(
              label: l10n.csS4CaseinFree,
              selected: _specialDiet == 'casein_free',
              onTap: () => _toggleDiet('casein_free'),
            ),
            _RadioLabelItem(
              label: l10n.csS4Biometric,
              selected: _specialDiet == 'biometric',
              onTap: () => _toggleDiet('biometric'),
            ),
            _RadioLabelItem(
              label: l10n.csS4OtherDiet,
              selected: _specialDiet == 'other',
              onTap: () => _toggleDiet('other'),
            ),
          ],
        ),
        if (_specialDiet == 'other') ...[
          const SizedBox(height: AppSpacing.p8),
          FormLabeledField(
            label: l10n.csS4OtherDiet,
            hint: l10n.csS4OtherDietHint,
            controller: _specialDietOther,
          ),
        ],
        const SizedBox(height: AppSpacing.p16),

        FormYesNoQuestion(
          label: l10n.csS4AltVaccinesQuestion,
          value: _hasAltVaccines,
          onChanged: (v) => setState(() => _hasAltVaccines = v),
          conditionalChild: FormLabeledField(
            label: l10n.csS4AltVaccinesDescLabel,
            hint: l10n.csS4AltVaccinesDescHint,
            controller: _altVaccinesDesc,
            maxLines: 2,
          ),
        ),
        const SizedBox(height: AppSpacing.p16),

        FormYesNoQuestion(
          label: l10n.csS4AllVaccinesOnTimeQuestion,
          value: _allVaccinesOnTime,
          errorText: _errors['allVaccinesOnTime'],
          onChanged: (v) => setState(() {
            _allVaccinesOnTime = v;
            _errors['allVaccinesOnTime'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p32),

        FormNextButton(
          label: l10n.csFormNext,
          onPressed: () => _submit(context),
          isLoading: widget.isSaving,
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Shared primitive widgets
// ═══════════════════════════════════════════════════════════════════════════

// Remove-item text button shared by treatment and medication cards.
class _RemoveItemButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _RemoveItemButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.error,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// Animated radio circle used in all radio controls.
class _RadioCircle extends StatelessWidget {
  final bool selected;
  const _RadioCircle({required this.selected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? AppColors.primary : Colors.grey.shade400,
          width: 2,
        ),
      ),
      child: selected
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
    );
  }
}

// Radio circle + label row — used for assessment results and diet chips.
class _RadioLabelItem extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _RadioLabelItem({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _RadioCircle(selected: selected),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: selected ? AppColors.primary : AppColors.textPrimary,
              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Generic bordered radio table (shared by Medical History and Diagnoses)
// ═══════════════════════════════════════════════════════════════════════════

// One (selected, onTap) cell passed to _RadioTableRow.
class _RadioCell {
  final bool selected;
  final VoidCallback onTap;
  const _RadioCell({required this.selected, required this.onTap});
}

// Bordered container with a grey header row + dividers between body rows.
class _TableShell extends StatelessWidget {
  final double radioColWidth;
  final List<String> columnLabels;
  final List<Widget> rows;

  const _TableShell({
    required this.radioColWidth,
    required this.columnLabels,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: radioColWidth,
                  child: Row(
                    children: columnLabels
                        .map(
                          (l) => Expanded(
                            child: Text(
                              l,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
          for (int i = 0; i < rows.length; i++) ...[
            if (i > 0) Divider(height: 1, color: Colors.grey.shade200),
            rows[i],
          ],
        ],
      ),
    );
  }
}

// One body row in a radio table: radio circles on the start side, label on the end.
class _RadioTableRow extends StatelessWidget {
  final String label;
  final double colWidth;
  final List<_RadioCell> cells;

  const _RadioTableRow({
    required this.label,
    required this.colWidth,
    required this.cells,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: colWidth,
            child: Row(
              children: cells
                  .map(
                    (c) => Expanded(
                      child: GestureDetector(
                        onTap: c.onTap,
                        behavior: HitTestBehavior.opaque,
                        child: Center(
                          child: _RadioCircle(selected: c.selected),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Comprehensive Medical History grid
// ═══════════════════════════════════════════════════════════════════════════

class _MedHistItem {
  final String label;
  final bool? value;
  final ValueChanged<bool?> onChanged;
  const _MedHistItem({
    required this.label,
    required this.value,
    required this.onChanged,
  });
}

class _MedHistGrid extends StatelessWidget {
  final String yesLabel;
  final String noLabel;
  final List<_MedHistItem> rows;

  const _MedHistGrid({
    required this.yesLabel,
    required this.noLabel,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return _TableShell(
      radioColWidth: 100,
      columnLabels: [yesLabel, noLabel],
      rows: rows
          .map(
            (item) => _RadioTableRow(
              label: item.label,
              colWidth: 100,
              cells: [
                _RadioCell(
                  selected: item.value == true,
                  onTap: () => item.onChanged(true),
                ),
                _RadioCell(
                  selected: item.value == false,
                  onTap: () => item.onChanged(false),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Treatment card
// ═══════════════════════════════════════════════════════════════════════════

class _TreatmentCard extends StatelessWidget {
  final int index;
  final _TreatState state;
  final AppLocalizations l10n;
  final bool canRemove;
  final VoidCallback onRemove;
  final ValueChanged<String?> onTypeChanged;

  const _TreatmentCard({
    required this.index,
    required this.state,
    required this.l10n,
    required this.canRemove,
    required this.onRemove,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (canRemove)
            _RemoveItemButton(label: l10n.csS4RemoveTreatment, onTap: onRemove),
          FormDropdownField<String>(
            label: l10n.csS4TreatmentTypeLabel,
            hint: l10n.csS4TreatmentTypeHint,
            initialValue: state.type.isEmpty ? null : state.type,
            onChanged: onTypeChanged,
            items: [
              DropdownMenuItem(
                value: 'speech',
                child: Text(l10n.csS4TreatmentSpeech),
              ),
              DropdownMenuItem(
                value: 'occupational',
                child: Text(l10n.csS4TreatmentOccupational),
              ),
              DropdownMenuItem(
                value: 'physical',
                child: Text(l10n.csS4TreatmentPhysical),
              ),
              DropdownMenuItem(
                value: 'aba',
                child: Text(l10n.csS4TreatmentABA),
              ),
              DropdownMenuItem(
                value: 'psychological',
                child: Text(l10n.csS4TreatmentPsychological),
              ),
              DropdownMenuItem(
                value: 'other',
                child: Text(l10n.csS4TreatmentOther),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.p12),
          FormLabeledField(
            label: l10n.csS4OrganizationLabel,
            hint: l10n.csS4OrganizationHint,
            controller: state.org,
          ),
          const SizedBox(height: AppSpacing.p12),
          FormLabeledField(
            label: l10n.csS4DurationLabel,
            hint: l10n.csS4DurationHint,
            controller: state.duration,
          ),
          const SizedBox(height: AppSpacing.p12),
          FormLabeledField(
            label: l10n.csS4ImprovementsLabel,
            hint: l10n.csS4NotesHint,
            controller: state.notes,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Medication card
// ═══════════════════════════════════════════════════════════════════════════

class _MedicationCard extends StatelessWidget {
  final int index;
  final _MedState state;
  final AppLocalizations l10n;
  final bool canRemove;
  final VoidCallback onRemove;

  const _MedicationCard({
    required this.index,
    required this.state,
    required this.l10n,
    required this.canRemove,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return FormCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (canRemove)
            _RemoveItemButton(label: l10n.csS4RemoveTreatment, onTap: onRemove),
          FormLabeledField(
            label: l10n.csS4MedNameLabel,
            hint: l10n.csS4MedNameHint,
            controller: state.name,
          ),
          const SizedBox(height: AppSpacing.p12),
          FormLabeledField(
            label: l10n.csS4DosageTimingLabel,
            hint: l10n.csS4DosageTimingHint,
            controller: state.dosage,
          ),
          const SizedBox(height: AppSpacing.p12),
          FormLabeledField(
            label: l10n.csS4UsageDurationLabel,
            hint: l10n.csS4UsageDurationHint,
            controller: state.duration,
          ),
          const SizedBox(height: AppSpacing.p12),
          FormLabeledField(
            label: l10n.csS4AssessmentNotes,
            hint: l10n.csS4NotesHint,
            controller: state.notes,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Add button
// ═══════════════════════════════════════════════════════════════════════════

class _AddButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _AddButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary, width: 1.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 13.5,
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Diagnosis table
// ═══════════════════════════════════════════════════════════════════════════

class _DiagRow {
  final String label;
  final String value; // 'diagnosed' | 'suspected' | ''
  final ValueChanged<String> onChanged;
  const _DiagRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });
}

class _DiagnosisTable extends StatelessWidget {
  final String diagnosedLabel;
  final String suspectedLabel;
  final List<_DiagRow> rows;

  const _DiagnosisTable({
    required this.diagnosedLabel,
    required this.suspectedLabel,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return _TableShell(
      radioColWidth: 120,
      columnLabels: [diagnosedLabel, suspectedLabel],
      rows: rows
          .map(
            (row) => _RadioTableRow(
              label: row.label,
              colWidth: 120,
              cells: [
                _RadioCell(
                  selected: row.value == 'diagnosed',
                  onTap: () => row.onChanged(
                    row.value == 'diagnosed' ? '' : 'diagnosed',
                  ),
                ),
                _RadioCell(
                  selected: row.value == 'suspected',
                  onTap: () => row.onChanged(
                    row.value == 'suspected' ? '' : 'suspected',
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Assessment section
// ═══════════════════════════════════════════════════════════════════════════

class _AssessRow {
  final String label;
  final String result; // 'normal' | 'abnormal' | ''
  final TextEditingController notesCtrl;
  final ValueChanged<String> onResultChanged;

  const _AssessRow({
    required this.label,
    required this.result,
    required this.notesCtrl,
    required this.onResultChanged,
  });
}

class _AssessmentSection extends StatelessWidget {
  final String normalLabel;
  final String abnormalLabel;
  final String notesHint;
  final List<_AssessRow> rows;

  const _AssessmentSection({
    required this.normalLabel,
    required this.abnormalLabel,
    required this.notesHint,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final row in rows) ...[
          _AssessRowWidget(
            row: row,
            normalLabel: normalLabel,
            abnormalLabel: abnormalLabel,
            notesHint: notesHint,
          ),
          const SizedBox(height: AppSpacing.p12),
        ],
      ],
    );
  }
}

class _AssessRowWidget extends StatelessWidget {
  final _AssessRow row;
  final String normalLabel;
  final String abnormalLabel;
  final String notesHint;

  const _AssessRowWidget({
    required this.row,
    required this.normalLabel,
    required this.abnormalLabel,
    required this.notesHint,
  });

  @override
  Widget build(BuildContext context) {
    return FormCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  row.label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _RadioLabelItem(
                label: normalLabel,
                selected: row.result == 'normal',
                onTap: () =>
                    row.onResultChanged(row.result == 'normal' ? '' : 'normal'),
              ),
              const SizedBox(width: 12),
              _RadioLabelItem(
                label: abnormalLabel,
                selected: row.result == 'abnormal',
                onTap: () => row.onResultChanged(
                  row.result == 'abnormal' ? '' : 'abnormal',
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.p8),
          FormNotesField(controller: row.notesCtrl, hint: notesHint),
        ],
      ),
    );
  }
}
