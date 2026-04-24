import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_labeled_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_yes_no_question.dart';

class Section9Language extends StatefulWidget {
  final Section9Data? initialData;
  final void Function(Section9Data data) onNext;
  final bool isSaving;

  const Section9Language({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section9Language> createState() => _Section9LanguageState();
}

class _Section9LanguageState extends State<Section9Language> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _substitutedLettersCtrl;
  late final TextEditingController _difficultLettersCtrl;

  bool? _speechUnderstoodByMother;
  bool? _hasStuttering;
  bool? _hasLetterSubstitution;
  bool? _speaksUnintelligibly;
  bool? _hasPronunciationDifficulty;
  bool? _languageLikeAgePeers;

  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _substitutedLettersCtrl =
        TextEditingController(text: d?.substitutedLetters ?? '');
    _difficultLettersCtrl =
        TextEditingController(text: d?.difficultLettersAndWords ?? '');

    _speechUnderstoodByMother = d?.speechUnderstoodByMother;
    _hasStuttering = d?.hasStuttering;
    _hasLetterSubstitution = d?.hasLetterSubstitution;
    _speaksUnintelligibly = d?.speaksUnintelligibly;
    _hasPronunciationDifficulty = d?.hasPronunciationDifficulty;
    _languageLikeAgePeers = d?.languageLikeAgePeers;
  }

  @override
  void dispose() {
    _substitutedLettersCtrl.dispose();
    _difficultLettersCtrl.dispose();
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
      checkBool('speechUnderstoodByMother', _speechUnderstoodByMother);
      checkBool('hasStuttering', _hasStuttering);
      checkBool('hasLetterSubstitution', _hasLetterSubstitution);
      checkBool('speaksUnintelligibly', _speaksUnintelligibly);
      checkBool('hasPronunciationDifficulty', _hasPronunciationDifficulty);
      checkBool('languageLikeAgePeers', _languageLikeAgePeers);
    });

    return formValid && allValid;
  }

  void _submit(BuildContext context) {
    if (!_validate(context)) return;
    widget.onNext(
      Section9Data(
        speechUnderstoodByMother: _speechUnderstoodByMother,
        hasStuttering: _hasStuttering,
        hasLetterSubstitution: _hasLetterSubstitution,
        substitutedLetters: _hasLetterSubstitution == true
            ? _substitutedLettersCtrl.text.trim()
            : '',
        speaksUnintelligibly: _speaksUnintelligibly,
        hasPronunciationDifficulty: _hasPronunciationDifficulty,
        difficultLettersAndWords: _hasPronunciationDifficulty == true
            ? _difficultLettersCtrl.text.trim()
            : '',
        languageLikeAgePeers: _languageLikeAgePeers,
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
            l10n.csSection9Title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            '(${l10n.csSection9Subtitle})',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.p24),

          // ── Q1: Speech understood ─────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS9SpeechUnderstoodByMother,
            value: _speechUnderstoodByMother,
            errorText: _errors['speechUnderstoodByMother'],
            onChanged: (v) => setState(() {
              _speechUnderstoodByMother = v;
              _errors['speechUnderstoodByMother'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q2: Stuttering ────────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS9HasStuttering,
            value: _hasStuttering,
            errorText: _errors['hasStuttering'],
            onChanged: (v) => setState(() {
              _hasStuttering = v;
              _errors['hasStuttering'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q3: Letter substitution ───────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS9HasLetterSubstitution,
            value: _hasLetterSubstitution,
            errorText: _errors['hasLetterSubstitution'],
            onChanged: (v) => setState(() {
              _hasLetterSubstitution = v;
              _errors['hasLetterSubstitution'] = null;
            }),
            conditionalChild: _ConditionalField(
              label: l10n.csS9SubstitutedLetters,
              hint: l10n.csS9SubstitutedLettersHint,
              note: l10n.csIfPreviousYes,
              controller: _substitutedLettersCtrl,
              isRequired: _hasLetterSubstitution == true,
              requiredMsg: _req(context),
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q4: Speaks unintelligibly ─────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS9SpeaksUnintelligibly,
            value: _speaksUnintelligibly,
            errorText: _errors['speaksUnintelligibly'],
            onChanged: (v) => setState(() {
              _speaksUnintelligibly = v;
              _errors['speaksUnintelligibly'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q5: Pronunciation difficulty ──────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS9HasPronunciationDifficulty,
            value: _hasPronunciationDifficulty,
            errorText: _errors['hasPronunciationDifficulty'],
            onChanged: (v) => setState(() {
              _hasPronunciationDifficulty = v;
              _errors['hasPronunciationDifficulty'] = null;
            }),
            conditionalChild: _ConditionalField(
              label: l10n.csS9DifficultLettersAndWords,
              hint: l10n.csS9DifficultLettersHint,
              note: l10n.csIfPreviousYes,
              controller: _difficultLettersCtrl,
              isRequired: _hasPronunciationDifficulty == true,
              requiredMsg: _req(context),
            ),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q6: Language like age peers ───────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS9LanguageLikeAgePeers,
            value: _languageLikeAgePeers,
            errorText: _errors['languageLikeAgePeers'],
            onChanged: (v) => setState(() {
              _languageLikeAgePeers = v;
              _errors['languageLikeAgePeers'] = null;
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
