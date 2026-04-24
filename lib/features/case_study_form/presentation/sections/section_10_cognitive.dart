import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_radio_group.dart';
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
  bool? _followsInstructions;
  bool? _completesAssignedTasks;
  String? _understandsInstructions;
  bool? _hasMemoryDifficulty;
  bool? _hasNamingDifficulty;
  bool? _isImpulsive;
  String? _concentrationLevel;

  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _followsInstructions = d?.followsInstructions;
    _completesAssignedTasks = d?.completesAssignedTasks;
    _understandsInstructions = d?.understandsInstructions.isEmpty ?? true
        ? null
        : d!.understandsInstructions;
    _hasMemoryDifficulty = d?.hasMemoryDifficulty;
    _hasNamingDifficulty = d?.hasNamingDifficulty;
    _isImpulsive = d?.isImpulsive;
    _concentrationLevel =
        d?.concentrationLevel.isEmpty ?? true ? null : d!.concentrationLevel;
  }

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

    void checkStr(String key, String? v) {
      if (v == null || v.isEmpty) {
        _errors[key] = _req(context);
        allValid = false;
      } else {
        _errors[key] = null;
      }
    }

    setState(() {
      checkBool('followsInstructions', _followsInstructions);
      checkBool('completesAssignedTasks', _completesAssignedTasks);
      checkStr('understandsInstructions', _understandsInstructions);
      checkBool('hasMemoryDifficulty', _hasMemoryDifficulty);
      checkBool('hasNamingDifficulty', _hasNamingDifficulty);
      checkBool('isImpulsive', _isImpulsive);
      checkStr('concentrationLevel', _concentrationLevel);
    });

    return allValid;
  }

  void _submit(BuildContext context) {
    if (!_validate(context)) return;
    widget.onNext(
      Section10Data(
        followsInstructions: _followsInstructions,
        completesAssignedTasks: _completesAssignedTasks,
        understandsInstructions: _understandsInstructions ?? '',
        hasMemoryDifficulty: _hasMemoryDifficulty,
        hasNamingDifficulty: _hasNamingDifficulty,
        isImpulsive: _isImpulsive,
        concentrationLevel: _concentrationLevel ?? '',
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
        Text(
          l10n.csSection10Title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          '(${l10n.csSection10Subtitle})',
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── Q1: Follows instructions ──────────────────────────────────
        FormYesNoQuestion(
          label: l10n.csS10FollowsInstructions,
          value: _followsInstructions,
          errorText: _errors['followsInstructions'],
          onChanged: (v) => setState(() {
            _followsInstructions = v;
            _errors['followsInstructions'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p16),

        // ── Q2: Completes assigned tasks ──────────────────────────────
        FormYesNoQuestion(
          label: l10n.csS10CompletesAssignedTasks,
          value: _completesAssignedTasks,
          errorText: _errors['completesAssignedTasks'],
          onChanged: (v) => setState(() {
            _completesAssignedTasks = v;
            _errors['completesAssignedTasks'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p16),

        // ── Q3: Understands instructions (3-way radio) ────────────────
        FormRadioGroup<String>(
          label: l10n.csS10UnderstandsInstructions,
          options: [
            RadioOption(label: l10n.csS10UnderstandsAlways, value: 'always'),
            RadioOption(label: l10n.csS10UnderstandsSometimes, value: 'sometimes'),
            RadioOption(label: l10n.csS10UnderstandsRarely, value: 'rarely'),
          ],
          groupValue: _understandsInstructions,
          onChanged: (v) => setState(() {
            _understandsInstructions = v;
            _errors['understandsInstructions'] = null;
          }),
          errorText: _errors['understandsInstructions'],
        ),
        const SizedBox(height: AppSpacing.p16),

        // ── Q4: Memory difficulty ─────────────────────────────────────
        FormYesNoQuestion(
          label: l10n.csS10HasMemoryDifficulty,
          value: _hasMemoryDifficulty,
          errorText: _errors['hasMemoryDifficulty'],
          onChanged: (v) => setState(() {
            _hasMemoryDifficulty = v;
            _errors['hasMemoryDifficulty'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p16),

        // ── Q5: Naming difficulty ─────────────────────────────────────
        FormYesNoQuestion(
          label: l10n.csS10HasNamingDifficulty,
          value: _hasNamingDifficulty,
          errorText: _errors['hasNamingDifficulty'],
          onChanged: (v) => setState(() {
            _hasNamingDifficulty = v;
            _errors['hasNamingDifficulty'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p16),

        // ── Q6: Impulsive ─────────────────────────────────────────────
        FormYesNoQuestion(
          label: l10n.csS10IsImpulsive,
          value: _isImpulsive,
          errorText: _errors['isImpulsive'],
          onChanged: (v) => setState(() {
            _isImpulsive = v;
            _errors['isImpulsive'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p16),

        // ── Q7: Concentration level (3-way radio) ─────────────────────
        FormRadioGroup<String>(
          label: l10n.csS10ConcentrationLevel,
          options: [
            RadioOption(label: l10n.csS10ConcentrationGood, value: 'good'),
            RadioOption(label: l10n.csS10ConcentrationAverage, value: 'average'),
            RadioOption(label: l10n.csS10ConcentrationWeak, value: 'weak'),
          ],
          groupValue: _concentrationLevel,
          onChanged: (v) => setState(() {
            _concentrationLevel = v;
            _errors['concentrationLevel'] = null;
          }),
          errorText: _errors['concentrationLevel'],
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
