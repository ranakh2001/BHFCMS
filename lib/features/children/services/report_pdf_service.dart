import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../domain/entities/report.dart';

/// Generates a simple single-page PDF from a [Report] and saves it to the
/// app documents directory.
///
/// Mock behaviour:
/// - The [pdfUrl] stored on the [Report] entity is the simulated path
///   `/local/reports/report_<id>.pdf` set at create-time.
/// - Calling [generateAndSave] materialises the actual file on disk and
///   returns its absolute path — useful when the user triggers download/share.
///
/// Replace with an `ApiReportPdfService` that downloads the file from a
/// remote URL when the real backend is ready.
class ReportPdfService {
  /// Generates a PDF for [report], persists it to disk, and returns the
  /// absolute file path.
  Future<String> generateAndSave(Report report) async {
    // Load Arabic font from assets
    final fontData = await rootBundle.load('assets/fonts/Cairo-Regular.ttf');
    final fontBoldData = await rootBundle.load('assets/fonts/Cairo-Bold.ttf');
    final font = pw.Font.ttf(fontData);
    final fontBold = pw.Font.ttf(fontBoldData);

    final doc = pw.Document(
      title: report.title,
      author: 'BHCFMS',
      theme: pw.ThemeData.withFont(
        base: font,
        bold: fontBold,
      ),
    );

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        textDirection: pw.TextDirection.rtl,
        build: (pw.Context ctx) => pw.Padding(
          padding: const pw.EdgeInsets.all(32),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Title
              pw.Text(
                report.title,
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
                textDirection: pw.TextDirection.rtl,
              ),
              pw.SizedBox(height: 12),
              pw.Divider(),
              pw.SizedBox(height: 12),

              // Meta rows
              _metaRow('معرّف التقرير', report.id),
              _metaRow('الطفل', report.childId),
              _metaRow('تاريخ الرفع', _formatDate(report.createdAt)),
              _metaRow('الحالة', _translateStatus(report.status)),
              if (report.uploadedBy != null)
                _metaRow('رُفع بواسطة', report.uploadedBy!),

              // Description
              if (report.description != null && report.description!.isNotEmpty)
                ...[
                pw.SizedBox(height: 16),
                pw.Text(
                  'الوصف',
                  style: pw.TextStyle(
                    fontSize: 13,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  textDirection: pw.TextDirection.rtl,
                ),
                pw.SizedBox(height: 4),
                pw.Text(
                  report.description!,
                  style: const pw.TextStyle(fontSize: 12),
                  textDirection: pw.TextDirection.rtl,
                ),
              ],
            ],
          ),
        ),
      ),
    );

    final bytes = await doc.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/reports/report_${report.id}.pdf');
    await file.parent.create(recursive: true);
    await file.writeAsBytes(bytes);

    return file.path;
  }

  // ── Private helpers ──────────────────────────────────────────────────────────

  pw.Widget _metaRow(String label, String value) => pw.Padding(
        padding: const pw.EdgeInsets.only(bottom: 6),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            pw.Text(
              value,
              style: const pw.TextStyle(fontSize: 12),
              textDirection: pw.TextDirection.rtl,
            ),
            pw.Text(
              ' :$label',
              style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
              ),
              textDirection: pw.TextDirection.rtl,
            ),
          ],
        ),
      );

  String _formatDate(DateTime date) =>
      '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';

  String _translateStatus(String status) {
    switch (status) {
      case 'approved':
        return 'معتمد';
      case 'pending':
        return 'قيد المراجعة';
      case 'rejected':
        return 'مرفوض';
      default:
        return status;
    }
  }
}

/// Singleton provider — inject this wherever PDF generation is needed.
final reportPdfServiceProvider = Provider<ReportPdfService>(
  (ref) => ReportPdfService(),
);
