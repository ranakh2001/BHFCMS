import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_checkbox_item.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_notes_field.dart';
import '../widgets/form_section_header.dart';
import '../widgets/form_subsection_title.dart';

class Section7Behavioral extends StatefulWidget {
  final Section7Data? initialData;
  final void Function(Section7Data data) onNext;
  final bool isSaving;

  const Section7Behavioral({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section7Behavioral> createState() => _Section7BehavioralState();
}

class _Section7BehavioralState extends State<Section7Behavioral> {
  // ── Eating & Drinking ──────────────────────────────────────────────────────
  late bool _usesSpoonFork;
  late bool _selectiveEater;
  late bool _usesHandsForEating;
  late bool _refusesTextures;
  late bool _drinksFromCup;
  late bool _needsFullAssistanceEating;
  late final TextEditingController _howRequestsFoodCtrl;

  // ── Dressing ───────────────────────────────────────────────────────────────
  late bool _removesShoesSocks;
  late bool _closesZipperButtons;
  late bool _dressesWithAssistance;

  // ── Personal Hygiene ───────────────────────────────────────────────────────
  late bool _washesHandsFace;
  late bool _bathesAlone;
  late bool _cleansTeetHair;
  late bool _nailCuttingDifficulty;

  // ── Bathroom & Sleep ───────────────────────────────────────────────────────
  late String _bathroomIndependence;
  late final TextEditingController _howRequestsSleepCtrl;

  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _usesSpoonFork = d?.usesSpoonFork ?? false;
    _selectiveEater = d?.selectiveEater ?? false;
    _usesHandsForEating = d?.usesHandsForEating ?? false;
    _refusesTextures = d?.refusesTextures ?? false;
    _drinksFromCup = d?.drinksFromCup ?? false;
    _needsFullAssistanceEating = d?.needsFullAssistanceEating ?? false;
    _howRequestsFoodCtrl =
        TextEditingController(text: d?.howRequestsFood ?? '');
    _removesShoesSocks = d?.removesShoesSocks ?? false;
    _closesZipperButtons = d?.closesZipperButtons ?? false;
    _dressesWithAssistance = d?.dressesWithAssistance ?? false;
    _washesHandsFace = d?.washesHandsFace ?? false;
    _bathesAlone = d?.bathesAlone ?? false;
    _cleansTeetHair = d?.cleansTeetHair ?? false;
    _nailCuttingDifficulty = d?.nailCuttingDifficulty ?? false;
    _bathroomIndependence = d?.bathroomIndependence ?? '';
    _howRequestsSleepCtrl =
        TextEditingController(text: d?.howRequestsSleep ?? '');
  }

  @override
  void dispose() {
    _howRequestsFoodCtrl.dispose();
    _howRequestsSleepCtrl.dispose();
    super.dispose();
  }

  String _req(BuildContext context) =>
      AppLocalizations.of(context)!.validationRequired;

  bool _validate(BuildContext context) {
    setState(() {
      _errors['bathroomIndependence'] =
          _bathroomIndependence.isEmpty ? _req(context) : null;
    });
    return _bathroomIndependence.isNotEmpty;
  }

  void _submit(BuildContext context) {
    if (!_validate(context)) return;
    widget.onNext(Section7Data(
      usesSpoonFork: _usesSpoonFork,
      selectiveEater: _selectiveEater,
      usesHandsForEating: _usesHandsForEating,
      refusesTextures: _refusesTextures,
      drinksFromCup: _drinksFromCup,
      needsFullAssistanceEating: _needsFullAssistanceEating,
      howRequestsFood: _howRequestsFoodCtrl.text.trim(),
      removesShoesSocks: _removesShoesSocks,
      closesZipperButtons: _closesZipperButtons,
      dressesWithAssistance: _dressesWithAssistance,
      washesHandsFace: _washesHandsFace,
      bathesAlone: _bathesAlone,
      cleansTeetHair: _cleansTeetHair,
      nailCuttingDifficulty: _nailCuttingDifficulty,
      bathroomIndependence: _bathroomIndependence,
      howRequestsSleep: _howRequestsSleepCtrl.text.trim(),
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
        // ── Header ────────────────────────────────────────────────────────────
        FormSectionHeader(title: l10n.csSection7Title),
        const SizedBox(height: AppSpacing.p24),

        // ── 1. Eating & Drinking ──────────────────────────────────────────────
        FormSubsectionTitle(l10n.csS7EatingTitle),
        const SizedBox(height: AppSpacing.p12),
        _grid(res, [
          FormCheckboxItem(
            label: l10n.csS7UsesSpoonFork,
            value: _usesSpoonFork,
            onChanged: (v) => setState(() => _usesSpoonFork = v),
          ),
          FormCheckboxItem(
            label: l10n.csS7SelectiveEater,
            value: _selectiveEater,
            onChanged: (v) => setState(() => _selectiveEater = v),
          ),
          FormCheckboxItem(
            label: l10n.csS7UsesHandsForEating,
            value: _usesHandsForEating,
            onChanged: (v) => setState(() => _usesHandsForEating = v),
          ),
          FormCheckboxItem(
            label: l10n.csS7RefusesTextures,
            value: _refusesTextures,
            onChanged: (v) => setState(() => _refusesTextures = v),
          ),
          FormCheckboxItem(
            label: l10n.csS7DrinksFromCup,
            value: _drinksFromCup,
            onChanged: (v) => setState(() => _drinksFromCup = v),
          ),
          FormCheckboxItem(
            label: l10n.csS7NeedsFullAssistance,
            value: _needsFullAssistanceEating,
            onChanged: (v) => setState(() => _needsFullAssistanceEating = v),
          ),
        ]),
        const SizedBox(height: AppSpacing.p12),
        FormNotesField(
          controller: _howRequestsFoodCtrl,
          hint: l10n.csS7HowRequestsFoodHint,
          maxLines: 2,
        ),
        const SizedBox(height: AppSpacing.p8),
        Text(
          l10n.csS7HowRequestsFoodLabel,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── 2. Dressing ───────────────────────────────────────────────────────
        FormSubsectionTitle(l10n.csS7DressingTitle),
        const SizedBox(height: AppSpacing.p12),
        _grid(res, [
          FormCheckboxItem(
            label: l10n.csS7RemovesShoesSocks,
            value: _removesShoesSocks,
            onChanged: (v) => setState(() => _removesShoesSocks = v),
          ),
          FormCheckboxItem(
            label: l10n.csS7ClosesZipperButtons,
            value: _closesZipperButtons,
            onChanged: (v) => setState(() => _closesZipperButtons = v),
          ),
          FormCheckboxItem(
            label: l10n.csS7DressesWithAssistance,
            value: _dressesWithAssistance,
            onChanged: (v) => setState(() => _dressesWithAssistance = v),
          ),
        ]),
        const SizedBox(height: AppSpacing.p24),

        // ── 3. Personal Hygiene ───────────────────────────────────────────────
        FormSubsectionTitle(l10n.csS7HygieneTitle),
        const SizedBox(height: AppSpacing.p12),
        _grid(res, [
          FormCheckboxItem(
            label: l10n.csS7WashesHandsFace,
            value: _washesHandsFace,
            onChanged: (v) => setState(() => _washesHandsFace = v),
          ),
          FormCheckboxItem(
            label: l10n.csS7BathesAlone,
            value: _bathesAlone,
            onChanged: (v) => setState(() => _bathesAlone = v),
          ),
          FormCheckboxItem(
            label: l10n.csS7CleansTeetHair,
            value: _cleansTeetHair,
            onChanged: (v) => setState(() => _cleansTeetHair = v),
          ),
          FormCheckboxItem(
            label: l10n.csS7NailCuttingDifficulty,
            value: _nailCuttingDifficulty,
            onChanged: (v) => setState(() => _nailCuttingDifficulty = v),
          ),
        ]),
        const SizedBox(height: AppSpacing.p24),

        // ── 4. Bathroom & Sleep ───────────────────────────────────────────────
        FormSubsectionTitle(l10n.csS7BathroomSleepTitle),
        const SizedBox(height: AppSpacing.p12),
        _BathroomRadioGroup(
          label: l10n.csS7BathroomIndependenceLabel,
          value: _bathroomIndependence,
          errorText: _errors['bathroomIndependence'],
          options: [
            _RadioOpt(l10n.csS7OptionFullyIndependent, 'independent'),
            _RadioOpt(l10n.csS7OptionCurrentlyTraining, 'training'),
            _RadioOpt(l10n.csS7OptionUsesDiapers, 'diapers'),
          ],
          onChanged: (v) => setState(() {
            _bathroomIndependence = v;
            _errors['bathroomIndependence'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p16),
        FormNotesField(
          controller: _howRequestsSleepCtrl,
          hint: l10n.csS7HowRequestsSleepHint,
          maxLines: 2,
        ),
        const SizedBox(height: AppSpacing.p8),
        Text(
          l10n.csS7HowRequestsSleepLabel,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.start,
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

class _RadioOpt {
  final String label;
  final String value;
  const _RadioOpt(this.label, this.value);
}

class _BathroomRadioGroup extends StatelessWidget {
  final String label;
  final String value;
  final String? errorText;
  final List<_RadioOpt> options;
  final void Function(String) onChanged;

  const _BathroomRadioGroup({
    required this.label,
    required this.value,
    required this.errorText,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13.5),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: AppSpacing.p8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: options.map((opt) {
            final selected = value == opt.value;
            return GestureDetector(
              onTap: () => onChanged(opt.value),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            selected ? AppColors.primary : Colors.transparent,
                        border: Border.all(
                          color: selected
                              ? AppColors.primary
                              : Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                      child: selected
                          ? Center(
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      opt.label,
                      style: TextStyle(
                        fontSize: 13,
                        color: selected
                            ? AppColors.primary
                            : AppColors.textPrimary,
                        fontWeight: selected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              errorText!,
              style: const TextStyle(color: AppColors.error, fontSize: 12),
              textAlign: TextAlign.start,
            ),
          ),
      ],
    );
  }
}
