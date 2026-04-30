import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_checkbox_grid.dart';
import '../widgets/form_checkbox_item.dart';
import '../widgets/form_date_picker_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_notes_field.dart';
import '../widgets/form_radio_group.dart';
import '../widgets/form_section_header.dart';
import '../widgets/form_subsection_title.dart';
import '../widgets/form_time_picker_field.dart';
import '../widgets/form_yes_no_question.dart';

class Section13AssessmentPlan extends StatefulWidget {
  final Section13Data? initialData;
  final void Function(Section13Data data) onNext;
  final bool isSaving;

  const Section13AssessmentPlan({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section13AssessmentPlan> createState() =>
      _Section13AssessmentPlanState();
}

class _Section13AssessmentPlanState extends State<Section13AssessmentPlan> {
  late String _priorityLevel;

  late bool _specABA;
  late bool _specSpeech;
  late bool _specOccupational;
  late bool _specPhysical;
  late bool _specPsychological;
  late bool _specSpecialEd;

  bool? _reviewOtherReports;
  bool? _directObservation;
  bool? _familyMeeting;

  late final TextEditingController _notesCtrl;

  DateTime? _nextAssessmentDate;
  TimeOfDay? _nextAssessmentTime;

  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _priorityLevel = d?.priorityLevel ?? '';
    _specABA = d?.specABA ?? false;
    _specSpeech = d?.specSpeech ?? false;
    _specOccupational = d?.specOccupational ?? false;
    _specPhysical = d?.specPhysical ?? false;
    _specPsychological = d?.specPsychological ?? false;
    _specSpecialEd = d?.specSpecialEd ?? false;
    _reviewOtherReports = d?.reviewOtherReports;
    _directObservation = d?.directObservation;
    _familyMeeting = d?.familyMeeting;
    _notesCtrl =
        TextEditingController(text: d?.notesAndNextSteps ?? '');
    _nextAssessmentDate = d?.nextAssessmentDate;
    if (d != null && d.nextAssessmentTime.isNotEmpty) {
      final parts = d.nextAssessmentTime.split(':');
      if (parts.length == 2) {
        _nextAssessmentTime = TimeOfDay(
          hour: int.tryParse(parts[0]) ?? 0,
          minute: int.tryParse(parts[1]) ?? 0,
        );
      }
    }
  }

  @override
  void dispose() {
    _notesCtrl.dispose();
    super.dispose();
  }

  String _timeToString(TimeOfDay t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';

  String _req(BuildContext context) =>
      AppLocalizations.of(context)!.validationRequired;

  bool _validate(BuildContext context) {
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
      if (_priorityLevel.isEmpty) {
        _errors['priorityLevel'] = _req(context);
        allValid = false;
      } else {
        _errors['priorityLevel'] = null;
      }
      checkBool('reviewOtherReports', _reviewOtherReports);
      checkBool('directObservation', _directObservation);
      checkBool('familyMeeting', _familyMeeting);
    });

    return allValid;
  }

