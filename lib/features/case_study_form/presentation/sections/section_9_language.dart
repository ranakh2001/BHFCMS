import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_checkbox_grid.dart';
import '../widgets/form_checkbox_item.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_notes_field.dart';
import '../widgets/form_section_header.dart';
import '../widgets/form_subsection_title.dart';

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
  late final TextEditingController _observedStrengthsCtrl;
  late bool _activitySensoryGames;
  late bool _activityElectronics;
  late bool _activityMotor;
  late bool _activityFoods;
  late bool _activityCharacters;
  late bool _activityMusic;
  late bool _activityOther;
  late final TextEditingController _otherActivitiesCtrl;

  late final TextEditingController _foodExampleCtrl;
  late String _foodRating;
  late final TextEditingController _sensoryExampleCtrl;
  late String _sensoryRating;
  late final TextEditingController _socialExampleCtrl;
  late String _socialRating;
  late final TextEditingController _materialExampleCtrl;
  late String _materialRating;

  late final TextEditingController _positiveDistinctionCtrl;

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _observedStrengthsCtrl =
        TextEditingController(text: d?.observedStrengths ?? '');
    _activitySensoryGames = d?.activitySensoryGames ?? false;
    _activityElectronics = d?.activityElectronics ?? false;
    _activityMotor = d?.activityMotor ?? false;
    _activityFoods = d?.activityFoods ?? false;
    _activityCharacters = d?.activityCharacters ?? false;
    _activityMusic = d?.activityMusic ?? false;
    _activityOther = d?.activityOther ?? false;
    _otherActivitiesCtrl =
        TextEditingController(text: d?.otherActivitiesDescription ?? '');
    _foodExampleCtrl = TextEditingController(text: d?.foodExample ?? '');
    _foodRating = d?.foodRating ?? '';
    _sensoryExampleCtrl =
        TextEditingController(text: d?.sensoryExample ?? '');
    _sensoryRating = d?.sensoryRating ?? '';
    _socialExampleCtrl =
        TextEditingController(text: d?.socialExample ?? '');
    _socialRating = d?.socialRating ?? '';
    _materialExampleCtrl =
        TextEditingController(text: d?.materialExample ?? '');
    _materialRating = d?.materialRating ?? '';
    _positiveDistinctionCtrl =
        TextEditingController(text: d?.positiveDistinction ?? '');
  }

  @override
  void dispose() {
    _observedStrengthsCtrl.dispose();
    _otherActivitiesCtrl.dispose();
    _foodExampleCtrl.dispose();
    _sensoryExampleCtrl.dispose();
    _socialExampleCtrl.dispose();
    _materialExampleCtrl.dispose();
    _positiveDistinctionCtrl.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    widget.onNext(Section9Data(
      observedStrengths: _observedStrengthsCtrl.text.trim(),
      activitySensoryGames: _activitySensoryGames,
      activityElectronics: _activityElectronics,
      activityMotor: _activityMotor,
      activityFoods: _activityFoods,
      activityCharacters: _activityCharacters,
      activityMusic: _activityMusic,
      activityOther: _activityOther,
      otherActivitiesDescription: _otherActivitiesCtrl.text.trim(),
      foodExample: _foodExampleCtrl.text.trim(),
      foodRating: _foodRating,
      sensoryExample: _sensoryExampleCtrl.text.trim(),
      sensoryRating: _sensoryRating,
      socialExample: _socialExampleCtrl.text.trim(),
      socialRating: _socialRating,
      materialExample: _materialExampleCtrl.text.trim(),
      materialRating: _materialRating,
      positiveDistinction: _positiveDistinctionCtrl.text.trim(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Header ────────────────────────────────────────────────────────────
        FormSectionHeader(title: l10n.csSection9Title),
        const SizedBox(height: AppSpacing.p24),

        // ── 1. Observed Strengths ─────────────────────────────────────────────
        Text(
          l10n.csS9ObservedStrengthsLabel,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: AppSpacing.p8),
        FormNotesField(
          controller: _observedStrengthsCtrl,
          hint: l10n.csS9ObservedStrengthsHint,
          maxLines: 4,
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── 2. Preferred Activities ───────────────────────────────────────────
        FormSubsectionTitle(l10n.csS9PreferredActivitiesTitle),
        const SizedBox(height: AppSpacing.p12),
        FormCheckboxGrid(items: [
          FormCheckboxItem(
            label: l10n.csS9ActivitySensoryGames,
            value: _activitySensoryGames,
            onChanged: (v) => setState(() => _activitySensoryGames = v),
          ),
          FormCheckboxItem(
            label: l10n.csS9ActivityElectronics,
            value: _activityElectronics,
            onChanged: (v) => setState(() => _activityElectronics = v),
          ),
          FormCheckboxItem(
            label: l10n.csS9ActivityMotor,
            value: _activityMotor,
            onChanged: (v) => setState(() => _activityMotor = v),
          ),
          FormCheckboxItem(
            label: l10n.csS9ActivityFoods,
            value: _activityFoods,
            onChanged: (v) => setState(() => _activityFoods = v),
          ),
          FormCheckboxItem(
            label: l10n.csS9ActivityCharacters,
            value: _activityCharacters,
            onChanged: (v) => setState(() => _activityCharacters = v),
          ),
          FormCheckboxItem(
            label: l10n.csS9ActivityMusic,
            value: _activityMusic,
            onChanged: (v) => setState(() => _activityMusic = v),
          ),
          FormCheckboxItem(
            label: l10n.csS9ActivityOther,
            value: _activityOther,
            onChanged: (v) => setState(() => _activityOther = v),
          ),
        ]),
        if (_activityOther) ...[
          const SizedBox(height: AppSpacing.p12),
          FormNotesField(
            controller: _otherActivitiesCtrl,
            hint: l10n.csS9OtherActivitiesHint,
            maxLines: 2,
          ),
          const SizedBox(height: 4),
          Text(
            l10n.csS9OtherActivitiesLabel,
            style: const TextStyle(
              fontSize: 11.5,
              color: AppColors.textSecondary,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.start,
          ),
        ],
        const SizedBox(height: AppSpacing.p24),

        // ── 3. Preference Scan ────────────────────────────────────────────────
        FormSubsectionTitle(l10n.csS9PreferenceScanTitle),
        const SizedBox(height: AppSpacing.p12),
        _PreferenceScanRow(
          label: l10n.csS9PrefFoodLabel,
          exampleHint: l10n.csS9PrefExampleHint,
          controller: _foodExampleCtrl,
          rating: _foodRating,
          highlyLabel: l10n.csS9PrefHighlyPreferred,
          acceptableLabel: l10n.csS9PrefAcceptable,
          notPreferredLabel: l10n.csS9PrefNotPreferred,
          onRatingChanged: (v) => setState(() => _foodRating = v),
        ),
        const SizedBox(height: AppSpacing.p16),
        _PreferenceScanRow(
          label: l10n.csS9PrefSensoryLabel,
          exampleHint: l10n.csS9PrefExampleHint,
          controller: _sensoryExampleCtrl,
          rating: _sensoryRating,
          highlyLabel: l10n.csS9PrefHighlyPreferred,
          acceptableLabel: l10n.csS9PrefAcceptable,
          notPreferredLabel: l10n.csS9PrefNotPreferred,
          onRatingChanged: (v) => setState(() => _sensoryRating = v),
        ),
        const SizedBox(height: AppSpacing.p16),
        _PreferenceScanRow(
          label: l10n.csS9PrefSocialLabel,
          exampleHint: l10n.csS9PrefExampleHint,
          controller: _socialExampleCtrl,
          rating: _socialRating,
          highlyLabel: l10n.csS9PrefHighlyPreferred,
          acceptableLabel: l10n.csS9PrefAcceptable,
          notPreferredLabel: l10n.csS9PrefNotPreferred,
          onRatingChanged: (v) => setState(() => _socialRating = v),
        ),
        const SizedBox(height: AppSpacing.p16),
        _PreferenceScanRow(
          label: l10n.csS9PrefMaterialLabel,
          exampleHint: l10n.csS9PrefExampleHint,
          controller: _materialExampleCtrl,
          rating: _materialRating,
          highlyLabel: l10n.csS9PrefHighlyPreferred,
          acceptableLabel: l10n.csS9PrefAcceptable,
          notPreferredLabel: l10n.csS9PrefNotPreferred,
          onRatingChanged: (v) => setState(() => _materialRating = v),
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── 4. Positive Distinction ───────────────────────────────────────────
        Text(
          l10n.csS9PositiveDistinctionLabel,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: AppSpacing.p8),
        FormNotesField(
          controller: _positiveDistinctionCtrl,
          hint: l10n.csS9PositiveDistinctionHint,
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

// ═══════════════════════════════════════════════════════════════════════════════
// Private helpers
// ═══════════════════════════════════════════════════════════════════════════════

class _PreferenceScanRow extends StatelessWidget {
  final String label;
  final String exampleHint;
  final TextEditingController controller;
  final String rating;
  final String highlyLabel;
  final String acceptableLabel;
  final String notPreferredLabel;
  final void Function(String) onRatingChanged;

  const _PreferenceScanRow({
    required this.label,
    required this.exampleHint,
    required this.controller,
    required this.rating,
    required this.highlyLabel,
    required this.acceptableLabel,
    required this.notPreferredLabel,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: AppSpacing.p8),
        FormNotesField(controller: controller, hint: exampleHint, maxLines: 1),
        const SizedBox(height: AppSpacing.p8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _RatingChip(
              label: notPreferredLabel,
              selected: rating == 'not_preferred',
              onTap: () => onRatingChanged('not_preferred'),
            ),
            const SizedBox(width: AppSpacing.p16),
            _RatingChip(
              label: acceptableLabel,
              selected: rating == 'acceptable',
              onTap: () => onRatingChanged('acceptable'),
            ),
            const SizedBox(width: AppSpacing.p16),
            _RatingChip(
              label: highlyLabel,
              selected: rating == 'highly_preferred',
              onTap: () => onRatingChanged('highly_preferred'),
            ),
          ],
        ),
      ],
    );
  }
}

class _RatingChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _RatingChip({
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
          AnimatedContainer(
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
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: selected ? AppColors.primary : AppColors.textPrimary,
              fontWeight:
                  selected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
