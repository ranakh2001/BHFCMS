import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_labeled_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_yes_no_question.dart';

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
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _behaviorDuringVisitsCtrl;

  bool? _isQuickToAnger;
  bool? _destroysPlaythings;
  bool? _isStubborn;
  bool? _isAggressive;
  bool? _canPlayCalmly;
  bool? _attacksSiblings;
  bool? _isPopularWithPeers;
  bool? _socialMaturityLikeAgePeers;

  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _behaviorDuringVisitsCtrl =
        TextEditingController(text: d?.behaviorDuringVisits ?? '');

    _isQuickToAnger = d?.isQuickToAnger;
    _destroysPlaythings = d?.destroysPlaythings;
    _isStubborn = d?.isStubborn;
    _isAggressive = d?.isAggressive;
    _canPlayCalmly = d?.canPlayCalmly;
    _attacksSiblings = d?.attacksSiblings;
    _isPopularWithPeers = d?.isPopularWithPeers;
    _socialMaturityLikeAgePeers = d?.socialMaturityLikeAgePeers;
  }

  @override
  void dispose() {
    _behaviorDuringVisitsCtrl.dispose();
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
      checkBool('isQuickToAnger', _isQuickToAnger);
      checkBool('destroysPlaythings', _destroysPlaythings);
      checkBool('isStubborn', _isStubborn);
      checkBool('isAggressive', _isAggressive);
      checkBool('canPlayCalmly', _canPlayCalmly);
      checkBool('attacksSiblings', _attacksSiblings);
      checkBool('isPopularWithPeers', _isPopularWithPeers);
      checkBool('socialMaturityLikeAgePeers', _socialMaturityLikeAgePeers);
    });

    return formValid && allValid;
  }

  void _submit(BuildContext context) {
    if (!_validate(context)) return;
    widget.onNext(
      Section11Data(
        isQuickToAnger: _isQuickToAnger,
        destroysPlaythings: _destroysPlaythings,
        isStubborn: _isStubborn,
        isAggressive: _isAggressive,
        canPlayCalmly: _canPlayCalmly,
        attacksSiblings: _attacksSiblings,
        isPopularWithPeers: _isPopularWithPeers,
        behaviorDuringVisits: _behaviorDuringVisitsCtrl.text.trim(),
        socialMaturityLikeAgePeers: _socialMaturityLikeAgePeers,
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
            l10n.csSection11Title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            '(${l10n.csSection11Subtitle})',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.p24),

          // ── Q1: Quick to anger ────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS11IsQuickToAnger,
            value: _isQuickToAnger,
            errorText: _errors['isQuickToAnger'],
            onChanged: (v) => setState(() {
              _isQuickToAnger = v;
              _errors['isQuickToAnger'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q2: Destroys playthings ───────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS11DestroysPlaythings,
            value: _destroysPlaythings,
            errorText: _errors['destroysPlaythings'],
            onChanged: (v) => setState(() {
              _destroysPlaythings = v;
              _errors['destroysPlaythings'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q3: Stubborn ──────────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS11IsStubborn,
            value: _isStubborn,
            errorText: _errors['isStubborn'],
            onChanged: (v) => setState(() {
              _isStubborn = v;
              _errors['isStubborn'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q4: Aggressive ────────────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS11IsAggressive,
            value: _isAggressive,
            errorText: _errors['isAggressive'],
            onChanged: (v) => setState(() {
              _isAggressive = v;
              _errors['isAggressive'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q5: Can play calmly ───────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS11CanPlayCalmly,
            value: _canPlayCalmly,
            errorText: _errors['canPlayCalmly'],
            onChanged: (v) => setState(() {
              _canPlayCalmly = v;
              _errors['canPlayCalmly'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q6: Attacks siblings ──────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS11AttacksSiblings,
            value: _attacksSiblings,
            errorText: _errors['attacksSiblings'],
            onChanged: (v) => setState(() {
              _attacksSiblings = v;
              _errors['attacksSiblings'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q7: Popular with peers ────────────────────────────────────
          FormYesNoQuestion(
            label: l10n.csS11IsPopularWithPeers,
            value: _isPopularWithPeers,
            errorText: _errors['isPopularWithPeers'],
            onChanged: (v) => setState(() {
              _isPopularWithPeers = v;
              _errors['isPopularWithPeers'] = null;
            }),
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q8: Behavior during visits (text field) ───────────────────
          FormLabeledField(
            label: l10n.csS11BehaviorDuringVisits,
            hint: l10n.csS11BehaviorDuringVisitsHint,
            controller: _behaviorDuringVisitsCtrl,
            maxLines: 3,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? _req(context) : null,
          ),
          const SizedBox(height: AppSpacing.p16),

          // ── Q9: Social maturity like age peers ────────────────────────
          FormYesNoQuestion(
            label: l10n.csS11SocialMaturityLikeAgePeers,
            value: _socialMaturityLikeAgePeers,
            errorText: _errors['socialMaturityLikeAgePeers'],
            onChanged: (v) => setState(() {
              _socialMaturityLikeAgePeers = v;
              _errors['socialMaturityLikeAgePeers'] = null;
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
