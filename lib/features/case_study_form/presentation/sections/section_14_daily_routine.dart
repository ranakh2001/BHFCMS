import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../widgets/form_next_button.dart';
import '../widgets/form_notes_field.dart';
import '../widgets/form_section_header.dart';

class Section14DailyRoutine extends StatefulWidget {
  final Section14Data? initialData;
  final void Function(Section14Data data) onNext;
  final bool isSaving;

  const Section14DailyRoutine({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section14DailyRoutine> createState() => _Section14DailyRoutineState();
}

class _Section14DailyRoutineState extends State<Section14DailyRoutine> {
  late final TextEditingController _weekdayCtrl;
  late final TextEditingController _weekendCtrl;

  @override
  void initState() {
    super.initState();
    _weekdayCtrl =
        TextEditingController(text: widget.initialData?.weekdayRoutine ?? '');
    _weekendCtrl =
        TextEditingController(text: widget.initialData?.weekendRoutine ?? '');
  }

  @override
  void dispose() {
    _weekdayCtrl.dispose();
    _weekendCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    widget.onNext(
      Section14Data(
        weekdayRoutine: _weekdayCtrl.text.trim(),
        weekendRoutine: _weekendCtrl.text.trim(),
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
        FormSectionHeader(title: l10n.csSection14Title),
        const SizedBox(height: AppSpacing.p24),

        // ── Weekday routine ───────────────────────────────────────────
        Text(
          l10n.csS14WeekdayRoutineLabel,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: AppSpacing.p8),
        FormNotesField(
          controller: _weekdayCtrl,
          hint: l10n.csS14WeekdayRoutineHint,
          maxLines: 5,
        ),
        const SizedBox(height: AppSpacing.p24),

        // ── Weekend routine ───────────────────────────────────────────
        Text(
          l10n.csS14WeekendRoutineLabel,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: AppSpacing.p8),
        FormNotesField(
          controller: _weekendCtrl,
          hint: l10n.csS14WeekendRoutineHint,
          maxLines: 5,
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
