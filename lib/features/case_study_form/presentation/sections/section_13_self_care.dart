import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_yes_no_question.dart';

class Section13SelfCare extends StatefulWidget {
  final Section13Data? initialData;
  final void Function(Section13Data data) onNext;
  final bool isSaving;

  const Section13SelfCare({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section13SelfCare> createState() => _Section13SelfCareState();
}

class _Section13SelfCareState extends State<Section13SelfCare> {
  bool? _usesToiletProperly;
  bool? _bathesAlone;
  bool? _dressesAlone;
  bool? _usesToothbrush;
  bool? _wearsShoesAlone;
  bool? _washesFaceOnWaking;
  bool? _washesHandsBeforeAfterEating;
  bool? _washesFeetAfterPlay;

  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _usesToiletProperly = d?.usesToiletProperly;
    _bathesAlone = d?.bathesAlone;
    _dressesAlone = d?.dressesAlone;
    _usesToothbrush = d?.usesToothbrush;
    _wearsShoesAlone = d?.wearsShoesAlone;
    _washesFaceOnWaking = d?.washesFaceOnWaking;
    _washesHandsBeforeAfterEating = d?.washesHandsBeforeAfterEating;
    _washesFeetAfterPlay = d?.washesFeetAfterPlay;
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

    setState(() {
      checkBool('usesToiletProperly', _usesToiletProperly);
      checkBool('bathesAlone', _bathesAlone);
      checkBool('dressesAlone', _dressesAlone);
      checkBool('usesToothbrush', _usesToothbrush);
      checkBool('wearsShoesAlone', _wearsShoesAlone);
      checkBool('washesFaceOnWaking', _washesFaceOnWaking);
      checkBool('washesHandsBeforeAfterEating', _washesHandsBeforeAfterEating);
      checkBool('washesFeetAfterPlay', _washesFeetAfterPlay);
    });

    return allValid;
  }

  void _submit(BuildContext context) {
    if (!_validate(context)) return;
    widget.onNext(
      Section13Data(
        usesToiletProperly: _usesToiletProperly,
        bathesAlone: _bathesAlone,
        dressesAlone: _dressesAlone,
        usesToothbrush: _usesToothbrush,
        wearsShoesAlone: _wearsShoesAlone,
        washesFaceOnWaking: _washesFaceOnWaking,
        washesHandsBeforeAfterEating: _washesHandsBeforeAfterEating,
        washesFeetAfterPlay: _washesFeetAfterPlay,
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
          l10n.csSection13Title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          '(${l10n.csSection13Subtitle})',
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── Q1: Uses toilet properly ──────────────────────────────────
        FormYesNoQuestion(
          label: l10n.csS13UsesToiletProperly,
          value: _usesToiletProperly,
          errorText: _errors['usesToiletProperly'],
          onChanged: (v) => setState(() {
            _usesToiletProperly = v;
            _errors['usesToiletProperly'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p16),

        // ── Q2: Bathes alone ──────────────────────────────────────────
        FormYesNoQuestion(
          label: l10n.csS13BathesAlone,
          value: _bathesAlone,
          errorText: _errors['bathesAlone'],
          onChanged: (v) => setState(() {
            _bathesAlone = v;
            _errors['bathesAlone'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p16),

        // ── Q3: Dresses alone ─────────────────────────────────────────
        FormYesNoQuestion(
          label: l10n.csS13DressesAlone,
          value: _dressesAlone,
          errorText: _errors['dressesAlone'],
          onChanged: (v) => setState(() {
            _dressesAlone = v;
            _errors['dressesAlone'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p16),

        // ── Q4: Uses toothbrush ───────────────────────────────────────
        FormYesNoQuestion(
          label: l10n.csS13UsesToothbrush,
          value: _usesToothbrush,
          errorText: _errors['usesToothbrush'],
          onChanged: (v) => setState(() {
            _usesToothbrush = v;
            _errors['usesToothbrush'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p16),

        // ── Q5: Wears shoes alone ─────────────────────────────────────
        FormYesNoQuestion(
          label: l10n.csS13WearsShoesAlone,
          value: _wearsShoesAlone,
          errorText: _errors['wearsShoesAlone'],
          onChanged: (v) => setState(() {
            _wearsShoesAlone = v;
            _errors['wearsShoesAlone'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p16),

        // ── Q6: Washes face on waking ─────────────────────────────────
        FormYesNoQuestion(
          label: l10n.csS13WashesFaceOnWaking,
          value: _washesFaceOnWaking,
          errorText: _errors['washesFaceOnWaking'],
          onChanged: (v) => setState(() {
            _washesFaceOnWaking = v;
            _errors['washesFaceOnWaking'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p16),

        // ── Q7: Washes hands before/after eating ─────────────────────
        FormYesNoQuestion(
          label: l10n.csS13WashesHandsBeforeAfterEating,
          value: _washesHandsBeforeAfterEating,
          errorText: _errors['washesHandsBeforeAfterEating'],
          onChanged: (v) => setState(() {
            _washesHandsBeforeAfterEating = v;
            _errors['washesHandsBeforeAfterEating'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p16),

        // ── Q8: Washes feet after play ────────────────────────────────
        FormYesNoQuestion(
          label: l10n.csS13WashesFeetAfterPlay,
          value: _washesFeetAfterPlay,
          errorText: _errors['washesFeetAfterPlay'],
          onChanged: (v) => setState(() {
            _washesFeetAfterPlay = v;
            _errors['washesFeetAfterPlay'] = null;
          }),
        ),
        const SizedBox(height: AppSpacing.p32),

        FormNextButton(
          label: l10n.csFormFinish,
          onPressed: () => _submit(context),
          isLoading: widget.isSaving,
        ),
      ],
    );
  }
}
