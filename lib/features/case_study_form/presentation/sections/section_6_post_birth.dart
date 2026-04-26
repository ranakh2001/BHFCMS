import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_checkbox_item.dart';
import '../widgets/form_labeled_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_section_header.dart';
import '../widgets/form_subsection_title.dart';

class Section6PostBirth extends StatefulWidget {
  final Section6Data? initialData;
  final void Function(Section6Data data) onNext;
  final bool isSaving;

  const Section6PostBirth({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section6PostBirth> createState() => _Section6PostBirthState();
}

class _Section6PostBirthState extends State<Section6PostBirth> {
  // 1. Communication methods
  late Set<String> _commMethods;
  late final TextEditingController _commOtherCtrl;

  // 2. Expression & Understanding
  String _expressesNeeds = '';
  String _requestsPreferred = '';
  String _understandsSimple = '';
  String _understandsComplex = '';

  // 3. Social communication traits
  late Set<String> _socialTraits;

  // 4. Notes
  late final TextEditingController _notesCtrl;

  // 5. Pragmatic skills
  String _initiatesConversation = '';
  String _maintainsEyeContact = '';
  String _understandsBodyLanguage = '';
  String _understandsJokes = '';
  String _conversationTurnTaking = '';

  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _commMethods = Set<String>.from(d?.communicationMethods ?? []);
    _commOtherCtrl =
        TextEditingController(text: d?.communicationMethodOther ?? '');
    _expressesNeeds = d?.expressesNeeds ?? '';
    _requestsPreferred = d?.requestsPreferred ?? '';
    _understandsSimple = d?.understandsSimple ?? '';
    _understandsComplex = d?.understandsComplex ?? '';
    _socialTraits = Set<String>.from(d?.socialCommTraits ?? []);
    _notesCtrl = TextEditingController(text: d?.communicationNotes ?? '');
    _initiatesConversation = d?.initiatesConversation ?? '';
    _maintainsEyeContact = d?.maintainsEyeContact ?? '';
    _understandsBodyLanguage = d?.understandsBodyLanguage ?? '';
    _understandsJokes = d?.understandsJokes ?? '';
    _conversationTurnTaking = d?.conversationTurnTaking ?? '';
  }

  @override
  void dispose() {
    _commOtherCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  String _req(BuildContext context) =>
      AppLocalizations.of(context)!.validationRequired;

  bool _validate(BuildContext context) {
    bool ok = true;
    setState(() {
      if (_commMethods.isEmpty) {
        _errors['commMethods'] = _req(context);
        ok = false;
      } else {
        _errors['commMethods'] = null;
      }
      void checkStr(String key, String v) {
        if (v.isEmpty) {
          _errors[key] = _req(context);
          ok = false;
        } else {
          _errors[key] = null;
        }
      }

      checkStr('expressesNeeds', _expressesNeeds);
      checkStr('requestsPreferred', _requestsPreferred);
      checkStr('understandsSimple', _understandsSimple);
      checkStr('understandsComplex', _understandsComplex);
      checkStr('initiatesConversation', _initiatesConversation);
      checkStr('maintainsEyeContact', _maintainsEyeContact);
      checkStr('understandsBodyLanguage', _understandsBodyLanguage);
      checkStr('understandsJokes', _understandsJokes);
      checkStr('conversationTurnTaking', _conversationTurnTaking);
    });
    return ok;
  }

  void _submit(BuildContext context) {
    if (!_validate(context)) return;
    widget.onNext(
      Section6Data(
        communicationMethods: _commMethods.toList(),
        communicationMethodOther:
            _commMethods.contains('other') ? _commOtherCtrl.text.trim() : '',
        expressesNeeds: _expressesNeeds,
        requestsPreferred: _requestsPreferred,
        understandsSimple: _understandsSimple,
        understandsComplex: _understandsComplex,
        socialCommTraits: _socialTraits.toList(),
        communicationNotes: _notesCtrl.text.trim(),
        initiatesConversation: _initiatesConversation,
        maintainsEyeContact: _maintainsEyeContact,
        understandsBodyLanguage: _understandsBodyLanguage,
        understandsJokes: _understandsJokes,
        conversationTurnTaking: _conversationTurnTaking,
      ),
    );
  }

  void _toggleComm(String key) => setState(() {
        _commMethods.contains(key)
            ? _commMethods.remove(key)
            : _commMethods.add(key);
        _errors['commMethods'] = null;
      });

  void _toggleSocial(String key) => setState(() {
        _socialTraits.contains(key)
            ? _socialTraits.remove(key)
            : _socialTraits.add(key);
      });

  Widget _grid(List<Widget> items, {int cols = 2}) {
    final width = MediaQuery.of(context).size.width;
    const spacing = 8.0;
    final itemWidth = (width - 32 - spacing * (cols - 1)) / cols;
    return Wrap(
      spacing: spacing,
      runSpacing: 8,
      children:
          items.map((item) => SizedBox(width: itemWidth, child: item)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Header ────────────────────────────────────────────────────────────
        FormSectionHeader(title: l10n.csSection6Title),
        const SizedBox(height: AppSpacing.p24),

        // ── 1. Communication Methods ──────────────────────────────────────────
        FormSubsectionTitle(l10n.csS6CommMethodTitle),
        const SizedBox(height: AppSpacing.p12),
        _grid([
          FormCheckboxItem(label: l10n.csS6CommMethodSingleWords, value: _commMethods.contains('single_words'), onChanged: (_) => _toggleComm('single_words')),
          FormCheckboxItem(label: l10n.csS6CommMethodShortSentences, value: _commMethods.contains('short_sentences'), onChanged: (_) => _toggleComm('short_sentences')),
          FormCheckboxItem(label: l10n.csS6CommMethodFullSentences, value: _commMethods.contains('full_sentences'), onChanged: (_) => _toggleComm('full_sentences')),
          FormCheckboxItem(label: l10n.csS6CommMethodSigns, value: _commMethods.contains('signs'), onChanged: (_) => _toggleComm('signs')),
          FormCheckboxItem(label: l10n.csS6CommMethodPecs, value: _commMethods.contains('pecs'), onChanged: (_) => _toggleComm('pecs')),
          FormCheckboxItem(label: l10n.csS6CommMethodDevice, value: _commMethods.contains('device'), onChanged: (_) => _toggleComm('device')),
          FormCheckboxItem(label: l10n.csS6CommMethodManualPull, value: _commMethods.contains('manual_pull'), onChanged: (_) => _toggleComm('manual_pull')),
          FormCheckboxItem(label: l10n.csS6CommMethodCrying, value: _commMethods.contains('crying'), onChanged: (_) => _toggleComm('crying')),
          FormCheckboxItem(label: l10n.csS6CommMethodOther, value: _commMethods.contains('other'), onChanged: (_) => _toggleComm('other')),
        ], cols: 3),
        if (_errors['commMethods'] != null)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              _errors['commMethods']!,
              style: const TextStyle(color: AppColors.error, fontSize: 12),
            ),
          ),
        if (_commMethods.contains('other')) ...[
          const SizedBox(height: AppSpacing.p12),
          FormLabeledField(
            label: l10n.csS6CommMethodOtherLabel,
            hint: l10n.csS6CommMethodOtherHint,
            controller: _commOtherCtrl,
          ),
          const SizedBox(height: 4),
          Text(
            l10n.csS6CommMethodOtherNote,
            style: const TextStyle(
              fontSize: 11.5,
              color: AppColors.textSecondary,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
        const SizedBox(height: AppSpacing.p24),

        // ── 2. Expression & Understanding ─────────────────────────────────────
        FormSubsectionTitle(l10n.csS6ExprUnderstandTitle),
        const SizedBox(height: AppSpacing.p12),
        _ExprRow(
          label: l10n.csS6ExpressesNeeds,
          value: _expressesNeeds,
          errorText: _errors['expressesNeeds'],
          onChanged: (v) => setState(() => _expressesNeeds = v ?? ''),
          l10n: l10n,
        ),
        _ExprRow(
          label: l10n.csS6RequestsPreferred,
          value: _requestsPreferred,
          errorText: _errors['requestsPreferred'],
          onChanged: (v) => setState(() => _requestsPreferred = v ?? ''),
          l10n: l10n,
        ),
        _ExprRow(
          label: l10n.csS6UnderstandsSimple,
          value: _understandsSimple,
          errorText: _errors['understandsSimple'],
          onChanged: (v) => setState(() => _understandsSimple = v ?? ''),
          l10n: l10n,
        ),
        _ExprRow(
          label: l10n.csS6UnderstandsComplex,
          value: _understandsComplex,
          errorText: _errors['understandsComplex'],
          onChanged: (v) => setState(() => _understandsComplex = v ?? ''),
          l10n: l10n,
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── 3. Social Communication ───────────────────────────────────────────
        FormSubsectionTitle(l10n.csS6SocialCommTitle),
        const SizedBox(height: AppSpacing.p12),
        _grid([
          FormCheckboxItem(label: l10n.csS6InitiatesInteraction, value: _socialTraits.contains('initiates'), onChanged: (_) => _toggleSocial('initiates')),
          FormCheckboxItem(label: l10n.csS6RespondsToOthers, value: _socialTraits.contains('responds'), onChanged: (_) => _toggleSocial('responds')),
          FormCheckboxItem(label: l10n.csS6PrefersSoloPlay, value: _socialTraits.contains('prefers_solo'), onChanged: (_) => _toggleSocial('prefers_solo')),
          FormCheckboxItem(label: l10n.csS6ImitatesOthers, value: _socialTraits.contains('imitates'), onChanged: (_) => _toggleSocial('imitates')),
          FormCheckboxItem(label: l10n.csS6DifficultyPeers, value: _socialTraits.contains('difficulty_peers'), onChanged: (_) => _toggleSocial('difficulty_peers')),
          FormCheckboxItem(label: l10n.csS6DifficultyTurns, value: _socialTraits.contains('difficulty_turns'), onChanged: (_) => _toggleSocial('difficulty_turns')),
        ]),
        const SizedBox(height: AppSpacing.p24),

        // ── 4. Additional Notes ───────────────────────────────────────────────
        FormLabeledField(
          label: l10n.csS6CommNotes,
          hint: l10n.csS6CommNotesHint,
          controller: _notesCtrl,
          maxLines: 4,
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── 5. Social & Pragmatic Skills ──────────────────────────────────────
        FormSubsectionTitle(l10n.csS6PragmaticTitle),
        const SizedBox(height: AppSpacing.p12),
        _PragRow(
          label: l10n.csS6InitiatesConversation,
          value: _initiatesConversation,
          errorText: _errors['initiatesConversation'],
          options: [
            _PragOption(l10n.csS6OptionAlways, 'always'),
            _PragOption(l10n.csS6OptionSometimes, 'sometimes'),
            _PragOption(l10n.csS6OptionRarely, 'rarely'),
          ],
          onChanged: (v) => setState(() {
            _initiatesConversation = v ?? '';
            _errors['initiatesConversation'] = null;
          }),
        ),
        _PragRow(
          label: l10n.csS6MaintainsEyeContact,
          value: _maintainsEyeContact,
          errorText: _errors['maintainsEyeContact'],
          options: [
            _PragOption(l10n.csS6OptionAlways, 'always'),
            _PragOption(l10n.csS6OptionSometimes, 'sometimes'),
            _PragOption(l10n.csS6OptionRarely, 'rarely'),
          ],
          onChanged: (v) => setState(() {
            _maintainsEyeContact = v ?? '';
            _errors['maintainsEyeContact'] = null;
          }),
        ),
        _PragRow(
          label: l10n.csS6UnderstandsBodyLanguage,
          value: _understandsBodyLanguage,
          errorText: _errors['understandsBodyLanguage'],
          options: [
            _PragOption(l10n.csS6OptionGood, 'good'),
            _PragOption(l10n.csS6OptionAcceptable, 'acceptable'),
            _PragOption(l10n.csS6OptionWeak, 'weak'),
          ],
          onChanged: (v) => setState(() {
            _understandsBodyLanguage = v ?? '';
            _errors['understandsBodyLanguage'] = null;
          }),
        ),
        _PragRow(
          label: l10n.csS6UnderstandsJokes,
          value: _understandsJokes,
          errorText: _errors['understandsJokes'],
          options: [
            _PragOption(l10n.csS6OptionYes, 'yes'),
            _PragOption(l10n.csS6OptionPartial, 'partial'),
            _PragOption(l10n.csS6OptionNo, 'no'),
          ],
          onChanged: (v) => setState(() {
            _understandsJokes = v ?? '';
            _errors['understandsJokes'] = null;
          }),
        ),
        _PragRow(
          label: l10n.csS6ConversationTurnTaking,
          value: _conversationTurnTaking,
          errorText: _errors['conversationTurnTaking'],
          options: [
            _PragOption(l10n.csS6OptionMastered, 'mastered'),
            _PragOption(l10n.csS6OptionInTraining, 'in_training'),
            _PragOption(l10n.csS6OptionMissing, 'missing'),
          ],
          onChanged: (v) => setState(() {
            _conversationTurnTaking = v ?? '';
            _errors['conversationTurnTaking'] = null;
          }),
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

// ── Expression & Understanding row: label + 3 radio options ──────────────────

class _ExprRow extends StatelessWidget {
  final String label;
  final String value;
  final String? errorText;
  final void Function(String?) onChanged;
  final AppLocalizations l10n;

  const _ExprRow({
    required this.label,
    required this.value,
    required this.errorText,
    required this.onChanged,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 13.5),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _RadioCell(
                        label: l10n.csS6OptionYes,
                        groupValue: value,
                        value: 'yes',
                        onChanged: onChanged),
                    _RadioCell(
                        label: l10n.csS6OptionSometimes,
                        groupValue: value,
                        value: 'sometimes',
                        onChanged: onChanged),
                    _RadioCell(
                        label: l10n.csS6OptionNo,
                        groupValue: value,
                        value: 'no',
                        onChanged: onChanged),
                  ],
                ),
              ),
            ],
          ),
          if (errorText != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                errorText!,
                style:
                    const TextStyle(color: AppColors.error, fontSize: 11.5),
                textAlign: TextAlign.start,
              ),
            ),
        ],
      ),
    );
  }
}

// ── Pragmatic skill row: label + N radio options ──────────────────────────────

class _PragOption {
  final String label;
  final String value;
  const _PragOption(this.label, this.value);
}

class _PragRow extends StatelessWidget {
  final String label;
  final String value;
  final String? errorText;
  final List<_PragOption> options;
  final void Function(String?) onChanged;

  const _PragRow({
    required this.label,
    required this.value,
    required this.errorText,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 13.5),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: options.map((opt) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _RadioCell(
                  label: opt.label,
                  groupValue: value,
                  value: opt.value,
                  onChanged: onChanged,
                ),
              );
            }).toList(),
          ),
          if (errorText != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                errorText!,
                style:
                    const TextStyle(color: AppColors.error, fontSize: 11.5),
                textAlign: TextAlign.start,
              ),
            ),
          const Divider(height: 1),
        ],
      ),
    );
  }
}

// ── Animated radio circle + label ─────────────────────────────────────────────

class _RadioCell extends StatelessWidget {
  final String label;
  final String groupValue;
  final String value;
  final void Function(String?) onChanged;

  const _RadioCell({
    required this.label,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final selected = groupValue == value;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected ? AppColors.primary : Colors.transparent,
              border: Border.all(
                color: selected ? AppColors.primary : AppColors.textSecondary,
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
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
