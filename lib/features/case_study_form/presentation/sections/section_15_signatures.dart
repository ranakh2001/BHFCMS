import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_date_picker_field.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_section_header.dart';
import '../widgets/form_signature_field.dart';
import '../widgets/form_text_field.dart';

class Section15Signatures extends StatefulWidget {
  final Section15Data? initialData;
  final void Function(Section15Data data) onNext;
  final bool isSaving;

  const Section15Signatures({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section15Signatures> createState() => _Section15SignaturesState();
}

// Mutable holder for a dynamic team member entry
class _TeamEntry {
  final TextEditingController specializationCtrl;
  final TextEditingController nameCtrl;
  SignatureData signature;

  _TeamEntry({
    String specialization = '',
    String name = '',
    this.signature = const SignatureData(),
  })  : specializationCtrl = TextEditingController(text: specialization),
        nameCtrl = TextEditingController(text: name);

  void dispose() {
    specializationCtrl.dispose();
    nameCtrl.dispose();
  }
}

class _Section15SignaturesState extends State<Section15Signatures> {
  // Guardian
  late final TextEditingController _guardianNameCtrl;
  SignatureData _guardianSig = const SignatureData();
  DateTime? _guardianDate;

  // Specialist
  late final TextEditingController _specialistNameCtrl;
  late final TextEditingController _specialistJobTitleCtrl;
  SignatureData _specialistSig = const SignatureData();
  DateTime? _specialistDate;

  // Team members
  final List<_TeamEntry> _team = [];

  // Validation errors
  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _guardianNameCtrl =
        TextEditingController(text: d?.guardianName ?? '');
    _guardianSig = d?.guardianSignature ?? const SignatureData();
    _guardianDate = d?.guardianDate;

    _specialistNameCtrl =
        TextEditingController(text: d?.specialistName ?? '');
    _specialistJobTitleCtrl =
        TextEditingController(text: d?.specialistJobTitle ?? '');
    _specialistSig = d?.specialistSignature ?? const SignatureData();
    _specialistDate = d?.specialistDate;

    for (final m in d?.teamMembers ?? <TeamMemberData>[]) {
      _team.add(_TeamEntry(
        specialization: m.specialization,
        name: m.name,
        signature: m.signature,
      ));
    }
  }

  @override
  void dispose() {
    _guardianNameCtrl.dispose();
    _specialistNameCtrl.dispose();
    _specialistJobTitleCtrl.dispose();
    for (final e in _team) {
      e.dispose();
    }
    super.dispose();
  }

  String _req(BuildContext context) =>
      AppLocalizations.of(context)!.validationRequired;

  bool _validate(BuildContext context) {
    final req = _req(context);
    bool ok = true;
    setState(() {
      _errors['guardianName'] =
          _guardianNameCtrl.text.trim().isEmpty ? req : null;
      _errors['specialistName'] =
          _specialistNameCtrl.text.trim().isEmpty ? req : null;
      _errors['specialistJobTitle'] =
          _specialistJobTitleCtrl.text.trim().isEmpty ? req : null;
      if (_errors['guardianName'] != null ||
          _errors['specialistName'] != null ||
          _errors['specialistJobTitle'] != null) {
        ok = false;
      }
    });
    return ok;
  }

  void _submit(BuildContext context) {
    if (!_validate(context)) return;
    widget.onNext(
      Section15Data(
        guardianName: _guardianNameCtrl.text.trim(),
        guardianSignature: _guardianSig,
        guardianDate: _guardianDate,
        specialistName: _specialistNameCtrl.text.trim(),
        specialistJobTitle: _specialistJobTitleCtrl.text.trim(),
        specialistSignature: _specialistSig,
        specialistDate: _specialistDate,
        teamMembers: _team
            .map((e) => TeamMemberData(
                  specialization: e.specializationCtrl.text.trim(),
                  name: e.nameCtrl.text.trim(),
                  signature: e.signature,
                ))
            .toList(),
      ),
    );
  }

  // ── Build helpers ──────────────────────────────────────────────────────────

  Widget _divider() => const Padding(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.p16),
        child: Divider(color: Color(0xFFE8E8E8), thickness: 1),
      );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Header ──────────────────────────────────────────────────────
        FormSectionHeader(title: l10n.csSection15Title),
        const SizedBox(height: AppSpacing.p24),

