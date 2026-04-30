import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../domain/entities/case_study_form_data.dart';
import '../presentation/providers/case_study_provider.dart';

// ─── PDF colour constants ────────────────────────────────────────────────────

const _blue = PdfColor(0.118, 0.533, 0.710);         // #1E88B5 – brand primary
const _blueDark = PdfColor(0.071, 0.380, 0.518);      // section header text contrast
const _blueLight = PdfColor(0.878, 0.937, 0.960);     // odd row tint
const _rowAlt = PdfColor(0.965, 0.965, 0.970);        // even row tint
const _border = PdfColor(0.82, 0.82, 0.84);           // table grid
const _textDark = PdfColor(0.122, 0.161, 0.216);      // #1F2937
const _textMid = PdfColor(0.420, 0.447, 0.502);       // #6B7280

// ─── Helpers ─────────────────────────────────────────────────────────────────

String _yn(bool? v) {
  if (v == null) return '';
  return v ? 'نعم' : 'لا';
}

String _yns(bool? v) => (v == null) ? 'غير محدد' : (v ? 'نعم' : 'لا');

String _date(DateTime? d) =>
    d == null ? '' : DateFormat('dd/MM/yyyy').format(d);

String _list(List<String> items) => items.isEmpty ? '' : items.join('، ');

String _val(String v) => v.trim();

typedef _LV = ({String label, String value});

_LV _lv(String label, String value) => (label: label, value: value);

// ─── PdfGenerator ────────────────────────────────────────────────────────────

class PdfGenerator {
  final pw.MemoryImage? _letterheadBg;
  final pw.Font _font;
  final pw.Font _fontBold;
  final bool _overlayLetterhead;

  const PdfGenerator._({
    required pw.MemoryImage? letterheadBg,
    required pw.Font font,
    required pw.Font fontBold,
    required bool overlayLetterhead,
  })  : _letterheadBg = letterheadBg,
        _font = font,
        _fontBold = fontBold,
        _overlayLetterhead = overlayLetterhead;

  /// Loads Cairo fonts from assets (falls back to Helvetica if unavailable).
  static Future<PdfGenerator> create({
    required bool overlayLetterhead,
    pw.MemoryImage? letterheadBg,
  }) async {
    pw.Font font;
    pw.Font fontBold;
    try {
      font = pw.Font.ttf(
          await rootBundle.load('assets/fonts/Cairo-Regular.ttf'));
      fontBold = pw.Font.ttf(
          await rootBundle.load('assets/fonts/Cairo-Bold.ttf'));
    } catch (_) {
      font = pw.Font.helvetica();
      fontBold = pw.Font.helveticaBold();
    }
    return PdfGenerator._(
      letterheadBg: overlayLetterhead ? letterheadBg : null,
      font: font,
      fontBold: fontBold,
      overlayLetterhead: overlayLetterhead,
    );
  }

  // ─── Public build entry ───────────────────────────────────────────────────

  Future<Uint8List> build(CaseStudyFormState data) async {
    final doc = pw.Document(
      title: 'دراسة الحالة',
      author: 'مركز الأفق المشرق للخدمات الطبية',
    );

    doc.addPage(
      pw.MultiPage(
        pageTheme: _pageTheme(),
        build: (ctx) => _buildContent(data),
      ),
    );

    return doc.save();
  }

  // ─── Page theme ──────────────────────────────────────────────────────────

  pw.PageTheme _pageTheme() => pw.PageTheme(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.only(
          top: 200,
          bottom: 130,
          left: 50,
          right: 50,
        ),
        textDirection: pw.TextDirection.rtl,
        theme: pw.ThemeData.withFont(base: _font, bold: _fontBold),
        buildBackground: (_overlayLetterhead && _letterheadBg != null)
            ? (ctx) => pw.FullPage(
                  ignoreMargins: true,
                  child:
                      pw.Image(_letterheadBg, fit: pw.BoxFit.cover),
                )
            : null,
      );

  // ─── Content assembler ────────────────────────────────────────────────────

  List<pw.Widget> _buildContent(CaseStudyFormState s) {
    final w = <pw.Widget>[];

    w.add(_docTitle(s.section1?.childName ?? ''));
    w.add(pw.SizedBox(height: 14));

    if (s.section1 != null) w.addAll(_section1(s.section1!));
    if (s.section2 != null) w.addAll(_section2(s.section2!));
    if (s.section3 != null) w.addAll(_section3(s.section3!));
    if (s.section4 != null) w.addAll(_section4(s.section4!));
    if (s.section5 != null) w.addAll(_section5(s.section5!));
    if (s.section6 != null) w.addAll(_section6(s.section6!));
    if (s.section7 != null) w.addAll(_section7(s.section7!));
    if (s.section8 != null) w.addAll(_section8(s.section8!));
    if (s.section9 != null) w.addAll(_section9(s.section9!));
    if (s.section10 != null) w.addAll(_section10(s.section10!));
    if (s.section11 != null) w.addAll(_section11(s.section11!));
    if (s.sectionDocs != null) w.addAll(_sectionDocs(s.sectionDocs!));
    if (s.section13 != null) w.addAll(_section13(s.section13!));
    if (s.section14 != null) w.addAll(_section14(s.section14!));
    if (s.section15 != null) w.addAll(_section15(s.section15!));

    return w;
  }

  // ─── Document title ───────────────────────────────────────────────────────

