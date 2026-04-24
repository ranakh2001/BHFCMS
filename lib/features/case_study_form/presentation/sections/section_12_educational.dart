import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_labeled_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_radio_group.dart';
import '../widgets/form_yes_no_question.dart';

class Section12Educational extends StatefulWidget {
  final Section12Data? initialData;
  final void Function(Section12Data data) onNext;
  final bool isSaving;

  const Section12Educational({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section12Educational> createState() => _Section12EducationalState();
}

class _Section12EducationalState extends State<Section12Educational> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _absenceDurationCtrl;
  late final TextEditingController _absenceReasonCtrl;

  String? _learningReadinessLevel;
  bool? _absentFromCenter;
  bool? _participatesInActivities;
  bool? _likesCenter;
  bool? _tiresFastInClass;
  String? _teacherRelationship;
  String? _peersRelationship;
  String? _comprehensionLevel;

  // Name recognition
  bool? _knowsFriendsNames;
  bool? _knowsTeachersNames;
  bool? _knowsClassChildren;
  // Expression
  bool? _usesSentences;
  bool? _usesVerbs;
  bool? _usesConnectors;
  // Body awareness
  bool? _bodyImage;
  bool? _bodyDirection;
  // Auditory perception
  bool? _soundDirection;
  bool? _animalSounds;
  // Visual perception
  bool? _recognizesDifferences;
  bool? _recognizesSimilarities;
  bool? _colorConcept;
  bool? _shapeConcept;

  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _absenceDurationCtrl =
        TextEditingController(text: d?.absenceDuration ?? '');
    _absenceReasonCtrl = TextEditingController(text: d?.absenceReason ?? '');

    _learningReadinessLevel = d?.learningReadinessLevel.isEmpty ?? true
        ? null
        : d!.learningReadinessLevel;
    _absentFromCenter = d?.absentFromCenter;
    _participatesInActivities = d?.participatesInActivities;
    _likesCenter = d?.likesCenter;
    _tiresFastInClass = d?.tiresFastInClass;
    _teacherRelationship = d?.teacherRelationship.isEmpty ?? true
        ? null
        : d!.teacherRelationship;
    _peersRelationship =
        d?.peersRelationship.isEmpty ?? true ? null : d!.peersRelationship;
    _comprehensionLevel = d?.comprehensionLevel.isEmpty ?? true
        ? null
        : d!.comprehensionLevel;

    _knowsFriendsNames = d?.knowsFriendsNames;
    _knowsTeachersNames = d?.knowsTeachersNames;
    _knowsClassChildren = d?.knowsClassChildren;
    _usesSentences = d?.usesSentences;
    _usesVerbs = d?.usesVerbs;
    _usesConnectors = d?.usesConnectors;
    _bodyImage = d?.bodyImage;
    _bodyDirection = d?.bodyDirection;
    _soundDirection = d?.soundDirection;
    _animalSounds = d?.animalSounds;
    _recognizesDifferences = d?.recognizesDifferences;
    _recognizesSimilarities = d?.recognizesSimilarities;
    _colorConcept = d?.colorConcept;
    _shapeConcept = d?.shapeConcept;
  }

