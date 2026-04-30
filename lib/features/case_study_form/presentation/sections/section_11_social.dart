import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_labeled_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_notes_field.dart';
import '../widgets/form_radio_group.dart';
import '../widgets/form_section_header.dart';

class Section11Social extends StatefulWidget {
  final Section11Data? initialData;
  final void Function(Section11Data data) onNext;
  final bool isSaving;

  const Section11Social({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section11Social> createState() => _Section11SocialState();
}

class _Section11SocialState extends State<Section11Social> {
  late final TextEditingController _topConcernsCtrl;
  late final TextEditingController _topGoalsCtrl;
  late final TextEditingController _sessionTimePrefsCtrl;
  late String _parentTrainingReadiness;

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _topConcernsCtrl = TextEditingController(text: d?.topConcerns ?? '');
    _topGoalsCtrl = TextEditingController(text: d?.topGoals ?? '');
    _sessionTimePrefsCtrl =
        TextEditingController(text: d?.sessionTimePreferences ?? '');
    _parentTrainingReadiness = d?.parentTrainingReadiness ?? '';
  }

  @override
  void dispose() {
    _topConcernsCtrl.dispose();
    _topGoalsCtrl.dispose();
    _sessionTimePrefsCtrl.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    widget.onNext(Section11Data(
      topConcerns: _topConcernsCtrl.text.trim(),
      topGoals: _topGoalsCtrl.text.trim(),
      sessionTimePreferences: _sessionTimePrefsCtrl.text.trim(),
      parentTrainingReadiness: _parentTrainingReadiness,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Header ────────────────────────────────────────────────────────────
        FormSectionHeader(title: l10n.csSection11Title),
        const SizedBox(height: AppSpacing.p24),

        // ── Top 3 Concerns ────────────────────────────────────────────────────
        Text(
          l10n.csS11TopConcernsLabel,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: AppSpacing.p8),
        FormNotesField(
          controller: _topConcernsCtrl,
          hint: l10n.csS11TopConcernsHint,
          maxLines: 4,
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── Top 3 Goals ───────────────────────────────────────────────────────
        Text(
          l10n.csS11TopGoalsLabel,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: AppSpacing.p8),
        FormNotesField(
          controller: _topGoalsCtrl,
          hint: l10n.csS11TopGoalsHint,
          maxLines: 4,
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── Session Time Preferences ──────────────────────────────────────────
        FormLabeledField(
          label: l10n.csS11SessionTimePrefsLabel,
          hint: l10n.csS11SessionTimePrefsHint,
          controller: _sessionTimePrefsCtrl,
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── Parent Training Readiness ─────────────────────────────────────────
        FormRadioGroup<String>(
          label: l10n.csS11ParentTrainingReadinessLabel,
          options: [
            RadioOption(label: l10n.csYes, value: 'yes'),
            RadioOption(label: l10n.csNo, value: 'no'),
            RadioOption(label: l10n.csS11OptionMaybe, value: 'maybe'),
          ],
          groupValue: _parentTrainingReadiness.isEmpty
              ? null
              : _parentTrainingReadiness,
          onChanged: (v) =>
              setState(() => _parentTrainingReadiness = v ?? ''),
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