  void _submit(BuildContext context) {
    if (!_validate(context)) return;
    widget.onNext(
      Section13Data(
        priorityLevel: _priorityLevel,
        specABA: _specABA,
        specSpeech: _specSpeech,
        specOccupational: _specOccupational,
        specPhysical: _specPhysical,
        specPsychological: _specPsychological,
        specSpecialEd: _specSpecialEd,
        reviewOtherReports: _reviewOtherReports,
        directObservation: _directObservation,
        familyMeeting: _familyMeeting,
        notesAndNextSteps: _notesCtrl.text.trim(),
        nextAssessmentDate: _nextAssessmentDate,
        nextAssessmentTime: _nextAssessmentTime != null
            ? _timeToString(_nextAssessmentTime!)
            : '',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Header ────────────────────────────────────────────────────
        FormSectionHeader(title: l10n.csSection13Title),
        const SizedBox(height: AppSpacing.p24),

        // ── Priority level ────────────────────────────────────────────
        FormRadioGroup<String>(
          label: l10n.csS13PriorityLevel,
          options: [
            RadioOption(label: l10n.csS13PriorityLow, value: 'low'),
            RadioOption(label: l10n.csS13PriorityMedium, value: 'medium'),
            RadioOption(label: l10n.csS13PriorityHigh, value: 'high'),
            RadioOption(label: l10n.csS13PriorityUrgent, value: 'urgent'),
          ],
          groupValue: _priorityLevel.isEmpty ? null : _priorityLevel,
          errorText: _errors['priorityLevel'],
          onChanged: (v) => setState(() {
            _priorityLevel = v ?? '';
            _errors['priorityLevel'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── Suggested specializations ─────────────────────────────────
        FormSubsectionTitle(l10n.csS13SpecializationsTitle),
        const SizedBox(height: AppSpacing.p12),
        FormCheckboxGrid(
          items: [
            FormCheckboxItem(
              label: l10n.csS13SpecABA,
              value: _specABA,
              onChanged: (v) => setState(() => _specABA = v),
            ),
            FormCheckboxItem(
              label: l10n.csS13SpecSpeech,
              value: _specSpeech,
              onChanged: (v) => setState(() => _specSpeech = v),
            ),
            FormCheckboxItem(
              label: l10n.csS13SpecOccupational,
              value: _specOccupational,
              onChanged: (v) => setState(() => _specOccupational = v),
            ),
            FormCheckboxItem(
              label: l10n.csS13SpecPhysical,
              value: _specPhysical,
              onChanged: (v) => setState(() => _specPhysical = v),
            ),
            FormCheckboxItem(
              label: l10n.csS13SpecPsychological,
              value: _specPsychological,
              onChanged: (v) => setState(() => _specPsychological = v),
            ),
            FormCheckboxItem(
              label: l10n.csS13SpecSpecialEd,
              value: _specSpecialEd,
              onChanged: (v) => setState(() => _specSpecialEd = v),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── Additional requirements ───────────────────────────────────
        FormSubsectionTitle(l10n.csS13AdditionalReqsTitle),
        const SizedBox(height: AppSpacing.p12),
        FormYesNoQuestion(
          label: l10n.csS13ReviewOtherReports,
          value: _reviewOtherReports,
          errorText: _errors['reviewOtherReports'],
          onChanged: (v) => setState(() {
            _reviewOtherReports = v;
            _errors['reviewOtherReports'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p16),
        FormYesNoQuestion(
          label: l10n.csS13DirectObservation,
          value: _directObservation,
          errorText: _errors['directObservation'],
          onChanged: (v) => setState(() {
            _directObservation = v;
            _errors['directObservation'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p16),
        FormYesNoQuestion(
          label: l10n.csS13FamilyMeeting,
          value: _familyMeeting,
          errorText: _errors['familyMeeting'],
          onChanged: (v) => setState(() {
            _familyMeeting = v;
            _errors['familyMeeting'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── Notes and next steps ──────────────────────────────────────
        Text(
          l10n.csS13NotesAndNextStepsLabel,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: AppSpacing.p8),
        FormNotesField(
          controller: _notesCtrl,
          hint: l10n.csS13NotesAndNextStepsHint,
          maxLines: 4,
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── Next assessment date ──────────────────────────────────────
        FormDatePickerField(
          label: l10n.csS13NextAssessmentDateLabel,
          value: _nextAssessmentDate,
          lastDate: DateTime(2100),
          onChanged: (d) => setState(() => _nextAssessmentDate = d),
        ),
        const SizedBox(height: AppSpacing.p16),

        // ── Next assessment time ──────────────────────────────────────
        FormTimePickerField(
          label: l10n.csS13NextAssessmentTimeLabel,
          value: _nextAssessmentTime,
          onChanged: (t) => setState(() => _nextAssessmentTime = t),
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
