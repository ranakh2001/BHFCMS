import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_card.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_notes_field.dart';
import '../widgets/form_radio_group.dart';
import '../widgets/form_section_header.dart';
import '../widgets/form_subsection_title.dart';
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
  // ── Problem behaviors ──────────────────────────────────────────────────────
  late final TextEditingController _aggressionCtrl;
  late final TextEditingController _selfHarmCtrl;
  late final TextEditingController _stereotypicalCtrl;
  late final TextEditingController _resistanceCtrl;
  late final TextEditingController _excessiveAttachmentCtrl;

  // ── Behavioral patterns ────────────────────────────────────────────────────
  final List<_PatternCtrls> _patterns = [];

  // ── Sensory integration ────────────────────────────────────────────────────
  late String _generalAttentionState;
  late final TextEditingController _generalStateNotesCtrl;
  bool? _hasSensoryIssues;
  late final TextEditingController _sensoryIssuesNotesCtrl;
  bool? _hearingIssue;
  late final TextEditingController _hearingNotesCtrl;
  bool? _touchIssue;
  late final TextEditingController _touchNotesCtrl;
  bool? _tasteIssue;
  late final TextEditingController _tasteNotesCtrl;
  bool? _vestibularIssue;
  late final TextEditingController _vestibularNotesCtrl;
  bool? _visualSensoryIssue;
  late final TextEditingController _visualSensoryNotesCtrl;
  late final TextEditingController _sensoryReactionCtrl;

  // ── Social behaviors ───────────────────────────────────────────────────────
  bool? _makesFriendsEasily;
  late final TextEditingController _makesFriendsNotesCtrl;
  bool? _sharesInterests;
  late final TextEditingController _sharesInterestsNotesCtrl;
  late String _abuseExposure;
  late final TextEditingController _abuseNotesCtrl;
  bool? _hasSignificantSocialEvent;
  late final TextEditingController _significantSocialEventNotesCtrl;
  late final TextEditingController _reactionToNegativeBehaviorCtrl;

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;

    _aggressionCtrl =
        TextEditingController(text: d?.aggressionDescription ?? '');
    _selfHarmCtrl =
        TextEditingController(text: d?.selfHarmDescription ?? '');
    _stereotypicalCtrl =
        TextEditingController(text: d?.stereotypicalBehaviorsDescription ?? '');
    _resistanceCtrl =
        TextEditingController(text: d?.resistanceToChangeDescription ?? '');
    _excessiveAttachmentCtrl =
        TextEditingController(text: d?.excessiveAttachmentDescription ?? '');

    final patterns = d?.behavioralPatterns ?? const [];
    if (patterns.isEmpty) {
      _patterns.add(_PatternCtrls());
    } else {
      for (final bp in patterns) {
        _patterns.add(_PatternCtrls(
          p: bp.pattern,
          pr: bp.practices,
          ef: bp.expectedFunction,
        ));
      }
    }

    _generalAttentionState = d?.generalAttentionState ?? '';
    _generalStateNotesCtrl =
        TextEditingController(text: d?.generalStateNotes ?? '');
    _hasSensoryIssues = d?.hasSensoryIssues;
    _sensoryIssuesNotesCtrl =
        TextEditingController(text: d?.sensoryIssuesNotes ?? '');
    _hearingIssue = d?.hearingIssue;
    _hearingNotesCtrl =
        TextEditingController(text: d?.hearingNotes ?? '');
    _touchIssue = d?.touchIssue;
    _touchNotesCtrl =
        TextEditingController(text: d?.touchNotes ?? '');
    _tasteIssue = d?.tasteIssue;
    _tasteNotesCtrl =
        TextEditingController(text: d?.tasteNotes ?? '');
    _vestibularIssue = d?.vestibularIssue;
    _vestibularNotesCtrl =
        TextEditingController(text: d?.vestibularNotes ?? '');
    _visualSensoryIssue = d?.visualSensoryIssue;
    _visualSensoryNotesCtrl =
        TextEditingController(text: d?.visualSensoryNotes ?? '');
    _sensoryReactionCtrl =
        TextEditingController(text: d?.sensoryReactionDescription ?? '');

    _makesFriendsEasily = d?.makesFriendsEasily;
    _makesFriendsNotesCtrl =
        TextEditingController(text: d?.makesFriendsNotes ?? '');
    _sharesInterests = d?.sharesInterests;
    _sharesInterestsNotesCtrl =
        TextEditingController(text: d?.sharesInterestsNotes ?? '');
    _abuseExposure = d?.abuseExposure ?? '';
    _abuseNotesCtrl =
        TextEditingController(text: d?.abuseNotes ?? '');
    _hasSignificantSocialEvent = d?.hasSignificantSocialEvent;
    _significantSocialEventNotesCtrl =
        TextEditingController(text: d?.significantSocialEventNotes ?? '');
    _reactionToNegativeBehaviorCtrl =
        TextEditingController(text: d?.reactionToNegativeBehavior ?? '');
  }

  @override
  void dispose() {
    _aggressionCtrl.dispose();
    _selfHarmCtrl.dispose();
    _stereotypicalCtrl.dispose();
    _resistanceCtrl.dispose();
    _excessiveAttachmentCtrl.dispose();
    for (final pc in _patterns) {
      pc.dispose();
    }
    _generalStateNotesCtrl.dispose();
    _sensoryIssuesNotesCtrl.dispose();
    _hearingNotesCtrl.dispose();
    _touchNotesCtrl.dispose();
    _tasteNotesCtrl.dispose();
    _vestibularNotesCtrl.dispose();
    _visualSensoryNotesCtrl.dispose();
    _sensoryReactionCtrl.dispose();
    _makesFriendsNotesCtrl.dispose();
    _sharesInterestsNotesCtrl.dispose();
    _abuseNotesCtrl.dispose();
    _significantSocialEventNotesCtrl.dispose();
    _reactionToNegativeBehaviorCtrl.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    widget.onNext(Section8Data(
      aggressionDescription: _aggressionCtrl.text.trim(),
      selfHarmDescription: _selfHarmCtrl.text.trim(),
      stereotypicalBehaviorsDescription: _stereotypicalCtrl.text.trim(),
      resistanceToChangeDescription: _resistanceCtrl.text.trim(),
      excessiveAttachmentDescription: _excessiveAttachmentCtrl.text.trim(),
      behavioralPatterns: _patterns
          .map((pc) => BehavioralPattern(
                pattern: pc.pattern.text.trim(),
                practices: pc.practices.text.trim(),
                expectedFunction: pc.expectedFunction.text.trim(),
              ))
          .toList(),
      generalAttentionState: _generalAttentionState,
      generalStateNotes: _generalStateNotesCtrl.text.trim(),
      hasSensoryIssues: _hasSensoryIssues,
      sensoryIssuesNotes: _sensoryIssuesNotesCtrl.text.trim(),
      hearingIssue: _hearingIssue,
      hearingNotes: _hearingNotesCtrl.text.trim(),
      touchIssue: _touchIssue,
      touchNotes: _touchNotesCtrl.text.trim(),
      tasteIssue: _tasteIssue,
      tasteNotes: _tasteNotesCtrl.text.trim(),
      vestibularIssue: _vestibularIssue,
      vestibularNotes: _vestibularNotesCtrl.text.trim(),
      visualSensoryIssue: _visualSensoryIssue,
      visualSensoryNotes: _visualSensoryNotesCtrl.text.trim(),
      sensoryReactionDescription: _sensoryReactionCtrl.text.trim(),
      makesFriendsEasily: _makesFriendsEasily,
      makesFriendsNotes: _makesFriendsNotesCtrl.text.trim(),
      sharesInterests: _sharesInterests,
      sharesInterestsNotes: _sharesInterestsNotesCtrl.text.trim(),
      abuseExposure: _abuseExposure,
      abuseNotes: _abuseNotesCtrl.text.trim(),
      hasSignificantSocialEvent: _hasSignificantSocialEvent,
      significantSocialEventNotes: _significantSocialEventNotesCtrl.text.trim(),
      reactionToNegativeBehavior: _reactionToNegativeBehaviorCtrl.text.trim(),
    ));
  }

  Widget _behaviorField(
    String label,
    TextEditingController ctrl,
    String hint,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        FormNotesField(controller: ctrl, hint: hint, maxLines: 2),
      ],
    );
  }

  Widget _patternCard(AppLocalizations l10n, int idx) {
    final pc = _patterns[idx];
    return FormCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${l10n.csS8PatternLabel} ${idx + 1}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  pc.dispose();
                  _patterns.removeAt(idx);
                }),
                child: const Icon(
                  Icons.close,
                  size: 18,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.p8),
          Text(
            l10n.csS8PatternLabel,
            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 4),
          FormNotesField(controller: pc.pattern, hint: l10n.csS8PatternHint),
          const SizedBox(height: AppSpacing.p8),
          Text(
            l10n.csS8PracticesLabel,
            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 4),
          FormNotesField(
              controller: pc.practices, hint: l10n.csS8PracticesHint),
          const SizedBox(height: AppSpacing.p8),
          Text(
            l10n.csS8ExpectedFunctionLabel,
            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 4),
          FormNotesField(
              controller: pc.expectedFunction,
              hint: l10n.csS8ExpectedFunctionHint),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Header ────────────────────────────────────────────────────────────
        FormSectionHeader(title: l10n.csSection8Title),
        const SizedBox(height: AppSpacing.p24),

        // ── 1. Problem Behaviors ──────────────────────────────────────────────
        FormSubsectionTitle(l10n.csS8ProblemBehaviorsTitle),
        const SizedBox(height: AppSpacing.p12),
        _behaviorField(
            l10n.csS8Aggression, _aggressionCtrl, l10n.csS8BehaviorDescHint),
        const SizedBox(height: AppSpacing.p12),
        _behaviorField(
            l10n.csS8SelfHarm, _selfHarmCtrl, l10n.csS8BehaviorDescHint),
        const SizedBox(height: AppSpacing.p12),
        _behaviorField(l10n.csS8StereotypicalBehaviors, _stereotypicalCtrl,
            l10n.csS8BehaviorDescHint),
        const SizedBox(height: AppSpacing.p12),
        _behaviorField(l10n.csS8ResistanceToChange, _resistanceCtrl,
            l10n.csS8BehaviorDescHint),
        const SizedBox(height: AppSpacing.p12),
        _behaviorField(l10n.csS8ExcessiveAttachment, _excessiveAttachmentCtrl,
            l10n.csS8BehaviorDescHint),
        const SizedBox(height: AppSpacing.p24),

        // ── 2. Behavioral Patterns ────────────────────────────────────────────
        FormSubsectionTitle(l10n.csS8BehavioralPatternsTitle),
        const SizedBox(height: AppSpacing.p12),
        for (int i = 0; i < _patterns.length; i++) ...[
          _patternCard(l10n, i),
          const SizedBox(height: AppSpacing.p12),
        ],
        OutlinedButton.icon(
          onPressed: () => setState(() => _patterns.add(_PatternCtrls())),
          icon: const Icon(Icons.add, size: 18),
          label: Text(l10n.csS8AddPattern),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── 3. Sensory Integration ────────────────────────────────────────────
        FormSubsectionTitle(l10n.csS8SensoryTitle),
        const SizedBox(height: AppSpacing.p12),
        FormRadioGroup<String>(
          label: l10n.csS8GeneralStateLabel,
          options: [
            RadioOption(label: l10n.csS8StateCalm, value: 'calm'),
            RadioOption(label: l10n.csS8StateDistracted, value: 'distracted'),
            RadioOption(label: l10n.csS8StateVeryActive, value: 'very_active'),
            RadioOption(
                label: l10n.csS8StateFastTransition, value: 'fast_transition'),
            RadioOption(label: l10n.csS8StateAbnormal, value: 'abnormal'),
          ],
          groupValue:
              _generalAttentionState.isEmpty ? null : _generalAttentionState,
          onChanged: (v) =>
              setState(() => _generalAttentionState = v ?? ''),
        ),
        const SizedBox(height: AppSpacing.p8),
        FormNotesField(
          controller: _generalStateNotesCtrl,
          hint: l10n.csS8GeneralStateNotesHint,
          maxLines: 2,
        ),
        const SizedBox(height: AppSpacing.p16),
        FormYesNoQuestion(
          label: l10n.csS8HasSensoryIssues,
          value: _hasSensoryIssues,
          onChanged: (v) => setState(() => _hasSensoryIssues = v),
          conditionalChild: FormNotesField(
            controller: _sensoryIssuesNotesCtrl,
            hint: l10n.csS8SensoryIssuesNotesHint,
            maxLines: 2,
          ),
        ),
        const SizedBox(height: AppSpacing.p16),
        Text(
          l10n.csS8SensoryInterestsLabel,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.p12),
        FormYesNoQuestion(
          label: l10n.csS8HearingIssue,
          value: _hearingIssue,
          onChanged: (v) => setState(() => _hearingIssue = v),
          conditionalChild: FormNotesField(
            controller: _hearingNotesCtrl,
            hint: l10n.csS8SensoryNotesHint,
          ),
        ),
        const SizedBox(height: AppSpacing.p12),
        FormYesNoQuestion(
          label: l10n.csS8TouchIssue,
          value: _touchIssue,
          onChanged: (v) => setState(() => _touchIssue = v),
          conditionalChild: FormNotesField(
            controller: _touchNotesCtrl,
            hint: l10n.csS8SensoryNotesHint,
          ),
        ),
        const SizedBox(height: AppSpacing.p12),
        FormYesNoQuestion(
          label: l10n.csS8TasteIssue,
          value: _tasteIssue,
          onChanged: (v) => setState(() => _tasteIssue = v),
          conditionalChild: FormNotesField(
            controller: _tasteNotesCtrl,
            hint: l10n.csS8SensoryNotesHint,
          ),
        ),
        const SizedBox(height: AppSpacing.p12),
        FormYesNoQuestion(
          label: l10n.csS8VestibularIssue,
          value: _vestibularIssue,
          onChanged: (v) => setState(() => _vestibularIssue = v),
          conditionalChild: FormNotesField(
            controller: _vestibularNotesCtrl,
            hint: l10n.csS8SensoryNotesHint,
          ),
        ),
        const SizedBox(height: AppSpacing.p12),
        FormYesNoQuestion(
          label: l10n.csS8VisualSensoryIssue,
          value: _visualSensoryIssue,
          onChanged: (v) => setState(() => _visualSensoryIssue = v),
          conditionalChild: FormNotesField(
            controller: _visualSensoryNotesCtrl,
            hint: l10n.csS8SensoryNotesHint,
          ),
        ),
        const SizedBox(height: AppSpacing.p16),
        Text(
          l10n.csS8SensoryReactionLabel,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.p8),
        FormNotesField(
          controller: _sensoryReactionCtrl,
          hint: l10n.csS8SensoryReactionHint,
          maxLines: 3,
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── 4. Social Behaviors ───────────────────────────────────────────────
        FormSubsectionTitle(l10n.csS8SocialBehaviorsTitle),
        const SizedBox(height: AppSpacing.p12),
        FormYesNoQuestion(
          label: l10n.csS8MakesFriendsEasily,
          value: _makesFriendsEasily,
          onChanged: (v) => setState(() => _makesFriendsEasily = v),
          conditionalChild: FormNotesField(
            controller: _makesFriendsNotesCtrl,
            hint: l10n.csS8MakesFriendsNotesHint,
            maxLines: 2,
          ),
        ),
        const SizedBox(height: AppSpacing.p16),
        FormYesNoQuestion(
          label: l10n.csS8SharesInterests,
          value: _sharesInterests,
          onChanged: (v) => setState(() => _sharesInterests = v),
          conditionalChild: FormNotesField(
            controller: _sharesInterestsNotesCtrl,
            hint: l10n.csS8SharesInterestsNotesHint,
            maxLines: 2,
          ),
        ),
        const SizedBox(height: AppSpacing.p16),
        FormRadioGroup<String>(
          label: l10n.csS8AbuseExposure,
          options: [
            RadioOption(label: l10n.csYes, value: 'yes'),
            RadioOption(label: l10n.csNo, value: 'no'),
            RadioOption(label: l10n.csS8AbuseWitnessed, value: 'witnessed'),
          ],
          groupValue: _abuseExposure.isEmpty ? null : _abuseExposure,
          onChanged: (v) => setState(() => _abuseExposure = v ?? ''),
        ),
        if (_abuseExposure == 'yes' || _abuseExposure == 'witnessed') ...[
          const SizedBox(height: AppSpacing.p8),
          FormNotesField(
            controller: _abuseNotesCtrl,
            hint: l10n.csS8AbuseNotesHint,
            maxLines: 2,
          ),
        ],
        const SizedBox(height: AppSpacing.p16),
        FormYesNoQuestion(
          label: l10n.csS8HasSignificantSocialEvent,
          value: _hasSignificantSocialEvent,
          onChanged: (v) => setState(() => _hasSignificantSocialEvent = v),
          conditionalChild: FormNotesField(
            controller: _significantSocialEventNotesCtrl,
            hint: l10n.csS8SignificantSocialEventNotesHint,
            maxLines: 2,
          ),
        ),
        const SizedBox(height: AppSpacing.p16),
        Text(
          l10n.csS8ReactionToNegativeBehavior,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.p8),
        FormNotesField(
          controller: _reactionToNegativeBehaviorCtrl,
          hint: l10n.csS8ReactionToNegativeBehaviorHint,
          maxLines: 3,
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

// ═══════════════════════════════════════════════════════════════════════════════
// Private helpers
// ═══════════════════════════════════════════════════════════════════════════════

class _PatternCtrls {
  final TextEditingController pattern;
  final TextEditingController practices;
  final TextEditingController expectedFunction;

  _PatternCtrls({String p = '', String pr = '', String ef = ''})
      : pattern = TextEditingController(text: p),
        practices = TextEditingController(text: pr),
        expectedFunction = TextEditingController(text: ef);

  void dispose() {
    pattern.dispose();
    practices.dispose();
    expectedFunction.dispose();
  }
}
