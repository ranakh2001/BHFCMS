import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_checkbox_grid.dart';
import '../widgets/form_checkbox_item.dart';
import '../widgets/form_labeled_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_notes_field.dart';
import '../widgets/form_radio_group.dart';
import '../widgets/form_section_header.dart';
import '../widgets/form_subsection_title.dart';
import '../widgets/form_yes_no_question.dart';

class Section10Cognitive extends StatefulWidget {
  final Section10Data? initialData;
  final void Function(Section10Data data) onNext;
  final bool isSaving;

  const Section10Cognitive({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section10Cognitive> createState() => _Section10CognitiveState();
}

class _Section10CognitiveState extends State<Section10Cognitive> {
  bool? _isEnrolledInSchool;
  late final TextEditingController _schoolNameCtrl;
  late final TextEditingController _schoolGradeCtrl;

  late bool _serviceABA;
  late bool _serviceSpeech;
  late bool _serviceOccupational;
  late bool _servicePhysical;
  late bool _servicePsychological;
  late bool _serviceSpecialEd;
  late bool _serviceOther;
  late bool _serviceNone;
  late final TextEditingController _otherServiceCtrl;
  late final TextEditingController _serviceDurationCtrl;

  bool? _hasIEP;

  late bool _reportVineland;
  late bool _reportEFL;
  late bool _reportAFLS;
  late bool _reportABLLS;
  late bool _reportVBMAPP;
  late bool _reportOther;
  late bool _reportNone;

  late String _classType;
  bool? _hasShadowTeacher;
  late final TextEditingController _shadowTeacherNameCtrl;

  late bool _modReduceDistractions;
  late bool _modVisualSchedule;
  late bool _modSpecificSeat;
  late bool _modOther;

  late final TextEditingController _schoolBehaviorCtrl;

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _isEnrolledInSchool = d?.isEnrolledInSchool;
    _schoolNameCtrl = TextEditingController(text: d?.schoolName ?? '');
    _schoolGradeCtrl = TextEditingController(text: d?.schoolGrade ?? '');
    _serviceABA = d?.serviceABA ?? false;
    _serviceSpeech = d?.serviceSpeech ?? false;
    _serviceOccupational = d?.serviceOccupational ?? false;
    _servicePhysical = d?.servicePhysical ?? false;
    _servicePsychological = d?.servicePsychological ?? false;
    _serviceSpecialEd = d?.serviceSpecialEd ?? false;
    _serviceOther = d?.serviceOther ?? false;
    _serviceNone = d?.serviceNone ?? false;
    _otherServiceCtrl =
        TextEditingController(text: d?.otherServiceDescription ?? '');
    _serviceDurationCtrl =
        TextEditingController(text: d?.serviceDuration ?? '');
    _hasIEP = d?.hasIEP;
    _reportVineland = d?.reportVineland ?? false;
    _reportEFL = d?.reportEFL ?? false;
    _reportAFLS = d?.reportAFLS ?? false;
    _reportABLLS = d?.reportABLLS ?? false;
    _reportVBMAPP = d?.reportVBMAPP ?? false;
    _reportOther = d?.reportOther ?? false;
    _reportNone = d?.reportNone ?? false;
    _classType = d?.classType ?? '';
    _hasShadowTeacher = d?.hasShadowTeacher;
    _shadowTeacherNameCtrl =
        TextEditingController(text: d?.shadowTeacherName ?? '');
    _modReduceDistractions = d?.modReduceDistractions ?? false;
    _modVisualSchedule = d?.modVisualSchedule ?? false;
    _modSpecificSeat = d?.modSpecificSeat ?? false;
    _modOther = d?.modOther ?? false;
    _schoolBehaviorCtrl =
        TextEditingController(text: d?.schoolBehavior ?? '');
  }

  @override
  void dispose() {
    _schoolNameCtrl.dispose();
    _schoolGradeCtrl.dispose();
    _otherServiceCtrl.dispose();
    _serviceDurationCtrl.dispose();
    _shadowTeacherNameCtrl.dispose();
    _schoolBehaviorCtrl.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    widget.onNext(Section10Data(
      isEnrolledInSchool: _isEnrolledInSchool,
      schoolName:
          _isEnrolledInSchool == true ? _schoolNameCtrl.text.trim() : '',
      schoolGrade:
          _isEnrolledInSchool == true ? _schoolGradeCtrl.text.trim() : '',
      serviceABA: _serviceABA,
      serviceSpeech: _serviceSpeech,
      serviceOccupational: _serviceOccupational,
      servicePhysical: _servicePhysical,
      servicePsychological: _servicePsychological,
      serviceSpecialEd: _serviceSpecialEd,
      serviceOther: _serviceOther,
      serviceNone: _serviceNone,
      otherServiceDescription: _otherServiceCtrl.text.trim(),
      serviceDuration: _serviceDurationCtrl.text.trim(),
      hasIEP: _hasIEP,
      reportVineland: _reportVineland,
      reportEFL: _reportEFL,
      reportAFLS: _reportAFLS,
      reportABLLS: _reportABLLS,
      reportVBMAPP: _reportVBMAPP,
      reportOther: _reportOther,
      reportNone: _reportNone,
      classType: _classType,
      hasShadowTeacher: _hasShadowTeacher,
      shadowTeacherName:
          _hasShadowTeacher == true ? _shadowTeacherNameCtrl.text.trim() : '',
      modReduceDistractions: _modReduceDistractions,
      modVisualSchedule: _modVisualSchedule,
      modSpecificSeat: _modSpecificSeat,
      modOther: _modOther,
      schoolBehavior: _schoolBehaviorCtrl.text.trim(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Header ────────────────────────────────────────────────────────────
        FormSectionHeader(title: l10n.csSection10Title),
        const SizedBox(height: AppSpacing.p24),

        // ── 1. School Enrollment ──────────────────────────────────────────────
        FormYesNoQuestion(
          label: l10n.csS10EnrolledInSchool,
          value: _isEnrolledInSchool,
          onChanged: (v) => setState(() => _isEnrolledInSchool = v),
          conditionalChild: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormLabeledField(
                label: l10n.csS10SchoolNameLabel,
                hint: l10n.csS10SchoolNameHint,
                controller: _schoolNameCtrl,
              ),
              const SizedBox(height: AppSpacing.p8),
              FormLabeledField(
                label: l10n.csS10SchoolGradeLabel,
                hint: l10n.csS10SchoolGradeHint,
                controller: _schoolGradeCtrl,
              ),
              const SizedBox(height: 4),
              Text(
                l10n.csIfPreviousYes,
                style: const TextStyle(
                  fontSize: 11.5,
                  color: AppColors.textSecondary,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── 2. Current / Previous Services ────────────────────────────────────
        FormSubsectionTitle(l10n.csS10CurrentServicesTitle),
        const SizedBox(height: AppSpacing.p12),
        FormCheckboxGrid(items: [
          FormCheckboxItem(
            label: l10n.csS10ServiceABA,
            value: _serviceABA,
            onChanged: (v) => setState(() => _serviceABA = v),
          ),
          FormCheckboxItem(
            label: l10n.csS10ServiceSpeech,
            value: _serviceSpeech,
            onChanged: (v) => setState(() => _serviceSpeech = v),
          ),
          FormCheckboxItem(
            label: l10n.csS10ServiceOccupational,
            value: _serviceOccupational,
            onChanged: (v) => setState(() => _serviceOccupational = v),
          ),
          FormCheckboxItem(
            label: l10n.csS10ServicePhysical,
            value: _servicePhysical,
            onChanged: (v) => setState(() => _servicePhysical = v),
          ),
          FormCheckboxItem(
            label: l10n.csS10ServicePsychological,
            value: _servicePsychological,
            onChanged: (v) => setState(() => _servicePsychological = v),
          ),
          FormCheckboxItem(
            label: l10n.csS10ServiceSpecialEd,
            value: _serviceSpecialEd,
            onChanged: (v) => setState(() => _serviceSpecialEd = v),
          ),
          FormCheckboxItem(
            label: l10n.csS10ServiceOther,
            value: _serviceOther,
            onChanged: (v) => setState(() => _serviceOther = v),
          ),
          FormCheckboxItem(
            label: l10n.csS10ServiceNone,
            value: _serviceNone,
            onChanged: (v) => setState(() => _serviceNone = v),
          ),
        ]),
        if (_serviceOther) ...[
          const SizedBox(height: AppSpacing.p12),
          FormNotesField(
            controller: _otherServiceCtrl,
            hint: l10n.csS10OtherServiceHint,
            maxLines: 2,
          ),
          const SizedBox(height: 4),
          Text(
            l10n.csS10OtherServiceLabel,
            style: const TextStyle(
              fontSize: 11.5,
              color: AppColors.textSecondary,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.start,
          ),
        ],
        const SizedBox(height: AppSpacing.p16),
        FormLabeledField(
          label: l10n.csS10ServiceDurationLabel,
          hint: l10n.csS10ServiceDurationHint,
          controller: _serviceDurationCtrl,
        ),
        const SizedBox(height: AppSpacing.p16),
        FormYesNoQuestion(
          label: l10n.csS10HasIEP,
          value: _hasIEP,
          onChanged: (v) => setState(() => _hasIEP = v),
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── 3. Previous Assessment Reports ────────────────────────────────────
        FormSubsectionTitle(l10n.csS10PreviousReportsTitle),
        const SizedBox(height: AppSpacing.p12),
        FormCheckboxGrid(items: [
          FormCheckboxItem(
            label: l10n.csS10ReportVineland,
            value: _reportVineland,
            onChanged: (v) => setState(() => _reportVineland = v),
          ),
          FormCheckboxItem(
            label: l10n.csS10ReportEFL,
            value: _reportEFL,
            onChanged: (v) => setState(() => _reportEFL = v),
          ),
          FormCheckboxItem(
            label: l10n.csS10ReportAFLS,
            value: _reportAFLS,
            onChanged: (v) => setState(() => _reportAFLS = v),
          ),
          FormCheckboxItem(
            label: l10n.csS10ReportABLLS,
            value: _reportABLLS,
            onChanged: (v) => setState(() => _reportABLLS = v),
          ),
          FormCheckboxItem(
            label: l10n.csS10ReportVBMAPP,
            value: _reportVBMAPP,
            onChanged: (v) => setState(() => _reportVBMAPP = v),
          ),
          FormCheckboxItem(
            label: l10n.csS10ReportOther,
            value: _reportOther,
            onChanged: (v) => setState(() => _reportOther = v),
          ),
          FormCheckboxItem(
            label: l10n.csS10ReportNone,
            value: _reportNone,
            onChanged: (v) => setState(() => _reportNone = v),
          ),
        ]),
        const SizedBox(height: AppSpacing.p24),

        // ── 4. School Support Details ─────────────────────────────────────────
        FormSubsectionTitle(l10n.csS10SchoolSupportTitle),
        const SizedBox(height: AppSpacing.p12),
        FormRadioGroup<String>(
          label: l10n.csS10ClassTypeLabel,
          options: [
            RadioOption(
                label: l10n.csS10ClassTypeFullInclusion,
                value: 'full_inclusion'),
            RadioOption(
                label: l10n.csS10ClassTypePartialInclusion,
                value: 'partial_inclusion'),
            RadioOption(
                label: l10n.csS10ClassTypeSpecialClass,
                value: 'special_class'),
            RadioOption(
                label: l10n.csS10ClassTypeCareCenter, value: 'care_center'),
          ],
          groupValue: _classType.isEmpty ? null : _classType,
          onChanged: (v) => setState(() => _classType = v ?? ''),
        ),
        const SizedBox(height: AppSpacing.p16),
        FormYesNoQuestion(
          label: l10n.csS10HasShadowTeacher,
          value: _hasShadowTeacher,
          onChanged: (v) => setState(() => _hasShadowTeacher = v),
          conditionalChild: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormLabeledField(
                label: l10n.csS10ShadowTeacherNameLabel,
                hint: l10n.csS10ShadowTeacherNameHint,
                controller: _shadowTeacherNameCtrl,
              ),
              const SizedBox(height: 4),
              Text(
                l10n.csIfPreviousYes,
                style: const TextStyle(
                  fontSize: 11.5,
                  color: AppColors.textSecondary,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.p16),
        Text(
          l10n.csS10EnvironmentalModsTitle,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: AppSpacing.p8),
        FormCheckboxGrid(items: [
          FormCheckboxItem(
            label: l10n.csS10ModReduceDistractions,
            value: _modReduceDistractions,
            onChanged: (v) => setState(() => _modReduceDistractions = v),
          ),
          FormCheckboxItem(
            label: l10n.csS10ModVisualSchedule,
            value: _modVisualSchedule,
            onChanged: (v) => setState(() => _modVisualSchedule = v),
          ),
          FormCheckboxItem(
            label: l10n.csS10ModSpecificSeat,
            value: _modSpecificSeat,
            onChanged: (v) => setState(() => _modSpecificSeat = v),
          ),
          FormCheckboxItem(
            label: l10n.csS10ModOther,
            value: _modOther,
            onChanged: (v) => setState(() => _modOther = v),
          ),
        ]),
        const SizedBox(height: AppSpacing.p16),
        Text(
          l10n.csS10SchoolBehaviorLabel,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: AppSpacing.p8),
        FormNotesField(
          controller: _schoolBehaviorCtrl,
          hint: l10n.csS10SchoolBehaviorHint,
          maxLines: 4,
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
