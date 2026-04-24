import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_next_button.dart';

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
  // ── Behavioral flags ───────────────────────────────────────────────────────
  bool? _thumbSucking;
  bool? _nailBiting;
  bool? _bedwetting;
  bool? _foodAversion;
  bool? _sleepDisorder;
  bool? _continuousCrying;
  bool? _daydreaming;
  bool? _angerAttacks;
  bool? _aggression;
  bool? _destroyingObjects;
  bool? _epilepticSeizures;
  bool? _speechDifficulties;

  // ── Vaccine flags ──────────────────────────────────────────────────────────
  bool? _vaccineTriple;
  bool? _vaccinePolio;
  bool? _vaccineTuberculosis;
  bool? _vaccineMeasles;
  bool? _vaccineGermanMeaslesMumps;
  bool? _vaccineHepatitisB;

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    final b = d?.behaviors ?? const BehavioralFlags();
    _thumbSucking = b.thumbSucking;
    _nailBiting = b.nailBiting;
    _bedwetting = b.bedwetting;
    _foodAversion = b.foodAversion;
    _sleepDisorder = b.sleepDisorder;
    _continuousCrying = b.continuousCrying;
    _daydreaming = b.daydreaming;
    _angerAttacks = b.angerAttacks;
    _aggression = b.aggression;
    _destroyingObjects = b.destroyingObjects;
    _epilepticSeizures = b.epilepticSeizures;
    _speechDifficulties = b.speechDifficulties;

    final v = d?.vaccines ?? const VaccineFlags();
    _vaccineTriple = v.tripleQuadrupleQuintuple;
    _vaccinePolio = v.polio;
    _vaccineTuberculosis = v.tuberculosis;
    _vaccineMeasles = v.measles;
    _vaccineGermanMeaslesMumps = v.germanMeaslesMumps;
    _vaccineHepatitisB = v.hepatitisB;
  }

  void _submit() {
    widget.onNext(
      Section7Data(
        behaviors: BehavioralFlags(
          thumbSucking: _thumbSucking,
          nailBiting: _nailBiting,
          bedwetting: _bedwetting,
          foodAversion: _foodAversion,
          sleepDisorder: _sleepDisorder,
          continuousCrying: _continuousCrying,
          daydreaming: _daydreaming,
          angerAttacks: _angerAttacks,
          aggression: _aggression,
          destroyingObjects: _destroyingObjects,
          epilepticSeizures: _epilepticSeizures,
          speechDifficulties: _speechDifficulties,
        ),
        vaccines: VaccineFlags(
          tripleQuadrupleQuintuple: _vaccineTriple,
          polio: _vaccinePolio,
          tuberculosis: _vaccineTuberculosis,
          measles: _vaccineMeasles,
          germanMeaslesMumps: _vaccineGermanMeaslesMumps,
          hepatitisB: _vaccineHepatitisB,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Header ──────────────────────────────────────────────────────
        Text(
          l10n.csSection7Title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── Behaviors checklist ──────────────────────────────────────────
        _ChecklistSection(
          label: l10n.csS7BehaviorsQuestion,
          items: [
            _ChecklistItem(
              label: l10n.csS7ThumbSucking,
              value: _thumbSucking,
              onChanged: (v) => setState(() => _thumbSucking = v),
            ),
            _ChecklistItem(
              label: l10n.csS7NailBiting,
              value: _nailBiting,
              onChanged: (v) => setState(() => _nailBiting = v),
            ),
            _ChecklistItem(
              label: l10n.csS7Bedwetting,
              value: _bedwetting,
              onChanged: (v) => setState(() => _bedwetting = v),
            ),
            _ChecklistItem(
              label: l10n.csS7FoodAversion,
              value: _foodAversion,
              onChanged: (v) => setState(() => _foodAversion = v),
            ),
            _ChecklistItem(
              label: l10n.csS7SleepDisorder,
              value: _sleepDisorder,
              onChanged: (v) => setState(() => _sleepDisorder = v),
            ),
            _ChecklistItem(
              label: l10n.csS7ContinuousCrying,
              value: _continuousCrying,
              onChanged: (v) => setState(() => _continuousCrying = v),
            ),
            _ChecklistItem(
              label: l10n.csS7Daydreaming,
              value: _daydreaming,
              onChanged: (v) => setState(() => _daydreaming = v),
            ),
            _ChecklistItem(
              label: l10n.csS7AngerAttacks,
              value: _angerAttacks,
              onChanged: (v) => setState(() => _angerAttacks = v),
            ),
            _ChecklistItem(
              label: l10n.csS7Aggression,
              value: _aggression,
              onChanged: (v) => setState(() => _aggression = v),
            ),
            _ChecklistItem(
              label: l10n.csS7DestroyingObjects,
              value: _destroyingObjects,
              onChanged: (v) => setState(() => _destroyingObjects = v),
            ),
            _ChecklistItem(
              label: l10n.csS7EpilepticSeizures,
              value: _epilepticSeizures,
              onChanged: (v) => setState(() => _epilepticSeizures = v),
            ),
            _ChecklistItem(
              label: l10n.csS7SpeechDifficulties,
              value: _speechDifficulties,
              onChanged: (v) => setState(() => _speechDifficulties = v),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── Vaccines checklist ───────────────────────────────────────────
        _ChecklistSection(
          label: l10n.csS7VaccinesQuestion,
          items: [
            _ChecklistItem(
              label: l10n.csS7VaccineTriple,
              value: _vaccineTriple,
              onChanged: (v) => setState(() => _vaccineTriple = v),
            ),
            _ChecklistItem(
              label: l10n.csS7VaccinePolio,
              value: _vaccinePolio,
              onChanged: (v) => setState(() => _vaccinePolio = v),
            ),
            _ChecklistItem(
              label: l10n.csS7VaccineTuberculosis,
              value: _vaccineTuberculosis,
              onChanged: (v) => setState(() => _vaccineTuberculosis = v),
            ),
            _ChecklistItem(
              label: l10n.csS7VaccineMeasles,
              value: _vaccineMeasles,
              onChanged: (v) => setState(() => _vaccineMeasles = v),
            ),
            _ChecklistItem(
              label: l10n.csS7VaccineGermanMeaslesMumps,
              value: _vaccineGermanMeaslesMumps,
              onChanged: (v) =>
                  setState(() => _vaccineGermanMeaslesMumps = v),
            ),
            _ChecklistItem(
              label: l10n.csS7VaccineHepatitisB,
              value: _vaccineHepatitisB,
              onChanged: (v) => setState(() => _vaccineHepatitisB = v),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.p32),

        FormNextButton(
          label: l10n.csFormNext,
          onPressed: _submit,
          isLoading: widget.isSaving,
        ),
      ],
    );
  }
}

// ── Private: section with a label and a list of full-width checklist rows ────

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

class _ChecklistSection extends StatelessWidget {
  final String label;
  final List<_ChecklistItem> items;

  const _ChecklistSection({required this.label, required this.items});

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