  @override
  void dispose() {
    _absenceDurationCtrl.dispose();
    _absenceReasonCtrl.dispose();
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
      checkStr('learningReadinessLevel', _learningReadinessLevel);
      checkBool('absentFromCenter', _absentFromCenter);
      checkBool('participatesInActivities', _participatesInActivities);
      checkBool('likesCenter', _likesCenter);
      checkBool('tiresFastInClass', _tiresFastInClass);
      checkStr('teacherRelationship', _teacherRelationship);
      checkStr('peersRelationship', _peersRelationship);
      checkStr('comprehensionLevel', _comprehensionLevel);
    });

    return formValid && allValid;
  }

  void _submit(BuildContext context) {
    if (!_validate(context)) return;
    widget.onNext(
      Section12Data(
        learningReadinessLevel: _learningReadinessLevel ?? '',
        absentFromCenter: _absentFromCenter,
        absenceDuration: _absentFromCenter == true
            ? _absenceDurationCtrl.text.trim()
            : '',
        absenceReason: _absentFromCenter == true
            ? _absenceReasonCtrl.text.trim()
            : '',
        participatesInActivities: _participatesInActivities,
        likesCenter: _likesCenter,
        tiresFastInClass: _tiresFastInClass,
        teacherRelationship: _teacherRelationship ?? '',
        peersRelationship: _peersRelationship ?? '',
        comprehensionLevel: _comprehensionLevel ?? '',
        knowsFriendsNames: _knowsFriendsNames,
        knowsTeachersNames: _knowsTeachersNames,
        knowsClassChildren: _knowsClassChildren,
        usesSentences: _usesSentences,
        usesVerbs: _usesVerbs,
        usesConnectors: _usesConnectors,
        bodyImage: _bodyImage,
        bodyDirection: _bodyDirection,
        soundDirection: _soundDirection,
        animalSounds: _animalSounds,
        recognizesDifferences: _recognizesDifferences,
        recognizesSimilarities: _recognizesSimilarities,
        colorConcept: _colorConcept,
        shapeConcept: _shapeConcept,
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
            l10n.csSection12Title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            '(${l10n.csSection12Subtitle})',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.p24),

          // ── Q1: Learning readiness ────────────────────────────────────
          FormRadioGroup<String>(
            label: l10n.csS12LearningReadiness,
            options: [
              RadioOption(label: l10n.csS12LearningGood, value: 'good'),
              RadioOption(label: l10n.csS12LearningAverage, value: 'average'),
              RadioOption(label: l10n.csS12LearningWeak, value: 'weak'),
            ],
            groupValue: _learningReadinessLevel,
            onChanged: (v) => setState(() {
              _learningReadinessLevel = v;
              _errors['learningReadinessLevel'] = null;
            }),
            errorText: _errors['learningReadinessLevel'],
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q2: Absent from center ────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS12AbsentFromCenter,
            value: _absentFromCenter,
            errorText: _errors['absentFromCenter'],
            onChanged: (v) => setState(() {
              _absentFromCenter = v;
              _errors['absentFromCenter'] = null;
            }),
            conditionalChild: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormLabeledField(
                  label: l10n.csS12AbsenceDuration,
                  hint: l10n.csS12AbsenceDurationHint,
                  controller: _absenceDurationCtrl,
                  validator: (v) =>
                      (_absentFromCenter == true &&
                              (v == null || v.trim().isEmpty))
                          ? _req(context)
                          : null,
                ),
                const SizedBox(height: AppSpacing.p8),
                FormLabeledField(
                  label: l10n.csS12AbsenceReason,
                  hint: l10n.csS12AbsenceReasonHint,
                  controller: _absenceReasonCtrl,
                  validator: (v) =>
                      (_absentFromCenter == true &&
                              (v == null || v.trim().isEmpty))
                          ? _req(context)
                          : null,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q3: Participates in activities ────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS12ParticipatesInActivities,
            value: _participatesInActivities,
            errorText: _errors['participatesInActivities'],
            onChanged: (v) => setState(() {
              _participatesInActivities = v;
              _errors['participatesInActivities'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q4: Likes center ──────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS12LikesCenter,
            value: _likesCenter,
            errorText: _errors['likesCenter'],
            onChanged: (v) => setState(() {
              _likesCenter = v;
              _errors['likesCenter'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q5: Tires fast ────────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS12TiresFastInClass,
            value: _tiresFastInClass,
            errorText: _errors['tiresFastInClass'],
            onChanged: (v) => setState(() {
              _tiresFastInClass = v;
              _errors['tiresFastInClass'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q6: Teacher relationship ──────────────────────────────────
          FormRadioGroup<String>(
            label: l10n.csS12TeacherRelationship,
            options: [
              RadioOption(label: l10n.csS12RelationshipGood, value: 'good'),
              RadioOption(label: l10n.csS12RelationshipBad, value: 'bad'),
            ],
            groupValue: _teacherRelationship,
            onChanged: (v) => setState(() {
              _teacherRelationship = v;
              _errors['teacherRelationship'] = null;
            }),
            errorText: _errors['teacherRelationship'],
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q7: Peers relationship ────────────────────────────────────
          FormRadioGroup<String>(
            label: l10n.csS12PeersRelationship,
            options: [
              RadioOption(label: l10n.csS12RelationshipGood, value: 'good'),
              RadioOption(label: l10n.csS12RelationshipBad, value: 'bad'),
            ],
            groupValue: _peersRelationship,
            onChanged: (v) => setState(() {
              _peersRelationship = v;
              _errors['peersRelationship'] = null;
            }),
            errorText: _errors['peersRelationship'],
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q8: Comprehension level ───────────────────────────────────
          FormRadioGroup<String>(
            label: l10n.csS12ComprehensionLevel,
            options: [
              RadioOption(label: l10n.csS12ComprehensionGood, value: 'good'),
              RadioOption(label: l10n.csS12ComprehensionAverage, value: 'average'),
              RadioOption(label: l10n.csS12ComprehensionWeak, value: 'weak'),
              RadioOption(label: l10n.csS12ComprehensionNone, value: 'none'),
            ],
            groupValue: _comprehensionLevel,
            onChanged: (v) => setState(() {
              _comprehensionLevel = v;
              _errors['comprehensionLevel'] = null;
            }),
            errorText: _errors['comprehensionLevel'],
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Sub-section: Name recognition ─────────────────────────────
          _SubSectionChecklist(
            label: l10n.csS12NameRecognition,
            items: [
              _ChecklistItem(
                label: l10n.csS12KnowsFriendsNames,
                value: _knowsFriendsNames,
                onChanged: (v) => setState(() => _knowsFriendsNames = v),
              ),
              _ChecklistItem(
                label: l10n.csS12KnowsTeachersNames,
                value: _knowsTeachersNames,
                onChanged: (v) => setState(() => _knowsTeachersNames = v),
              ),
              _ChecklistItem(
                label: l10n.csS12KnowsClassChildren,
                value: _knowsClassChildren,
                onChanged: (v) => setState(() => _knowsClassChildren = v),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Sub-section: Expression test ──────────────────────────────
          _SubSectionChecklist(
            label: l10n.csS12ExpressionTest,
            items: [
              _ChecklistItem(
                label: l10n.csS12UsesSentences,
                value: _usesSentences,
                onChanged: (v) => setState(() => _usesSentences = v),
              ),
              _ChecklistItem(
                label: l10n.csS12UsesVerbs,
                value: _usesVerbs,
                onChanged: (v) => setState(() => _usesVerbs = v),
              ),
              _ChecklistItem(
                label: l10n.csS12UsesConnectors,
                value: _usesConnectors,
                onChanged: (v) => setState(() => _usesConnectors = v),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Sub-section: Body awareness ───────────────────────────────
          _SubSectionChecklist(
            label: l10n.csS12BodyAwareness,
            items: [
              _ChecklistItem(
                label: l10n.csS12BodyImage,
                value: _bodyImage,
                onChanged: (v) => setState(() => _bodyImage = v),
              ),
              _ChecklistItem(
                label: l10n.csS12BodyDirection,
                value: _bodyDirection,
                onChanged: (v) => setState(() => _bodyDirection = v),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Sub-section: Auditory perception ──────────────────────────
          _SubSectionChecklist(
            label: l10n.csS12AuditoryPerception,
            items: [
              _ChecklistItem(
                label: l10n.csS12SoundDirection,
                value: _soundDirection,
                onChanged: (v) => setState(() => _soundDirection = v),
              ),
              _ChecklistItem(
                label: l10n.csS12AnimalSounds,
                value: _animalSounds,
                onChanged: (v) => setState(() => _animalSounds = v),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Sub-section: Visual perception ────────────────────────────
          _SubSectionChecklist(
            label: l10n.csS12VisualPerception,
            items: [
              _ChecklistItem(
                label: l10n.csS12RecognizesDifferences,
                value: _recognizesDifferences,
                onChanged: (v) => setState(() => _recognizesDifferences = v),
              ),
              _ChecklistItem(
                label: l10n.csS12RecognizesSimilarities,
                value: _recognizesSimilarities,
                onChanged: (v) =>
                    setState(() => _recognizesSimilarities = v),
              ),
              _ChecklistItem(
                label: l10n.csS12ColorConcept,
                value: _colorConcept,
                onChanged: (v) => setState(() => _colorConcept = v),
              ),
              _ChecklistItem(
                label: l10n.csS12ShapeConcept,
                value: _shapeConcept,
                onChanged: (v) => setState(() => _shapeConcept = v),
              ),
            ],
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

// ── Private helpers ──────────────────────────────────────────────────────────

class _ChecklistItem {
  final String label;
  final bool? value;
  final ValueChanged<bool?> onChanged;

  const _ChecklistItem({
    required this.label,
    required this.value,
    required this.onChanged,
  });
}

class _SubSectionChecklist extends StatelessWidget {
  final String label;
  final List<_ChecklistItem> items;

  const _SubSectionChecklist({
    required this.label,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
        ),
        const SizedBox(height: AppSpacing.p8),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.p8),
            child: _ChecklistRow(item: item),
          ),
        ),
      ],
    );
  }
}

class _ChecklistRow extends StatelessWidget {
  final _ChecklistItem item;

  const _ChecklistRow({required this.item});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: Text(
            item.label,
            style: const TextStyle(
              fontSize: 13.5,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.p8),
        _MiniRadio(
          label: l10n.csYes,
          isSelected: item.value == true,
          onTap: () => item.onChanged(true),
        ),
        const SizedBox(width: AppSpacing.p8),
        _MiniRadio(
          label: l10n.csNo,
          isSelected: item.value == false,
          onTap: () => item.onChanged(false),
        ),
      ],
    );
  }
}

class _MiniRadio extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _MiniRadio({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 140),
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : Colors.grey.shade400,
                  width: 1.8,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 9,
                        height: 9,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.5,
                color: isSelected
                    ? AppColors.primary
                    : AppColors.textSecondary,
                fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
