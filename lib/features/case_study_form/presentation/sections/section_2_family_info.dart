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

  // Marital status
  String _maritalStatus = '';

  // Residence fields (conditional)
  late final TextEditingController _firstHomeDescCtrl;
  late final TextEditingController _firstHomeOwnerCtrl;
  late final TextEditingController _secondHomeDescCtrl;
  late final TextEditingController _secondHomeOwnerCtrl;

  // Parents info
  late final TextEditingController _motherOccupCtrl;
  late final TextEditingController _motherEduCtrl;
  late final TextEditingController _fatherOccupCtrl;
  late final TextEditingController _fatherEduCtrl;

  // Decision maker
  String _decisionMaker = '';
  late final TextEditingController _separationDecisionCtrl;

  // Parents aware
  bool? _bothParentsAware;

  // Family members
  late List<_MemberEntry> _members;

  // Health history
  late _ConditionState _autism;
  late _ConditionState _langDelay;
  late _ConditionState _learning;
  late _ConditionState _adhd;
  late _ConditionState _mood;

  // Validation error flags
  String? _maritalError;
  String? _decisionError;
  String? _awareSError;

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _maritalStatus = d?.maritalStatus ?? '';
    _firstHomeDescCtrl = TextEditingController(text: d?.firstHomeDesc ?? '');
    _firstHomeOwnerCtrl = TextEditingController(text: d?.firstHomeOwner ?? '');
    _secondHomeDescCtrl = TextEditingController(text: d?.secondHomeDesc ?? '');
    _secondHomeOwnerCtrl = TextEditingController(
      text: d?.secondHomeOwner ?? '',
    );
    _motherOccupCtrl = TextEditingController(text: d?.motherOccupation ?? '');
    _motherEduCtrl = TextEditingController(text: d?.motherEducation ?? '');
    _fatherOccupCtrl = TextEditingController(text: d?.fatherOccupation ?? '');
    _fatherEduCtrl = TextEditingController(text: d?.fatherEducation ?? '');
    _decisionMaker = d?.decisionMaker ?? '';
    _separationDecisionCtrl = TextEditingController(
      text: d?.separationDecision ?? '',
    );
    _bothParentsAware = d?.bothParentsAware;
    _members = (d?.familyMembers ?? [])
        .map((m) => _MemberEntry.fromModel(m))
        .toList();
    _autism = _ConditionState.fromModel(d?.autismSpectrum);
    _langDelay = _ConditionState.fromModel(d?.languageDelay);
    _learning = _ConditionState.fromModel(d?.learningDifficulty);
    _adhd = _ConditionState.fromModel(d?.adhd);
    _mood = _ConditionState.fromModel(d?.moodDisorders);
  }

  @override
  void dispose() {
    _firstHomeDescCtrl.dispose();
    _firstHomeOwnerCtrl.dispose();
    _secondHomeDescCtrl.dispose();
    _secondHomeOwnerCtrl.dispose();
    _motherOccupCtrl.dispose();
    _motherEduCtrl.dispose();
    _fatherOccupCtrl.dispose();
    _fatherEduCtrl.dispose();
    _separationDecisionCtrl.dispose();
    for (final m in _members) {
      m.dispose();
    }
    _autism.dispose();
    _langDelay.dispose();
    _learning.dispose();
    _adhd.dispose();
    _mood.dispose();
    super.dispose();
  }

  bool _isNonMarried() =>
      _maritalStatus == 'separated' ||
      _maritalStatus == 'divorced' ||
      _maritalStatus == 'one_deceased';

  bool _validate(AppLocalizations l10n) {
    final formValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      _maritalError = _maritalStatus.isEmpty ? l10n.validationRequired : null;
      _decisionError = _decisionMaker.isEmpty ? l10n.validationRequired : null;
      _awareSError = _bothParentsAware == null ? l10n.validationRequired : null;
    });
    return formValid &&
        _maritalError == null &&
        _decisionError == null &&
        _awareSError == null;
  }

  void _submit(AppLocalizations l10n) {
    if (!_validate(l10n)) return;
    widget.onNext(
      Section2Data(
        maritalStatus: _maritalStatus,
        firstHomeDesc: _isNonMarried() ? _firstHomeDescCtrl.text.trim() : '',
        firstHomeOwner: _isNonMarried() ? _firstHomeOwnerCtrl.text.trim() : '',
        secondHomeDesc: _isNonMarried() ? _secondHomeDescCtrl.text.trim() : '',
        secondHomeOwner: _isNonMarried()
            ? _secondHomeOwnerCtrl.text.trim()
            : '',
        motherOccupation: _motherOccupCtrl.text.trim(),
        motherEducation: _motherEduCtrl.text.trim(),
        fatherOccupation: _fatherOccupCtrl.text.trim(),
        fatherEducation: _fatherEduCtrl.text.trim(),
        decisionMaker: _decisionMaker,
        separationDecision: _isNonMarried()
            ? _separationDecisionCtrl.text.trim()
            : '',
        bothParentsAware: _bothParentsAware,
        familyMembers: _members.map((m) => m.toModel()).toList(),
        autismSpectrum: _autism.toModel(),
        languageDelay: _langDelay.toModel(),
        learningDifficulty: _learning.toModel(),
        adhd: _adhd.toModel(),
        moodDisorders: _mood.toModel(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = ResponsiveHelper(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Title ─────────────────────────────────────────────────────────
          Text(
            l10n.csSection2Title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.p20),

          // ── 1. Marital status ─────────────────────────────────────────────
          FormRadioGroup<String>(
            label: l10n.csMaritalStatus,
            groupValue: _maritalStatus.isEmpty ? null : _maritalStatus,
            errorText: _maritalError,
            onChanged: (v) => setState(() {
              _maritalStatus = v ?? '';
              _maritalError = null;
            }),
            options: [
              RadioOption(label: l10n.csMarried, value: 'married'),
              RadioOption(label: l10n.csSeparated, value: 'separated'),
              RadioOption(label: l10n.csDivorced, value: 'divorced'),
              RadioOption(
                label: l10n.csOneParentDeceased,
                value: 'one_deceased',
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── 2. Child residence (conditional: non-married) ─────────────────
          if (_isNonMarried()) ...[
            _SectionDivider(label: l10n.csChildResidenceTitle),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 8),
              child: Text(
                l10n.csChildResidenceNote,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            FormLabeledField(
              label: l10n.csFirstHome,
              hint: l10n.csFirstHomeHint,
              controller: _firstHomeDescCtrl,
            ),
            const SizedBox(height: AppSpacing.p12),
            FormLabeledField(
              label: l10n.csFirstHomeOwner,
              hint: l10n.csFirstHomeOwnerHint,
              controller: _firstHomeOwnerCtrl,
            ),
            const SizedBox(height: AppSpacing.p12),
            FormLabeledField(
              label: l10n.csSecondHome,
              hint: l10n.csSecondHomeHint,
              controller: _secondHomeDescCtrl,
            ),
            const SizedBox(height: AppSpacing.p12),
            FormLabeledField(
              label: l10n.csSecondHomeOwner,
              hint: l10n.csSecondHomeOwnerHint,
              controller: _secondHomeOwnerCtrl,
            ),
            const SizedBox(height: AppSpacing.p16),
          ],

          // ── 3. Mother occupation & education ──────────────────────────────
          FormLabeledField(
            label: l10n.csMotherOccupation,
            hint: l10n.csMotherOccupationHint,
            controller: _motherOccupCtrl,
            validator: (v) => (v == null || v.trim().isEmpty)
                ? l10n.validationRequired
                : null,
          ),
          const SizedBox(height: AppSpacing.p12),
          FormLabeledField(
            label: l10n.csMotherEducation,
            hint: l10n.csMotherEducationHint,
            controller: _motherEduCtrl,
            validator: (v) => (v == null || v.trim().isEmpty)
                ? l10n.validationRequired
                : null,
          ),
          const SizedBox(height: AppSpacing.p12),

          // ── 4. Father occupation & education ──────────────────────────────
          FormLabeledField(
            label: l10n.csFatherOccupation,
            hint: l10n.csFatherOccupationHint,
            controller: _fatherOccupCtrl,
            validator: (v) => (v == null || v.trim().isEmpty)
                ? l10n.validationRequired
                : null,
          ),
          const SizedBox(height: AppSpacing.p12),
          FormLabeledField(
            label: l10n.csFatherEducation,
            hint: l10n.csFatherEducationHint,
            controller: _fatherEduCtrl,
            validator: (v) => (v == null || v.trim().isEmpty)
                ? l10n.validationRequired
                : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── 5. Decision maker ─────────────────────────────────────────────
          FormRadioGroup<String>(
            label: l10n.csDecisionMaker,
            groupValue: _decisionMaker.isEmpty ? null : _decisionMaker,
            errorText: _decisionError,
            onChanged: (v) => setState(() {
              _decisionMaker = v ?? '';
              _decisionError = null;
            }),
            options: [
              RadioOption(label: l10n.csFamilyConditionFather, value: 'father'),
              RadioOption(label: l10n.csFamilyConditionMother, value: 'mother'),
              RadioOption(label: l10n.csDecisionBoth, value: 'both'),
              RadioOption(
                label: l10n.csDecisionLegalGuardian,
                value: 'legal_guardian',
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── 6. Separation decision details (conditional) ──────────────────
          if (_isNonMarried()) ...[
            FormLabeledField(
              label: l10n.csSeparationDecision,
              hint: l10n.csSeparationDecisionHint,
              controller: _separationDecisionCtrl,
              maxLines: 2,
            ),
            const SizedBox(height: AppSpacing.p16),
          ],

          // ── 7. Both parents aware ─────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csBothParentsAware,
            value: _bothParentsAware,
            errorText: _awareSError,
            onChanged: (v) => setState(() {
              _bothParentsAware = v;
              _awareSError = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p20),

          // ── 8. Family members (optional) ──────────────────────────────────
          _SectionDivider(
            label: '${l10n.csFamilyMembersTitle} ${l10n.csOptional}',
          ),
          const SizedBox(height: AppSpacing.p12),

          ..._members.asMap().entries.map((entry) {
            final i = entry.key;
            final m = entry.value;
            return _MemberCard(
              index: i,
              entry: m,
              l10n: l10n,
              res: res,
              onRemove: () => setState(() => _members.removeAt(i)),
              onChanged: () => setState(() {}),
            );
          }),

          const SizedBox(height: AppSpacing.p8),
          OutlinedButton.icon(
            onPressed: () => setState(() => _members.add(_MemberEntry())),
            icon: const Icon(Icons.add, size: 18),
            label: Text(l10n.csAddPerson),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.p20),

          // ── 9. Family health history ──────────────────────────────────────
          _SectionDivider(label: l10n.csFamilyHealthHistoryTitle),
          const SizedBox(height: AppSpacing.p16),

          _ConditionRow(
            label: l10n.csAutismSpectrum,
            state: _autism,
            l10n: l10n,
            onChanged: () => setState(() {}),
          ),
          const SizedBox(height: AppSpacing.p12),
          _ConditionRow(
            label: l10n.csLanguageDelay,
            state: _langDelay,
            l10n: l10n,
            onChanged: () => setState(() {}),
          ),
          const SizedBox(height: AppSpacing.p12),
          _ConditionRow(
            label: l10n.csLearningDifficulty,
            state: _learning,
            l10n: l10n,
            onChanged: () => setState(() {}),
          ),
          const SizedBox(height: AppSpacing.p12),
          _ConditionRow(
            label: l10n.csADHD,
            state: _adhd,
            l10n: l10n,
            onChanged: () => setState(() {}),
          ),
          const SizedBox(height: AppSpacing.p12),
          _ConditionRow(
            label: l10n.csMoodDisorders,
            state: _mood,
            l10n: l10n,
            onChanged: () => setState(() {}),
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

// ── Section divider ───────────────────────────────────────────────────────────

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

// ── Family member entry state ─────────────────────────────────────────────────

class _MemberEntry {
  final TextEditingController nameCtrl;
  final TextEditingController ageCtrl;
  final TextEditingController relCtrl;
  String residence;

  _MemberEntry({
    String name = '',
    String age = '',
    String rel = '',
    this.residence = '',
  }) : nameCtrl = TextEditingController(text: name),
       ageCtrl = TextEditingController(text: age),
       relCtrl = TextEditingController(text: rel);

  factory _MemberEntry.fromModel(ResidentMember m) => _MemberEntry(
    name: m.name,
    age: m.age,
    rel: m.relationship,
    residence: m.residence,
  );

  ResidentMember toModel() => ResidentMember(
    name: nameCtrl.text.trim(),
    age: ageCtrl.text.trim(),
    relationship: relCtrl.text.trim(),
    residence: residence,
  );

  void dispose() {
    nameCtrl.dispose();
    ageCtrl.dispose();
    relCtrl.dispose();
  }
}

class _MemberCard extends StatelessWidget {
  final int index;
  final _MemberEntry entry;
  final AppLocalizations l10n;
  final ResponsiveHelper res;
  final VoidCallback onRemove;
  final VoidCallback onChanged;

  const _MemberCard({
    required this.index,
    required this.entry,
    required this.l10n,
    required this.res,
    required this.onRemove,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.p12),
      padding: const EdgeInsets.all(AppSpacing.p12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${index + 1}',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: onRemove,
                child: const Icon(
                  Icons.close,
                  size: 18,
                  color: AppColors.error,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.p8),
          Row(
            children: [
              Expanded(
                child: _MiniField(
                  label: l10n.csMemberName,
                  hint: l10n.csMemberNameHint,
                  controller: entry.nameCtrl,
                ),
              ),
              const SizedBox(width: AppSpacing.p8),
              SizedBox(
                width: 80,
                child: _MiniField(
                  label: l10n.csMemberAge,
                  hint: l10n.csMemberAgeHint,
                  controller: entry.ageCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.p8),
          _MiniField(
            label: l10n.csMemberRelationship,
            hint: l10n.csMemberRelationshipHint,
            controller: entry.relCtrl,
          ),
          const SizedBox(height: AppSpacing.p8),
          Text(
            l10n.csMemberResidence,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 4,
            children: [
              _ResidenceChip(
                label: l10n.csResidenceHome1,
                value: 'home1',
                selected: entry.residence,
                onTap: (v) {
                  entry.residence = v;
                  onChanged();
                },
              ),
              _ResidenceChip(
                label: l10n.csResidenceHome2,
                value: 'home2',
                selected: entry.residence,
                onTap: (v) {
                  entry.residence = v;
                  onChanged();
                },
              ),
              _ResidenceChip(
                label: l10n.csResidenceDoesNotLive,
                value: 'does_not_reside',
                selected: entry.residence,
                onTap: (v) {
                  entry.residence = v;
                  onChanged();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const _MiniField({
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
          ),
        ),
      ],
    );
  }
}

class _ResidenceChip extends StatelessWidget {
  final String label;
  final String value;
  final String selected;
  final void Function(String) onTap;

  const _ResidenceChip({
    required this.label,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selected == value;
    return GestureDetector(
      onTap: () => onTap(value),
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
                color: isSelected ? AppColors.primary : Colors.grey.shade400,
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
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? AppColors.primary : AppColors.textPrimary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}

// ── Health condition state ────────────────────────────────────────────────────

class _ConditionState {
  String who;
  final TextEditingController relationCtrl;

  _ConditionState({this.who = 'none', String relation = ''})
    : relationCtrl = TextEditingController(text: relation);

  factory _ConditionState.fromModel(FamilyConditionEntry? e) =>
      _ConditionState(who: e?.who ?? 'none', relation: e?.relation ?? '');

  FamilyConditionEntry toModel() => FamilyConditionEntry(
    who: who,
    relation: (who != 'none') ? relationCtrl.text.trim() : '',
  );

  void dispose() => relationCtrl.dispose();
}

// ── Health condition row ──────────────────────────────────────────────────────

class _ConditionRow extends StatelessWidget {
  final String label;
  final _ConditionState state;
  final AppLocalizations l10n;
  final VoidCallback onChanged;

  const _ConditionRow({
    required this.label,
    required this.state,
    required this.l10n,
    required this.onChanged,
  });

  static const _options = [
    'father',
    'mother',
    'paternal_rel',
    'other_rel',
    'none',
  ];

  String _optionLabel(String v, AppLocalizations l10n) {
    switch (v) {
      case 'father':
        return l10n.csFamilyConditionFather;
      case 'mother':
        return l10n.csFamilyConditionMother;
      case 'paternal_rel':
        return l10n.csFamilyConditionPaternalRel;
      case 'other_rel':
        return l10n.csFamilyConditionOtherRel;
      case 'none':
        return l10n.csFamilyConditionNone;
      default:
        return v;
    }
  }

  @override
  Widget build(BuildContext context) {
    final showRelation = state.who != 'none' && state.who.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 4,
          runSpacing: 2,
          children: _options.map((opt) {
            final isSelected = state.who == opt;
            return GestureDetector(
              onTap: () {
                state.who = opt;
                onChanged();
              },
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
                  const SizedBox(width: 4),
                  Text(
                    _optionLabel(opt, l10n),
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
                  const SizedBox(width: 6),
                ],
              ),
            );
          }).toList(),
        ),
        if (showRelation) ...[
          const SizedBox(height: 8),
          TextField(
            controller: state.relationCtrl,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hintText: l10n.csFamilyConditionRelationHint,
              hintStyle: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
              filled: true,
              fillColor: const Color(0xFFF3F4F6),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