        // ══ Guardian / Caregiver block ══════════════════════════════════
        FormTextField(
          label: l10n.csS15GuardianNameLabel,
          controller: _guardianNameCtrl,
          hint: l10n.csS15GuardianNameHint,
          errorText: _errors['guardianName'],
        ),
        const SizedBox(height: AppSpacing.p16),
        FormSignatureField(
          label: l10n.csS15SignatureLabel,
          clearLabel: l10n.csS15ClearSignature,
          initialData: _guardianSig,
          onChanged: (s) => setState(() => _guardianSig = s),
        ),
        const SizedBox(height: AppSpacing.p16),
        FormDatePickerField(
          label: l10n.csS15DateLabel,
          value: _guardianDate,
          lastDate: DateTime(2100),
          onChanged: (d) => setState(() => _guardianDate = d),
        ),

        _divider(),

        // ══ Specialist block ════════════════════════════════════════════
        FormTextField(
          label: l10n.csS15SpecialistNameLabel,
          controller: _specialistNameCtrl,
          hint: l10n.csS15SpecialistNameHint,
          errorText: _errors['specialistName'],
        ),
        const SizedBox(height: AppSpacing.p16),
        FormTextField(
          label: l10n.csS15JobTitleLabel,
          controller: _specialistJobTitleCtrl,
          hint: l10n.csS15JobTitleHint,
          errorText: _errors['specialistJobTitle'],
        ),
        const SizedBox(height: AppSpacing.p16),
        FormSignatureField(
          label: l10n.csS15SignatureLabel,
          clearLabel: l10n.csS15ClearSignature,
          initialData: _specialistSig,
          onChanged: (s) => setState(() => _specialistSig = s),
        ),
        const SizedBox(height: AppSpacing.p16),
        FormDatePickerField(
          label: l10n.csS15DateLabel,
          value: _specialistDate,
          lastDate: DateTime(2100),
          onChanged: (d) => setState(() => _specialistDate = d),
        ),

        _divider(),

        // ══ Team members ════════════════════════════════════════════════
        GestureDetector(
          onTap: () => setState(() => _team.add(_TeamEntry())),
          child: Text(
            l10n.csS15AddTeamMember,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
            textAlign: TextAlign.start,
          ),
        ),

        // Dynamic team member entries
        for (var i = 0; i < _team.length; i++) ...[
          const SizedBox(height: AppSpacing.p16),
          _TeamMemberCard(
            entry: _team[i],
            l10n: l10n,
            onRemove: () => setState(() {
              _team[i].dispose();
              _team.removeAt(i);
            }),
          ),
        ],

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

// ── Team member card ─────────────────────────────────────────────────────────

class _TeamMemberCard extends StatefulWidget {
  final _TeamEntry entry;
  final AppLocalizations l10n;
  final VoidCallback onRemove;

  const _TeamMemberCard({
    required this.entry,
    required this.l10n,
    required this.onRemove,
  });

  @override
  State<_TeamMemberCard> createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<_TeamMemberCard> {
  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.p16),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Remove button
          Align(
            alignment: AlignmentDirectional.topStart,
            child: GestureDetector(
              onTap: widget.onRemove,
              child: const Icon(Icons.close, size: 18, color: Colors.grey),
            ),
          ),
          const SizedBox(height: AppSpacing.p8),

          FormTextField(
            label: l10n.csS15SpecializationLabel,
            controller: widget.entry.specializationCtrl,
            hint: l10n.csS15SpecializationHint,
          ),
          const SizedBox(height: AppSpacing.p12),
          FormTextField(
            label: l10n.csS15MemberNameLabel,
            controller: widget.entry.nameCtrl,
            hint: l10n.csS15MemberNameHint,
          ),
          const SizedBox(height: AppSpacing.p12),
          FormSignatureField(
            label: l10n.csS15SignatureLabel,
            clearLabel: l10n.csS15ClearSignature,
            initialData: widget.entry.signature,
            onChanged: (s) => setState(() => widget.entry.signature = s),
          ),
        ],
      ),
    );
  }
}