  pw.Widget _docTitle(String childName) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Text(
            'دراسة الحالة',
            style: pw.TextStyle(
              font: _fontBold,
              fontSize: 18,
              color: _blue,
            ),
            textDirection: pw.TextDirection.rtl,
          ),
          if (childName.isNotEmpty)
            pw.Text(
              childName,
              style: pw.TextStyle(
                font: _fontBold,
                fontSize: 14,
                color: _textDark,
              ),
              textDirection: pw.TextDirection.rtl,
            ),
          pw.SizedBox(height: 4),
          pw.Text(
            'تاريخ الإصدار: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
            style: pw.TextStyle(
              font: _font,
              fontSize: 10,
              color: _textMid,
            ),
            textDirection: pw.TextDirection.rtl,
          ),
          pw.Divider(color: _blue, thickness: 1.5),
        ],
      );

  // ─── Section header ───────────────────────────────────────────────────────

  pw.Widget _header(String number, String title) => pw.Container(
        width: double.infinity,
        padding:
            const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: const pw.BoxDecoration(
          color: _blue,
          borderRadius: pw.BorderRadius.all(pw.Radius.circular(3)),
        ),
        child: pw.Text(
          '$number. $title',
          style: pw.TextStyle(
            font: _fontBold,
            fontSize: 12,
            color: PdfColors.white,
          ),
          textDirection: pw.TextDirection.rtl,
        ),
      );

  pw.Widget _subHeader(String title) => pw.Container(
        width: double.infinity,
        margin: const pw.EdgeInsets.only(top: 6, bottom: 2),
        padding:
            const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: const pw.BoxDecoration(
          color: _blueLight,
          border: pw.Border(
            right: pw.BorderSide(color: _blue, width: 3),
          ),
        ),
        child: pw.Text(
          title,
          style: pw.TextStyle(
            font: _fontBold,
            fontSize: 10,
            color: _blueDark,
          ),
          textDirection: pw.TextDirection.rtl,
        ),
      );

  // ─── Key-value table ──────────────────────────────────────────────────────

  pw.Widget _kvTable(List<_LV> rows) {
    final visible = rows.where((r) => r.value.trim().isNotEmpty).toList();
    if (visible.isEmpty) return pw.SizedBox();

    return pw.TableHelper.fromTextArray(
      context: null,
      data: visible.map((r) => [r.label, r.value]).toList(),
      headers: null,
      border: pw.TableBorder.all(color: _border, width: 0.5),
      columnWidths: {
        0: const pw.FixedColumnWidth(160),
        1: const pw.FlexColumnWidth(),
      },
      cellStyle: pw.TextStyle(font: _font, fontSize: 10, color: _textDark),
      headerStyle: pw.TextStyle(font: _fontBold, fontSize: 10),
      cellAlignments: {
        0: pw.Alignment.centerRight,
        1: pw.Alignment.centerRight,
      },
      cellPadding:
          const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      oddRowDecoration: const pw.BoxDecoration(color: _rowAlt),
      cellDecoration: (index, data, rowNum) => pw.BoxDecoration(
        color: rowNum.isEven ? PdfColors.white : _rowAlt,
      ),
    );
  }

  // ─── Checkbox grid ────────────────────────────────────────────────────────

  pw.Widget _checkGrid(List<({String label, bool value})> items) {
    return pw.Wrap(
      spacing: 12,
      runSpacing: 4,
      children: items.map((i) => _checkItem(i.label, i.value)).toList(),
    );
  }

  pw.Widget _checkItem(String label, bool checked) => pw.Row(
        mainAxisSize: pw.MainAxisSize.min,
        children: [
          pw.Container(
            width: 11,
            height: 11,
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: _textMid, width: 0.8),
              color: checked ? _blue : PdfColors.white,
            ),
            child: checked
                ? pw.Center(
                    child: pw.Text(
                      '✓',
                      style: pw.TextStyle(
                          font: _font,
                          fontSize: 8,
                          color: PdfColors.white),
                    ),
                  )
                : null,
          ),
          pw.SizedBox(width: 4),
          pw.Text(
            label,
            style: pw.TextStyle(font: _font, fontSize: 9, color: _textDark),
            textDirection: pw.TextDirection.rtl,
          ),
        ],
      );

  pw.Widget _spacing() => pw.SizedBox(height: 12);

  // ═══════════════════════════════════════════════════════════════════════════
  // Section 1 — معلومات الطفل والأسرة
  // ═══════════════════════════════════════════════════════════════════════════

  List<pw.Widget> _section1(Section1Data d) => [
        _header('1', 'معلومات الطفل والأسرة'),
        _kvTable([
          _lv('اسم الطفل', _val(d.childName)),
          _lv('الرقم المرجعي', _val(d.referenceNumber)),
          _lv('تاريخ الميلاد', _date(d.dateOfBirth)),
          _lv('عمر الطفل', _val(d.childAge)),
          _lv('الجنس', _val(d.gender)),
          _lv('الجنسية', _val(d.nationality)),
          _lv('اللغة الأساسية', _val(d.primaryLanguage)),
          _lv('العنوان', _val(d.address)),
          _lv('اسم ولي الأمر', _val(d.caregiverName)),
          _lv('صلة القرابة', _val(d.caregiverRelationship)),
          _lv('رقم الهاتف', _val(d.phoneNumber)),
          _lv('البريد الإلكتروني', _val(d.email)),
          _lv('مصدر الإحالة', _val(d.referralSource)),
          if (d.referralSourceOther.isNotEmpty)
            _lv('مصدر الإحالة - تفاصيل', _val(d.referralSourceOther)),
          _lv('السبب الرئيسي لطلب الخدمة', _val(d.mainServiceReason)),
        ]),
        _spacing(),
      ];

  // ═══════════════════════════════════════════════════════════════════════════
  // Section 2 — معلومات الأسرة
  // ═══════════════════════════════════════════════════════════════════════════

  List<pw.Widget> _section2(Section2Data d) {
    final w = <pw.Widget>[
      _header('2', 'معلومات الأسرة'),
      _kvTable([
        _lv('الحالة الزوجية', _val(d.maritalStatus)),
        _lv('وصف السكن الأول', _val(d.firstHomeDesc)),
        _lv('مالك السكن الأول', _val(d.firstHomeOwner)),
        if (d.secondHomeDesc.isNotEmpty)
          _lv('وصف السكن الثاني', _val(d.secondHomeDesc)),
        if (d.secondHomeOwner.isNotEmpty)
          _lv('مالك السكن الثاني', _val(d.secondHomeOwner)),
        _lv('مهنة الأم', _val(d.motherOccupation)),
        _lv('تعليم الأم', _val(d.motherEducation)),
        _lv('مهنة الأب', _val(d.fatherOccupation)),
        _lv('تعليم الأب', _val(d.fatherEducation)),
        _lv('صاحب القرار', _val(d.decisionMaker)),
        if (d.separationDecision.isNotEmpty)
          _lv('قرار الانفصال', _val(d.separationDecision)),
        if (d.bothParentsAware != null)
          _lv('كلا الوالدين على علم', _yns(d.bothParentsAware)),
      ]),
    ];

    // Family members table
    if (d.familyMembers.isNotEmpty) {
      w.add(_subHeader('أفراد الأسرة'));
      w.add(pw.TableHelper.fromTextArray(
        headers: ['الاسم', 'العمر', 'صلة القرابة', 'الإقامة'],
        data: d.familyMembers
            .map((m) => [m.name, m.age, m.relationship, m.residence])
            .toList(),
        border: pw.TableBorder.all(color: _border, width: 0.5),
        headerStyle:
            pw.TextStyle(font: _fontBold, fontSize: 9, color: PdfColors.white),
        headerDecoration: const pw.BoxDecoration(color: _blue),
        cellStyle: pw.TextStyle(font: _font, fontSize: 9, color: _textDark),
        cellPadding:
            const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        cellAlignments: {
          0: pw.Alignment.center,
          1: pw.Alignment.center,
          2: pw.Alignment.center,
          3: pw.Alignment.center,
        },
        oddRowDecoration: const pw.BoxDecoration(color: _rowAlt),
      ));
    }

    // Family health conditions
    final conditions = <_LV>[
      if (d.autismSpectrum.who != 'none' || d.autismSpectrum.relation.isNotEmpty)
        _lv('طيف التوحد', '${d.autismSpectrum.who} - ${d.autismSpectrum.relation}'),
      if (d.languageDelay.who != 'none' || d.languageDelay.relation.isNotEmpty)
        _lv('تأخر اللغة', '${d.languageDelay.who} - ${d.languageDelay.relation}'),
      if (d.learningDifficulty.who != 'none' ||
          d.learningDifficulty.relation.isNotEmpty)
        _lv('صعوبات التعلم',
            '${d.learningDifficulty.who} - ${d.learningDifficulty.relation}'),
      if (d.adhd.who != 'none' || d.adhd.relation.isNotEmpty)
        _lv('اضطراب التركيز (ADHD)', '${d.adhd.who} - ${d.adhd.relation}'),
      if (d.moodDisorders.who != 'none' || d.moodDisorders.relation.isNotEmpty)
        _lv('اضطرابات المزاج',
            '${d.moodDisorders.who} - ${d.moodDisorders.relation}'),
    ];
    if (conditions.isNotEmpty) {
      w.add(_subHeader('التاريخ الصحي الأسري'));
      w.add(_kvTable(conditions));
    }

    w.add(_spacing());
    return w;
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Section 3 — تاريخ الحمل والولادة
  // ═══════════════════════════════════════════════════════════════════════════

  List<pw.Widget> _section3(Section3Data d) => [
        _header('3', 'تاريخ الحمل والولادة'),
        _kvTable([
          _lv('عدد الولادات الحية', _val(d.liveBirthCount)),
          _lv('عدد الولادات الميتة', _val(d.stillbirthCount)),
          _lv('عمر الأم عند الولادة', _val(d.motherAgeAtBirth)),
          _lv('عمر الأب عند الولادة', _val(d.fatherAgeAtBirth)),
          _lv('صلة القرابة بين الوالدين', _val(d.parentKinship)),
          if (d.wasPlanned != null) _lv('حمل مخطط له', _yn(d.wasPlanned)),
          if (d.usedFertilityTreatment != null)
            _lv('استخدام علاج الخصوبة', _yn(d.usedFertilityTreatment)),
          _lv('أدوية أثناء الحمل', _val(d.medications)),
          if (d.medicationsOther.isNotEmpty)
            _lv('أدوية - تفاصيل', _val(d.medicationsOther)),
          _lv('حمى / إصابات', _val(d.feverInfection)),
          _lv('نزيف / إجهاض', _val(d.bleedingMiscarriage)),
          _lv('ضغط مرتفع / سكري', _val(d.highBpDiabetes)),
          _lv('ضغط نفسي / حوادث', _val(d.severeStressAccidents)),
          _lv('استخدام البيتوسين', _val(d.usedPitocin)),
          _lv('ولادة مبكرة', _val(d.prematureBirth)),
          if (d.prematureWeeks.isNotEmpty)
            _lv('أسبوع الولادة المبكرة', _val(d.prematureWeeks)),
          _lv('مضاعفات الولادة', _val(d.deliveryComplications)),
          if (d.complicationsType.isNotEmpty)
            _lv('نوع المضاعفات', _val(d.complicationsType)),
          _lv('دخول وحدة العناية المركزة', _val(d.nicuResuscitation)),
          if (d.nicuReason.isNotEmpty)
            _lv('سبب دخول العناية', _val(d.nicuReason)),
          if (d.nicuDuration.isNotEmpty)
            _lv('مدة الإقامة في العناية', _val(d.nicuDuration)),
          _lv('طريقة الولادة', _val(d.deliveryType)),
          if (d.cesareanReason.isNotEmpty)
            _lv('سبب القيصرية', _val(d.cesareanReason)),
          if (d.firstMonthProblems.isNotEmpty)
            _lv('مشاكل الشهر الأول', _list(d.firstMonthProblems)),
        ]),
        _spacing(),
      ];

  // ═══════════════════════════════════════════════════════════════════════════
  // Section 4 — التاريخ الطبي
  // ═══════════════════════════════════════════════════════════════════════════

  List<pw.Widget> _section4(Section4Data d) {
    final w = <pw.Widget>[
      _header('4', 'التاريخ الطبي'),
      _subHeader('الحالة الصحية العامة'),
      _checkGrid([
        (label: 'مشاكل السمع أو البصر', value: d.hearingVisionIssues ?? false),
        (label: 'نوبات أو إصابات في الرأس', value: d.seizuresHeadInjury ?? false),
        (label: 'مشاكل النوم أو التغذية', value: d.sleepNutritionIssues ?? false),
        (label: 'أمراض الدم / التنفس / القلب', value: d.bloodAnemiaRespHeart ?? false),
        (label: 'مشاكل الأسنان أو الإدراك', value: d.dentalPerceptionIssues ?? false),
        (label: 'مشاكل في النمو الجسدي', value: d.fattyFailureStunting ?? false),
      ]),
      pw.SizedBox(height: 8),
    ];

    // Diagnoses
    final diags = <_LV>[
      if (d.asdDiagnosis.isNotEmpty) _lv('طيف التوحد (ASD)', d.asdDiagnosis),
      if (d.adhdDiagnosis.isNotEmpty) _lv('اضطراب التركيز (ADHD)', d.adhdDiagnosis),
      if (d.learningDelayDiagnosis.isNotEmpty)
        _lv('تأخر التعلم', d.learningDelayDiagnosis),
      if (d.downSyndromeDiagnosis.isNotEmpty)
        _lv('متلازمة داون', d.downSyndromeDiagnosis),
      if (d.otherDiagnosis.isNotEmpty) _lv('تشخيصات أخرى', d.otherDiagnosis),
    ];
    if (diags.isNotEmpty) {
      w.add(_subHeader('التشخيصات'));
      w.add(_kvTable(diags));
    }

    // Medical assessments
    w.add(_subHeader('التقييمات الطبية'));
    w.add(_kvTable([
      if (d.auditoryVisualAssessment.result.isNotEmpty)
        _lv('تقييم السمع والبصر',
            '${d.auditoryVisualAssessment.result}${d.auditoryVisualAssessment.notes.isNotEmpty ? " - ${d.auditoryVisualAssessment.notes}" : ""}'),
      if (d.brainScanEEG.result.isNotEmpty)
        _lv('تصوير الدماغ / EEG',
            '${d.brainScanEEG.result}${d.brainScanEEG.notes.isNotEmpty ? " - ${d.brainScanEEG.notes}" : ""}'),
      if (d.geneticTest.result.isNotEmpty)
        _lv('الفحص الجيني',
            '${d.geneticTest.result}${d.geneticTest.notes.isNotEmpty ? " - ${d.geneticTest.notes}" : ""}'),
      if (d.psychoIQTest.result.isNotEmpty)
        _lv('اختبار نفسي / ذكاء',
            '${d.psychoIQTest.result}${d.psychoIQTest.notes.isNotEmpty ? " - ${d.psychoIQTest.notes}" : ""}'),
    ]));

    // Allergy & Diet
    w.add(_subHeader('الحساسية والنظام الغذائي'));
    w.add(_kvTable([
      if (d.hasAllergies != null) _lv('يعاني من حساسية', _yn(d.hasAllergies)),
      if (d.allergyType.isNotEmpty) _lv('نوع الحساسية', d.allergyType),
      if (d.specialDiet.isNotEmpty) _lv('نظام غذائي خاص', d.specialDiet),
      if (d.specialDietOther.isNotEmpty)
        _lv('تفاصيل النظام الغذائي', d.specialDietOther),
      if (d.hasAlternativeVaccines != null)
        _lv('لقاحات بديلة', _yn(d.hasAlternativeVaccines)),
      if (d.alternativeVaccinesDesc.isNotEmpty)
        _lv('وصف اللقاحات البديلة', d.alternativeVaccinesDesc),
      if (d.allVaccinesOnTime != null)
        _lv('جميع اللقاحات في موعدها', _yn(d.allVaccinesOnTime)),
    ]));

    // Previous treatments
    if (d.previousTreatments.isNotEmpty) {
      w.add(_subHeader('العلاجات السابقة'));
      w.add(pw.TableHelper.fromTextArray(
        headers: ['نوع العلاج', 'الجهة', 'المدة', 'ملاحظات'],
        data: d.previousTreatments
            .map((t) => [t.treatmentType, t.organization, t.duration, t.notes])
            .toList(),
        border: pw.TableBorder.all(color: _border, width: 0.5),
        headerStyle:
            pw.TextStyle(font: _fontBold, fontSize: 9, color: PdfColors.white),
        headerDecoration: const pw.BoxDecoration(color: _blue),
        cellStyle: pw.TextStyle(font: _font, fontSize: 9, color: _textDark),
        cellPadding:
            const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        oddRowDecoration: const pw.BoxDecoration(color: _rowAlt),
      ));
    }

    // Current medications
    if (d.currentMedications.isNotEmpty) {
      w.add(_subHeader('الأدوية الحالية'));
      w.add(pw.TableHelper.fromTextArray(
        headers: ['الدواء', 'الجرعة والتوقيت', 'المدة', 'ملاحظات'],
        data: d.currentMedications
            .map((m) =>
                [m.name, m.dosageAndTiming, m.duration, m.notes])
            .toList(),
        border: pw.TableBorder.all(color: _border, width: 0.5),
        headerStyle:
            pw.TextStyle(font: _fontBold, fontSize: 9, color: PdfColors.white),
        headerDecoration: const pw.BoxDecoration(color: _blue),
        cellStyle: pw.TextStyle(font: _font, fontSize: 9, color: _textDark),
        cellPadding:
            const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        oddRowDecoration: const pw.BoxDecoration(color: _rowAlt),
      ));
    }

    w.add(_spacing());
    return w;
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Section 5 — التاريخ النمائي
  // ═══════════════════════════════════════════════════════════════════════════

  List<pw.Widget> _section5(Section5Data d) => [
        _header('5', 'التاريخ النمائي'),
        _subHeader('المهارات الاجتماعية / العاطفية'),
        _checkGrid([
          (label: 'الابتسامة الاجتماعية', value: d.socialSmile),
          (label: 'يتعرف على أفراد الأسرة', value: d.knowsFamilyMembers),
          (label: 'يستجيب للاسم', value: d.respondsToName),
          (label: 'يُظهر المودة', value: d.showsAffection),
          (label: 'خجول أو خائف', value: d.shyOrFearful),
        ]),
        pw.SizedBox(height: 6),
        _subHeader('المهارات المعرفية'),
        _checkGrid([
          (label: 'يحاكي الكبار', value: d.imitatesAdults),
          (label: 'يضع الأشياء في الفم', value: d.putsObjectsInMouth),
          (label: 'يتعرف على الألوان', value: d.recognizesColors),
          (label: 'اللعب الخيالي', value: d.imaginativePlay),
          (label: 'يتبع التعليمات', value: d.followsInstructions),
        ]),
        pw.SizedBox(height: 6),
        _subHeader('مهارات اللغة والتواصل'),
        _checkGrid([
          (label: 'يصدر أصوات المناغاة', value: d.cooing),
          (label: 'يستخدم جملاً من كلمتين', value: d.twoWordPhrases),
          (label: 'يستخدم الإيماءات', value: d.usesGestures),
          (label: 'يطلب بالكلمات', value: d.requestsByWords),
        ]),
        pw.SizedBox(height: 6),
        _subHeader('المهارات الحركية'),
        _checkGrid([
          (label: 'الجلوس والحبو', value: d.sittingCrawling),
          (label: 'القفز والتسلق', value: d.jumpingClimbing),
          (label: 'المشي باستقلالية', value: d.walkingWithoutHelp),
          (label: 'إمساك القلم والرسم', value: d.holdingPenDrawing),
          (label: 'الركل والرمي', value: d.kickingThrowing),
        ]),
        pw.SizedBox(height: 6),
        _subHeader('مراحل النمو'),
        _kvTable([
          _lv('عمر الابتسامة الاجتماعية',
              '${d.socialSmileAge}${d.socialSmileNotes.isNotEmpty ? " - ${d.socialSmileNotes}" : ""}'),
          _lv('عمر الجلوس المستقل',
              '${d.independentSittingAge}${d.independentSittingNotes.isNotEmpty ? " - ${d.independentSittingNotes}" : ""}'),
          _lv('عمر المشي المستقل',
              '${d.independentWalkingAge}${d.independentWalkingNotes.isNotEmpty ? " - ${d.independentWalkingNotes}" : ""}'),
          _lv('عمر الكلمة الأولى',
              '${d.firstWordAge}${d.firstWordNotes.isNotEmpty ? " - ${d.firstWordNotes}" : ""}'),
          if (d.hadSkillRegression != null)
            _lv('حدث تراجع في المهارات', _yn(d.hadSkillRegression)),
          if (d.regressionAge.isNotEmpty) _lv('عمر التراجع', d.regressionAge),
          if (d.regressionDetails.isNotEmpty)
            _lv('تفاصيل التراجع', d.regressionDetails),
        ]),
        _spacing(),
      ];

  // ═══════════════════════════════════════════════════════════════════════════
  // Section 6 — التواصل والمهارات الاجتماعية
  // ═══════════════════════════════════════════════════════════════════════════

  List<pw.Widget> _section6(Section6Data d) => [
        _header('6', 'التواصل والمهارات الاجتماعية'),
        _kvTable([
          if (d.communicationMethods.isNotEmpty)
            _lv('طرق التواصل', _list(d.communicationMethods)),
          if (d.communicationMethodOther.isNotEmpty)
            _lv('طريقة تواصل أخرى', d.communicationMethodOther),
          _lv('يعبر عن احتياجاته', _val(d.expressesNeeds)),
          _lv('يطلب المفضل لديه', _val(d.requestsPreferred)),
          _lv('يفهم التعليمات البسيطة', _val(d.understandsSimple)),
          _lv('يفهم التعليمات المركبة', _val(d.understandsComplex)),
          if (d.socialCommTraits.isNotEmpty)
            _lv('خصائص التواصل الاجتماعي',
                _list(d.socialCommTraits)),
          if (d.communicationNotes.isNotEmpty)
            _lv('ملاحظات التواصل', d.communicationNotes),
          _lv('يبدأ المحادثة', _val(d.initiatesConversation)),
          _lv('يحافظ على التواصل البصري', _val(d.maintainsEyeContact)),
          _lv('يفهم لغة الجسد', _val(d.understandsBodyLanguage)),
          _lv('يفهم النكات', _val(d.understandsJokes)),
          _lv('تناوب الأدوار في المحادثة', _val(d.conversationTurnTaking)),
        ]),
        _spacing(),
      ];

  // ═══════════════════════════════════════════════════════════════════════════
  // Section 7 — مهارات الحياة اليومية
  // ═══════════════════════════════════════════════════════════════════════════

  List<pw.Widget> _section7(Section7Data d) => [
        _header('7', 'مهارات الحياة اليومية'),
        _subHeader('الأكل والشرب'),
        _checkGrid([
          (label: 'يستخدم الملعقة والشوكة', value: d.usesSpoonFork),
          (label: 'انتقائي في الطعام', value: d.selectiveEater),
          (label: 'يستخدم اليدين في الأكل', value: d.usesHandsForEating),
          (label: 'يرفض بعض القوام', value: d.refusesTextures),
          (label: 'يشرب من الكوب', value: d.drinksFromCup),
          (label: 'يحتاج مساعدة كاملة في الأكل', value: d.needsFullAssistanceEating),
        ]),
        if (d.howRequestsFood.isNotEmpty)
          _kvTable([_lv('كيف يطلب الطعام', d.howRequestsFood)]),
        pw.SizedBox(height: 6),
        _subHeader('الملبس'),
        _checkGrid([
          (label: 'يخلع الأحذية والجوارب', value: d.removesShoesSocks),
          (label: 'يغلق الملابس بالأزرار', value: d.closesZipperButtons),
          (label: 'يرتدي الملابس بمساعدة', value: d.dressesWithAssistance),
        ]),
        pw.SizedBox(height: 6),
        _subHeader('النظافة الشخصية'),
        _checkGrid([
          (label: 'يغسل يديه ووجهه', value: d.washesHandsFace),
          (label: 'يستحم بمفرده', value: d.bathesAlone),
          (label: 'ينظف أسنانه وشعره', value: d.cleansTeetHair),
          (label: 'صعوبة في قص الأظافر', value: d.nailCuttingDifficulty),
        ]),
        pw.SizedBox(height: 6),
        _subHeader('الحمام والنوم'),
        _kvTable([
          _lv('استقلالية في الحمام', _val(d.bathroomIndependence)),
          _lv('كيف يطلب النوم', _val(d.howRequestsSleep)),
        ]),
        _spacing(),
      ];

  // ═══════════════════════════════════════════════════════════════════════════
  // Section 8 — الملف الحسي والسلوكي
  // ═══════════════════════════════════════════════════════════════════════════

  List<pw.Widget> _section8(Section8Data d) {
    final w = <pw.Widget>[
      _header('8', 'الملف الحسي والسلوكي'),
      _subHeader('السلوكيات'),
      _kvTable([
        _lv('السلوك العدواني', _val(d.aggressionDescription)),
        _lv('إيذاء الذات', _val(d.selfHarmDescription)),
        _lv('السلوكيات النمطية', _val(d.stereotypicalBehaviorsDescription)),
        _lv('مقاومة التغيير', _val(d.resistanceToChangeDescription)),
        _lv('التعلق الزائد', _val(d.excessiveAttachmentDescription)),
        _lv('حالة التركيز العامة', _val(d.generalAttentionState)),
        _lv('ملاحظات عامة', _val(d.generalStateNotes)),
      ]),
    ];

    // Behavioral patterns table
    if (d.behavioralPatterns.isNotEmpty) {
      w.add(_subHeader('الأنماط السلوكية'));
      w.add(pw.TableHelper.fromTextArray(
        headers: ['النمط', 'الممارسات', 'الوظيفة المتوقعة'],
        data: d.behavioralPatterns
            .map((p) => [p.pattern, p.practices, p.expectedFunction])
            .toList(),
        border: pw.TableBorder.all(color: _border, width: 0.5),
        headerStyle:
            pw.TextStyle(font: _fontBold, fontSize: 9, color: PdfColors.white),
        headerDecoration: const pw.BoxDecoration(color: _blue),
        cellStyle: pw.TextStyle(font: _font, fontSize: 9, color: _textDark),
        cellPadding:
            const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        oddRowDecoration: const pw.BoxDecoration(color: _rowAlt),
      ));
    }

    w.add(_subHeader('المشاكل الحسية'));
    w.add(_kvTable([
      if (d.hasSensoryIssues != null)
        _lv('يعاني من مشاكل حسية', _yn(d.hasSensoryIssues)),
      if (d.sensoryIssuesNotes.isNotEmpty)
        _lv('ملاحظات المشاكل الحسية', d.sensoryIssuesNotes),
      if (d.hearingIssue != null) _lv('مشكلة في السمع', _yn(d.hearingIssue)),
      if (d.hearingNotes.isNotEmpty) _lv('ملاحظات السمع', d.hearingNotes),
      if (d.touchIssue != null) _lv('مشكلة في اللمس', _yn(d.touchIssue)),
      if (d.touchNotes.isNotEmpty) _lv('ملاحظات اللمس', d.touchNotes),
      if (d.tasteIssue != null) _lv('مشكلة في التذوق', _yn(d.tasteIssue)),
      if (d.tasteNotes.isNotEmpty) _lv('ملاحظات التذوق', d.tasteNotes),
      if (d.vestibularIssue != null)
        _lv('مشكلة دهليزية', _yn(d.vestibularIssue)),
      if (d.vestibularNotes.isNotEmpty)
        _lv('ملاحظات الجهاز الدهليزي', d.vestibularNotes),
      if (d.visualSensoryIssue != null)
        _lv('مشكلة بصرية حسية', _yn(d.visualSensoryIssue)),
      if (d.visualSensoryNotes.isNotEmpty)
        _lv('ملاحظات البصر الحسي', d.visualSensoryNotes),
      if (d.sensoryReactionDescription.isNotEmpty)
        _lv('وصف التفاعل الحسي', d.sensoryReactionDescription),
    ]));

    w.add(_subHeader('الجانب الاجتماعي'));
    w.add(_kvTable([
      if (d.makesFriendsEasily != null)
        _lv('يصنع صداقات بسهولة', _yn(d.makesFriendsEasily)),
      if (d.makesFriendsNotes.isNotEmpty)
        _lv('ملاحظات الصداقات', d.makesFriendsNotes),
      if (d.sharesInterests != null)
        _lv('يشارك الاهتمامات', _yn(d.sharesInterests)),
      if (d.sharesInterestsNotes.isNotEmpty)
        _lv('ملاحظات مشاركة الاهتمامات', d.sharesInterestsNotes),
      _lv('التعرض للإيذاء', _val(d.abuseExposure)),
      if (d.abuseNotes.isNotEmpty) _lv('ملاحظات الإيذاء', d.abuseNotes),
      if (d.hasSignificantSocialEvent != null)
        _lv('حدث اجتماعي مهم', _yn(d.hasSignificantSocialEvent)),
      if (d.significantSocialEventNotes.isNotEmpty)
        _lv('تفاصيل الحدث', d.significantSocialEventNotes),
      _lv('ردة الفعل على السلوك السلبي',
          _val(d.reactionToNegativeBehavior)),
    ]));

    w.add(_spacing());
    return w;
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Section 9 — القدرات والاهتمامات
  // ═══════════════════════════════════════════════════════════════════════════

  List<pw.Widget> _section9(Section9Data d) => [
        _header('9', 'القدرات والاهتمامات'),
        _kvTable([
          _lv('نقاط القوة الملاحظة', _val(d.observedStrengths)),
        ]),
        _subHeader('الأنشطة المفضلة'),
        _checkGrid([
          (label: 'ألعاب حسية', value: d.activitySensoryGames),
          (label: 'أجهزة إلكترونية', value: d.activityElectronics),
          (label: 'أنشطة حركية', value: d.activityMotor),
          (label: 'أطعمة', value: d.activityFoods),
          (label: 'شخصيات', value: d.activityCharacters),
          (label: 'موسيقى', value: d.activityMusic),
          (label: 'أخرى', value: d.activityOther),
        ]),
        if (d.otherActivitiesDescription.isNotEmpty)
          _kvTable([
            _lv('وصف الأنشطة الأخرى', d.otherActivitiesDescription)
          ]),
        pw.SizedBox(height: 6),
        _subHeader('تقييم المعززات'),
        _kvTable([
          _lv('مثال على الطعام المفضل',
              '${d.foodExample}${d.foodRating.isNotEmpty ? " (${d.foodRating})" : ""}'),
          _lv('مثال على المحفز الحسي',
              '${d.sensoryExample}${d.sensoryRating.isNotEmpty ? " (${d.sensoryRating})" : ""}'),
          _lv('مثال على المحفز الاجتماعي',
              '${d.socialExample}${d.socialRating.isNotEmpty ? " (${d.socialRating})" : ""}'),
          _lv('مثال على المواد المفضلة',
              '${d.materialExample}${d.materialRating.isNotEmpty ? " (${d.materialRating})" : ""}'),
          _lv('التميز الإيجابي', _val(d.positiveDistinction)),
        ]),
        _spacing(),
      ];

  // ═══════════════════════════════════════════════════════════════════════════
  // Section 10 — التعليم والخدمات
  // ═══════════════════════════════════════════════════════════════════════════

  List<pw.Widget> _section10(Section10Data d) => [
        _header('10', 'التعليم والخدمات'),
        _kvTable([
          if (d.isEnrolledInSchool != null)
            _lv('ملتحق بالمدرسة', _yn(d.isEnrolledInSchool)),
          if (d.schoolName.isNotEmpty) _lv('اسم المدرسة', d.schoolName),
          if (d.schoolGrade.isNotEmpty) _lv('الصف الدراسي', d.schoolGrade),
          if (d.serviceDuration.isNotEmpty)
            _lv('مدة الخدمة', d.serviceDuration),
          if (d.hasIEP != null)
            _lv('خطة تعليمية فردية (IEP)', _yn(d.hasIEP)),
          if (d.classType.isNotEmpty) _lv('نوع الفصل', d.classType),
          if (d.hasShadowTeacher != null)
            _lv('معلم ظل', _yn(d.hasShadowTeacher)),
          if (d.shadowTeacherName.isNotEmpty)
            _lv('اسم معلم الظل', d.shadowTeacherName),
          if (d.schoolBehavior.isNotEmpty)
            _lv('السلوك في المدرسة', d.schoolBehavior),
        ]),
        _subHeader('الخدمات المستلمة'),
        _checkGrid([
          (label: 'تحليل السلوك التطبيقي (ABA)', value: d.serviceABA),
          (label: 'علاج النطق', value: d.serviceSpeech),
          (label: 'العلاج الوظيفي', value: d.serviceOccupational),
          (label: 'العلاج الطبيعي', value: d.servicePhysical),
          (label: 'الدعم النفسي', value: d.servicePsychological),
          (label: 'التربية الخاصة', value: d.serviceSpecialEd),
          (label: 'لا توجد خدمات', value: d.serviceNone),
        ]),
        if (d.otherServiceDescription.isNotEmpty)
          _kvTable([_lv('خدمات أخرى', d.otherServiceDescription)]),
        pw.SizedBox(height: 6),
        _subHeader('التقارير المتاحة'),
        _checkGrid([
          (label: 'Vineland', value: d.reportVineland),
          (label: 'EFL', value: d.reportEFL),
          (label: 'AFLS', value: d.reportAFLS),
          (label: 'ABLLS', value: d.reportABLLS),
          (label: 'VB-MAPP', value: d.reportVBMAPP),
          (label: 'أخرى', value: d.reportOther),
          (label: 'لا يوجد تقرير', value: d.reportNone),
        ]),
        pw.SizedBox(height: 6),
        _subHeader('التعديلات البيئية'),
        _checkGrid([
          (label: 'تقليل المشتتات', value: d.modReduceDistractions),
          (label: 'جدول بصري', value: d.modVisualSchedule),
          (label: 'مقعد محدد', value: d.modSpecificSeat),
          (label: 'تعديلات أخرى', value: d.modOther),
        ]),
        _spacing(),
      ];

  // ═══════════════════════════════════════════════════════════════════════════
  // Section 11 — أولويات الأسرة وأهدافها
  // ═══════════════════════════════════════════════════════════════════════════

  List<pw.Widget> _section11(Section11Data d) => [
        _header('11', 'أولويات الأسرة وأهدافها'),
        _kvTable([
          _lv('أهم المخاوف', _val(d.topConcerns)),
          _lv('أهم الأهداف', _val(d.topGoals)),
          _lv('أوقات الجلسات المفضلة', _val(d.sessionTimePreferences)),
          _lv('استعداد الوالدين للتدريب', _val(d.parentTrainingReadiness)),
        ]),
        _spacing(),
      ];

  // ═══════════════════════════════════════════════════════════════════════════
  // Section 12 — الوثائق والموافقات
  // ═══════════════════════════════════════════════════════════════════════════

  List<pw.Widget> _sectionDocs(SectionDocumentsConsentData d) => [
        _header('12', 'الوثائق والموافقات'),
        _subHeader('الوثائق المقدمة'),
        _checkGrid([
          (label: 'هوية الطفل', value: d.docID),
          (label: 'تقارير طبية', value: d.docMedicalReports),
          (label: 'تقارير تشخيصية', value: d.docDiagnosticReports),
          (label: 'تقارير مدرسية', value: d.docSchoolReports),
          (label: 'تقارير علاج سابق', value: d.docPrevTreatmentReports),
          (label: 'وثائق أخرى', value: d.docOther),
        ]),
        if (d.docOtherName.isNotEmpty)
          _kvTable([_lv('اسم الوثيقة الأخرى', d.docOtherName)]),
        pw.SizedBox(height: 6),
        _subHeader('الموافقات'),
        _checkGrid([
          (label: 'موافقة على الخصوصية', value: d.consentPrivacy),
          (label: 'موافقة على مشاركة المعلومات', value: d.consentInfoSharing),
          (label: 'موافقة على التواصل الآخر', value: d.consentOtherComms),
          (label: 'موافقة على التقييمات', value: d.consentAssessments),
          (label: 'موافقة على الخطة المستقبلية', value: d.consentFuturePlan),
        ]),
        _spacing(),
      ];

  // ═══════════════════════════════════════════════════════════════════════════
  // Section 13 — خطة التقييم المبدئي
  // ═══════════════════════════════════════════════════════════════════════════

  List<pw.Widget> _section13(Section13Data d) => [
        _header('13', 'خطة التقييم المبدئي والمتابعة'),
        _kvTable([
          _lv('مستوى الأولوية', _val(d.priorityLevel)),
          if (d.reviewOtherReports != null)
            _lv('مراجعة تقارير أخرى', _yn(d.reviewOtherReports)),
          if (d.directObservation != null)
            _lv('ملاحظة مباشرة', _yn(d.directObservation)),
          if (d.familyMeeting != null)
            _lv('اجتماع الأسرة', _yn(d.familyMeeting)),
          _lv('الملاحظات والخطوات التالية', _val(d.notesAndNextSteps)),
          _lv('تاريخ التقييم التالي', _date(d.nextAssessmentDate)),
          _lv('وقت التقييم التالي', _val(d.nextAssessmentTime)),
        ]),
        _subHeader('التخصصات المطلوبة'),
        _checkGrid([
          (label: 'تحليل السلوك التطبيقي (ABA)', value: d.specABA),
          (label: 'علاج النطق', value: d.specSpeech),
          (label: 'العلاج الوظيفي', value: d.specOccupational),
          (label: 'العلاج الطبيعي', value: d.specPhysical),
          (label: 'الدعم النفسي', value: d.specPsychological),
          (label: 'التربية الخاصة', value: d.specSpecialEd),
        ]),
        _spacing(),
      ];

  // ═══════════════════════════════════════════════════════════════════════════
  // Section 14 — الروتين اليومي
  // ═══════════════════════════════════════════════════════════════════════════

  List<pw.Widget> _section14(Section14Data d) => [
        _header('14', 'الروتين اليومي'),
        _kvTable([
          _lv('الروتين في أيام الأسبوع', _val(d.weekdayRoutine)),
          _lv('الروتين في عطلة نهاية الأسبوع', _val(d.weekendRoutine)),
        ]),
        _spacing(),
      ];

  // ═══════════════════════════════════════════════════════════════════════════
  // Section 15 — التوقيعات
  // ═══════════════════════════════════════════════════════════════════════════

  List<pw.Widget> _section15(Section15Data d) {
    final w = <pw.Widget>[
      _header('15', 'التوقيعات'),
      _kvTable([
        _lv('اسم ولي الأمر', _val(d.guardianName)),
        _lv('تاريخ التوقيع (ولي الأمر)', _date(d.guardianDate)),
        _lv('اسم الاختصاصي', _val(d.specialistName)),
        _lv('المسمى الوظيفي للاختصاصي', _val(d.specialistJobTitle)),
        _lv('تاريخ التوقيع (الاختصاصي)', _date(d.specialistDate)),
      ]),
    ];

    if (d.teamMembers.isNotEmpty) {
      w.add(_subHeader('أعضاء الفريق'));
      w.add(pw.TableHelper.fromTextArray(
        headers: ['التخصص', 'الاسم'],
        data: d.teamMembers
            .map((m) => [m.specialization, m.name])
            .toList(),
        border: pw.TableBorder.all(color: _border, width: 0.5),
        headerStyle:
            pw.TextStyle(font: _fontBold, fontSize: 9, color: PdfColors.white),
        headerDecoration: const pw.BoxDecoration(color: _blue),
        cellStyle: pw.TextStyle(font: _font, fontSize: 9, color: _textDark),
        cellPadding:
            const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        oddRowDecoration: const pw.BoxDecoration(color: _rowAlt),
      ));
    }

    w.add(_spacing());
    return w;
  }
}
