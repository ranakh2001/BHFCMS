import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_card.dart';
import '../widgets/form_checkbox_item.dart';
import '../widgets/form_labeled_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_notes_field.dart';
import '../widgets/form_section_header.dart';
import '../widgets/form_subsection_title.dart';
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
  // ── Social / Emotional ────────────────────────────────────────────────────
  late bool _socialSmile;
  late bool _knowsFamily;
  late bool _respondsToName;
  late bool _showsAffection;
  late bool _shyOrFearful;

  // ── Cognitive ─────────────────────────────────────────────────────────────
  late bool _imitatesAdults;
  late bool _putsInMouth;
  late bool _recognizesColors;
  late bool _imaginativePlay;
  late bool _followsInstructions;

  // ── Language / Communication ──────────────────────────────────────────────
  late bool _cooing;
  late bool _twoWordPhrases;
  late bool _usesGestures;
  late bool _requestsByWords;

  // ── Motor / Physical ──────────────────────────────────────────────────────
  late bool _sittingCrawling;
  late bool _jumpingClimbing;
  late bool _walkingWithoutHelp;
  late bool _holdingPenDrawing;
  late bool _kickingThrowing;

  // ── Milestone ages + notes ────────────────────────────────────────────────
  late final TextEditingController _socialSmileAgeCtrl;
  late final TextEditingController _socialSmileNotesCtrl;
  late final TextEditingController _sittingAgeCtrl;
  late final TextEditingController _sittingNotesCtrl;
  late final TextEditingController _walkingAgeCtrl;
  late final TextEditingController _walkingNotesCtrl;
  late final TextEditingController _firstWordAgeCtrl;
  late final TextEditingController _firstWordNotesCtrl;

  // ── Regression ────────────────────────────────────────────────────────────
  bool? _hadRegression;
  late final TextEditingController _regressionAgeCtrl;
  late final TextEditingController _regressionDetailsCtrl;

  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;

    _socialSmile = d?.socialSmile ?? false;
    _knowsFamily = d?.knowsFamilyMembers ?? false;
    _respondsToName = d?.respondsToName ?? false;
    _showsAffection = d?.showsAffection ?? false;
    _shyOrFearful = d?.shyOrFearful ?? false;

    _imitatesAdults = d?.imitatesAdults ?? false;
    _putsInMouth = d?.putsObjectsInMouth ?? false;
    _recognizesColors = d?.recognizesColors ?? false;
    _imaginativePlay = d?.imaginativePlay ?? false;
    _followsInstructions = d?.followsInstructions ?? false;

    _cooing = d?.cooing ?? false;
    _twoWordPhrases = d?.twoWordPhrases ?? false;
    _usesGestures = d?.usesGestures ?? false;
    _requestsByWords = d?.requestsByWords ?? false;

    _sittingCrawling = d?.sittingCrawling ?? false;
    _jumpingClimbing = d?.jumpingClimbing ?? false;
    _walkingWithoutHelp = d?.walkingWithoutHelp ?? false;
    _holdingPenDrawing = d?.holdingPenDrawing ?? false;
    _kickingThrowing = d?.kickingThrowing ?? false;

    _socialSmileAgeCtrl =
        TextEditingController(text: d?.socialSmileAge ?? '');
    _socialSmileNotesCtrl =
        TextEditingController(text: d?.socialSmileNotes ?? '');
    _sittingAgeCtrl =
        TextEditingController(text: d?.independentSittingAge ?? '');
    _sittingNotesCtrl =
        TextEditingController(text: d?.independentSittingNotes ?? '');
    _walkingAgeCtrl =
        TextEditingController(text: d?.independentWalkingAge ?? '');
    _walkingNotesCtrl =
        TextEditingController(text: d?.independentWalkingNotes ?? '');
    _firstWordAgeCtrl =
        TextEditingController(text: d?.firstWordAge ?? '');
    _firstWordNotesCtrl =
        TextEditingController(text: d?.firstWordNotes ?? '');

    _hadRegression = d?.hadSkillRegression;
    _regressionAgeCtrl =
        TextEditingController(text: d?.regressionAge ?? '');
    _regressionDetailsCtrl =
        TextEditingController(text: d?.regressionDetails ?? '');
  }

  @override
  void dispose() {
    _socialSmileAgeCtrl.dispose();
    _socialSmileNotesCtrl.dispose();
    _sittingAgeCtrl.dispose();
    _sittingNotesCtrl.dispose();
    _walkingAgeCtrl.dispose();
    _walkingNotesCtrl.dispose();
    _firstWordAgeCtrl.dispose();
    _firstWordNotesCtrl.dispose();
    _regressionAgeCtrl.dispose();
    _regressionDetailsCtrl.dispose();
    super.dispose();
  }

  String _req(BuildContext context) =>
      AppLocalizations.of(context)!.validationRequired;

  bool _validate(BuildContext context) {
    setState(() {
      _errors['hadRegression'] =
          _hadRegression == null ? _req(context) : null;
    });
    return _hadRegression != null;
  }

  void _submit(BuildContext context) {
    if (!_validate(context)) return;
    widget.onNext(Section5Data(
      socialSmile: _socialSmile,
      knowsFamilyMembers: _knowsFamily,
      respondsToName: _respondsToName,
      showsAffection: _showsAffection,
      shyOrFearful: _shyOrFearful,
      imitatesAdults: _imitatesAdults,
      putsObjectsInMouth: _putsInMouth,
      recognizesColors: _recognizesColors,
      imaginativePlay: _imaginativePlay,
      followsInstructions: _followsInstructions,
      cooing: _cooing,
      twoWordPhrases: _twoWordPhrases,
      usesGestures: _usesGestures,
      requestsByWords: _requestsByWords,
      sittingCrawling: _sittingCrawling,
      jumpingClimbing: _jumpingClimbing,
      walkingWithoutHelp: _walkingWithoutHelp,
      holdingPenDrawing: _holdingPenDrawing,
      kickingThrowing: _kickingThrowing,
      socialSmileAge: _socialSmileAgeCtrl.text.trim(),
      socialSmileNotes: _socialSmileNotesCtrl.text.trim(),
      independentSittingAge: _sittingAgeCtrl.text.trim(),
      independentSittingNotes: _sittingNotesCtrl.text.trim(),
      independentWalkingAge: _walkingAgeCtrl.text.trim(),
      independentWalkingNotes: _walkingNotesCtrl.text.trim(),
      firstWordAge: _firstWordAgeCtrl.text.trim(),
      firstWordNotes: _firstWordNotesCtrl.text.trim(),
      hadSkillRegression: _hadRegression,
      regressionAge: _hadRegression == true
          ? _regressionAgeCtrl.text.trim()
          : '',
      regressionDetails: _hadRegression == true
          ? _regressionDetailsCtrl.text.trim()
          : '',
    ));
  }

  Widget _grid(ResponsiveHelper res, List<Widget> items) {
    final itemWidth =
        (MediaQuery.of(context).size.width - res.scaleSpacing(48)) / 2;
    return Wrap(
      spacing: res.scaleSpacing(8),
      runSpacing: res.scaleSpacing(10),
      children:
          items.map((item) => SizedBox(width: itemWidth, child: item)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = ResponsiveHelper(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Section title ─────────────────────────────────────────────────
        FormSectionHeader(
          title: l10n.csSection5Title,
          subtitle: l10n.csS5Subtitle,
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── 1. Social / Emotional ─────────────────────────────────────────
        FormSubsectionTitle(l10n.csS5SocialEmotionalTitle),
        const SizedBox(height: AppSpacing.p12),
        _grid(res, [
          FormCheckboxItem(label: l10n.csS5SocialSmile, value: _socialSmile, onChanged: (v) => setState(() => _socialSmile = v)),
          FormCheckboxItem(label: l10n.csS5KnowsFamilyMembers, value: _knowsFamily, onChanged: (v) => setState(() => _knowsFamily = v)),
          FormCheckboxItem(label: l10n.csS5RespondsToName, value: _respondsToName, onChanged: (v) => setState(() => _respondsToName = v)),
          FormCheckboxItem(label: l10n.csS5ShowsAffection, value: _showsAffection, onChanged: (v) => setState(() => _showsAffection = v)),
          FormCheckboxItem(label: l10n.csS5ShyOrFearful, value: _shyOrFearful, onChanged: (v) => setState(() => _shyOrFearful = v)),
        ]),
        const SizedBox(height: AppSpacing.p20),

        // ── 2. Cognitive ──────────────────────────────────────────────────
        FormSubsectionTitle(l10n.csS5CognitiveTitle),
        const SizedBox(height: AppSpacing.p12),
        _grid(res, [
          FormCheckboxItem(label: l10n.csS5ImitatesAdults, value: _imitatesAdults, onChanged: (v) => setState(() => _imitatesAdults = v)),
          FormCheckboxItem(label: l10n.csS5PutsObjectsInMouth, value: _putsInMouth, onChanged: (v) => setState(() => _putsInMouth = v)),
          FormCheckboxItem(label: l10n.csS5RecognizesColors, value: _recognizesColors, onChanged: (v) => setState(() => _recognizesColors = v)),
          FormCheckboxItem(label: l10n.csS5ImaginativePlay, value: _imaginativePlay, onChanged: (v) => setState(() => _imaginativePlay = v)),
          FormCheckboxItem(label: l10n.csS5FollowsInstructions, value: _followsInstructions, onChanged: (v) => setState(() => _followsInstructions = v)),
        ]),
        const SizedBox(height: AppSpacing.p20),

        // ── 3. Language / Communication ───────────────────────────────────
        FormSubsectionTitle(l10n.csS5LanguageTitle),
        const SizedBox(height: AppSpacing.p12),
        _grid(res, [
          FormCheckboxItem(label: l10n.csS5Cooing, value: _cooing, onChanged: (v) => setState(() => _cooing = v)),
          FormCheckboxItem(label: l10n.csS5TwoWordPhrases, value: _twoWordPhrases, onChanged: (v) => setState(() => _twoWordPhrases = v)),
          FormCheckboxItem(label: l10n.csS5UsesGestures, value: _usesGestures, onChanged: (v) => setState(() => _usesGestures = v)),
          FormCheckboxItem(label: l10n.csS5RequestsByWords, value: _requestsByWords, onChanged: (v) => setState(() => _requestsByWords = v)),
        ]),
        const SizedBox(height: AppSpacing.p20),

        // ── 4. Motor / Physical ───────────────────────────────────────────
        FormSubsectionTitle(l10n.csS5MotorTitle),
        const SizedBox(height: AppSpacing.p12),
        _grid(res, [
          FormCheckboxItem(label: l10n.csS5SittingCrawling, value: _sittingCrawling, onChanged: (v) => setState(() => _sittingCrawling = v)),
          FormCheckboxItem(label: l10n.csS5JumpingClimbing, value: _jumpingClimbing, onChanged: (v) => setState(() => _jumpingClimbing = v)),
          FormCheckboxItem(label: l10n.csS5WalkingWithoutHelp, value: _walkingWithoutHelp, onChanged: (v) => setState(() => _walkingWithoutHelp = v)),
          FormCheckboxItem(label: l10n.csS5HoldingPenDrawing, value: _holdingPenDrawing, onChanged: (v) => setState(() => _holdingPenDrawing = v)),
          FormCheckboxItem(label: l10n.csS5KickingThrowing, value: _kickingThrowing, onChanged: (v) => setState(() => _kickingThrowing = v)),
        ]),
        const SizedBox(height: AppSpacing.p24),

        // ── 5. Milestone Ages ─────────────────────────────────────────────
        FormSubsectionTitle(l10n.csS5MilestoneAgesTitle),
        const SizedBox(height: AppSpacing.p12),
        _MilestoneCard(
          label: l10n.csS5SocialSmileMilestone,
          ageCtrl: _socialSmileAgeCtrl,
          notesCtrl: _socialSmileNotesCtrl,
          ageHint: l10n.csS5AgeHint,
          notesHint: l10n.csS5NotesHint,
        ),
        const SizedBox(height: AppSpacing.p12),
        _MilestoneCard(
          label: l10n.csS5IndependentSitting,
          ageCtrl: _sittingAgeCtrl,
          notesCtrl: _sittingNotesCtrl,
          ageHint: l10n.csS5AgeHint,
          notesHint: l10n.csS5NotesHint,
        ),
        const SizedBox(height: AppSpacing.p12),
        _MilestoneCard(
          label: l10n.csS5IndependentWalking,
          ageCtrl: _walkingAgeCtrl,
          notesCtrl: _walkingNotesCtrl,
          ageHint: l10n.csS5AgeHint,
          notesHint: l10n.csS5NotesHint,
        ),
        const SizedBox(height: AppSpacing.p12),
        _MilestoneCard(
          label: l10n.csS5FirstFunctionalWord,
          ageCtrl: _firstWordAgeCtrl,
          notesCtrl: _firstWordNotesCtrl,
          ageHint: l10n.csS5AgeHint,
          notesHint: l10n.csS5NotesHint,
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── 6. Skill Regression ───────────────────────────────────────────
        FormSubsectionTitle(l10n.csS5RegressionTitle),
        const SizedBox(height: AppSpacing.p12),
        FormYesNoQuestion(
          label: l10n.csS5RegressionQuestion,
          value: _hadRegression,
          errorText: _errors['hadRegression'],
          onChanged: (v) => setState(() {
            _hadRegression = v;
            _errors['hadRegression'] = null;
          }),
          conditionalChild: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FormLabeledField(
                    label: l10n.csS5RegressionAgeLabel,
                    hint: l10n.csS5RegressionAgeHint,
                    controller: _regressionAgeCtrl,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.csS5RegressionAgeNote,
                    style: const TextStyle(
                      fontSize: 11.5,
                      color: AppColors.textSecondary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.p12),
              FormLabeledField(
                label: l10n.csS5RegressionDetailsLabel,
                hint: l10n.csS5RegressionDetailsHint,
                controller: _regressionDetailsCtrl,
                maxLines: 3,
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
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Private helpers
// ═══════════════════════════════════════════════════════════════════════════

// ── Milestone card ────────────────────────────────────────────────────────

class _MilestoneCard extends StatelessWidget {
  final String label;
  final TextEditingController ageCtrl;
  final TextEditingController notesCtrl;
  final String ageHint;
  final String notesHint;

  const _MilestoneCard({
    required this.label,
    required this.ageCtrl,
    required this.notesCtrl,
    required this.ageHint,
    required this.notesHint,
  });

  @override
  Widget build(BuildContext context) {
    return FormCard(
      padding: const EdgeInsets.all(12),
      child: Column(
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
          FormLabeledField(
            label: '',
            hint: ageHint,
            controller: ageCtrl,
          ),
          const SizedBox(height: AppSpacing.p8),
          FormNotesField(controller: notesCtrl, hint: notesHint),
        ],
      ),
    );
  }
}
