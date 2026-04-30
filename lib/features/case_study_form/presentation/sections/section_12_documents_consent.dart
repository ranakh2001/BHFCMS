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

class Section12DocumentsConsent extends StatefulWidget {
  final SectionDocumentsConsentData? initialData;
  final void Function(SectionDocumentsConsentData data) onNext;
  final bool isSaving;

  const Section12DocumentsConsent({
    super.key,
    this.initialData,
    required this.onNext,
    this.isSaving = false,
  });

  @override
  State<Section12DocumentsConsent> createState() =>
      _Section12DocumentsConsentState();
}

class _Section12DocumentsConsentState
    extends State<Section12DocumentsConsent> {
  // Documents submitted
  late bool _docID;
  late bool _docMedicalReports;
  late bool _docDiagnosticReports;
  late bool _docSchoolReports;
  late bool _docPrevTreatmentReports;
  late bool _docOther;
  late final TextEditingController _docOtherNameCtrl;

  // Consents
  late bool _consentPrivacy;
  late bool _consentInfoSharing;
  late bool _consentOtherComms;
  late bool _consentAssessments;
  late bool _consentFuturePlan;

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    _docID = d?.docID ?? false;
    _docMedicalReports = d?.docMedicalReports ?? false;
    _docDiagnosticReports = d?.docDiagnosticReports ?? false;
    _docSchoolReports = d?.docSchoolReports ?? false;
    _docPrevTreatmentReports = d?.docPrevTreatmentReports ?? false;
    _docOther = d?.docOther ?? false;
    _docOtherNameCtrl = TextEditingController(text: d?.docOtherName ?? '');
    _consentPrivacy = d?.consentPrivacy ?? false;
    _consentInfoSharing = d?.consentInfoSharing ?? false;
    _consentOtherComms = d?.consentOtherComms ?? false;
    _consentAssessments = d?.consentAssessments ?? false;
    _consentFuturePlan = d?.consentFuturePlan ?? false;
  }

  @override
  void dispose() {
    _docOtherNameCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    widget.onNext(SectionDocumentsConsentData(
      docID: _docID,
      docMedicalReports: _docMedicalReports,
      docDiagnosticReports: _docDiagnosticReports,
      docSchoolReports: _docSchoolReports,
      docPrevTreatmentReports: _docPrevTreatmentReports,
      docOther: _docOther,
      docOtherName: _docOther ? _docOtherNameCtrl.text.trim() : '',
      consentPrivacy: _consentPrivacy,
      consentInfoSharing: _consentInfoSharing,
      consentOtherComms: _consentOtherComms,
      consentAssessments: _consentAssessments,
      consentFuturePlan: _consentFuturePlan,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Header ────────────────────────────────────────────────────────────
        FormSectionHeader(title: l10n.csSectionDocsTitle),
        const SizedBox(height: AppSpacing.p24),

        // ── 1. Documents Submitted ────────────────────────────────────────────
        FormSubsectionTitle(l10n.csSectionDocsSubmittedTitle),
        const SizedBox(height: AppSpacing.p12),
        FormCheckboxGrid(items: [
          FormCheckboxItem(
            label: l10n.csSectionDocsID,
            value: _docID,
            onChanged: (v) => setState(() => _docID = v),
          ),
          FormCheckboxItem(
            label: l10n.csSectionDocsMedicalReports,
            value: _docMedicalReports,
            onChanged: (v) => setState(() => _docMedicalReports = v),
          ),
          FormCheckboxItem(
            label: l10n.csSectionDocsDiagnosticReports,
            value: _docDiagnosticReports,
            onChanged: (v) => setState(() => _docDiagnosticReports = v),
          ),
          FormCheckboxItem(
            label: l10n.csSectionDocsSchoolReports,
            value: _docSchoolReports,
            onChanged: (v) => setState(() => _docSchoolReports = v),
          ),
          FormCheckboxItem(
            label: l10n.csSectionDocsPrevTreatmentReports,
            value: _docPrevTreatmentReports,
            onChanged: (v) => setState(() => _docPrevTreatmentReports = v),
          ),
          FormCheckboxItem(
            label: l10n.csSectionDocsOther,
            value: _docOther,
            onChanged: (v) => setState(() => _docOther = v),
          ),
        ]),
        if (_docOther) ...[
          const SizedBox(height: AppSpacing.p12),
          Text(
            l10n.csSectionDocsOtherLabel,
            style: const TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 4),
          Text(
            l10n.csSectionDocsOtherNote,
            style: const TextStyle(
              fontSize: 11.5,
              color: AppColors.textSecondary,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: AppSpacing.p8),
          FormNotesField(
            controller: _docOtherNameCtrl,
            hint: l10n.csSectionDocsOtherHint,
            maxLines: 2,
          ),
        ],
        const SizedBox(height: AppSpacing.p24),

        // ── 2. Consents ───────────────────────────────────────────────────────
        FormSubsectionTitle(l10n.csSectionDocsConsentsTitle),
        const SizedBox(height: AppSpacing.p12),
        FormCheckboxGrid(items: [
          FormCheckboxItem(
            label: l10n.csSectionDocsConsentPrivacy,
            value: _consentPrivacy,
            onChanged: (v) => setState(() => _consentPrivacy = v),
          ),
          FormCheckboxItem(
            label: l10n.csSectionDocsConsentInfoSharing,
            value: _consentInfoSharing,
            onChanged: (v) => setState(() => _consentInfoSharing = v),
          ),
          FormCheckboxItem(
            label: l10n.csSectionDocsConsentOtherComms,
            value: _consentOtherComms,
            onChanged: (v) => setState(() => _consentOtherComms = v),
          ),
          FormCheckboxItem(
            label: l10n.csSectionDocsConsentAssessments,
            value: _consentAssessments,
            onChanged: (v) => setState(() => _consentAssessments = v),
          ),
          FormCheckboxItem(
            label: l10n.csSectionDocsConsentFuturePlan,
            value: _consentFuturePlan,
            onChanged: (v) => setState(() => _consentFuturePlan = v),
          ),
        ]),
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
