import 'dart:math';

import '../../domain/entities/report.dart';
import '../../domain/repositories/report_repository.dart';

/// In-memory mock implementation of [ReportRepository].
///
/// Simulates real network behaviour:
/// - Artificial 500–1000 ms latency on every operation.
/// - Optional random failure (~10 %) via [simulateFailures].
///
/// Pre-seeded with:
/// - **سارة أحمد** — 1 approved, 1 pending, 1 rejected  (default demo child)
/// - **محمد أحمد** — approved + pending + image report
/// - **سارة محمود** — 1 approved
/// - **يوسف علي**  — 1 approved
///
/// Replace this class with `ApiReportRepository` (pointing at the real
/// backend) without touching the presentation layer.
class MockReportRepository implements ReportRepository {
  /// When `true`, ~10 % of requests throw to exercise error-state UIs.
  final bool simulateFailures;

  MockReportRepository({this.simulateFailures = false});

  // ── In-memory store ─────────────────────────────────────────────────────────

  final List<Report> _store = [
    // ── سارة أحمد — three status variants for the default demo child ─────────
    Report(
      id: 'r_seed_01',
      childId: 'سارة أحمد',
      title: 'تقرير التقييم الأولي',
      description: 'تقرير شامل للتقييم الأولي للطفلة سارة — مرحلة التدخل المبكر.',
      fileUrl: '/local/reports/report_r_seed_01.pdf',
      fileType: 'pdf',
      createdAt: DateTime(2024, 1, 10),
      isVisibleToFamily: true,
      uploadedBy: 'موظف الاستقبال',
      status: 'approved',
      pdfUrl: '/local/reports/report_r_seed_01.pdf',
    ),
    Report(
      id: 'r_seed_02',
      childId: 'سارة أحمد',
      title: 'تقرير المتابعة الشهرية — مارس',
      description: 'متابعة شهرية لتقدم الطفلة في برنامج التدخل المبكر.',
      fileUrl: '/local/reports/report_r_seed_02.pdf',
      fileType: 'pdf',
      createdAt: DateTime(2024, 3, 15),
      isVisibleToFamily: false,
      uploadedBy: 'المعالجة الوظيفية',
      status: 'pending',
      pdfUrl: '/local/reports/report_r_seed_02.pdf',
    ),
    Report(
      id: 'r_seed_03',
      childId: 'سارة أحمد',
      title: 'تقرير الاختبار السلوكي',
      description: 'نتائج تقييم السلوك التكيفي والمهارات الاجتماعية.',
      fileUrl: '/local/reports/report_r_seed_03.pdf',
      fileType: 'pdf',
      createdAt: DateTime(2024, 4, 20),
      isVisibleToFamily: false,
      uploadedBy: 'أخصائي النفس',
      status: 'rejected',
      pdfUrl: '/local/reports/report_r_seed_03.pdf',
    ),

    // ── محمد أحمد ────────────────────────────────────────────────────────────
    Report(
      id: 'r_seed_04',
      childId: 'محمد أحمد',
      title: 'تقرير التقييم الأولي',
      description: 'تقرير شامل للتقييم الأولي للطفل.',
      fileUrl: '/local/reports/report_r_seed_04.pdf',
      fileType: 'pdf',
      createdAt: DateTime(2024, 1, 15),
      isVisibleToFamily: true,
      uploadedBy: 'موظف الاستقبال',
      status: 'approved',
      pdfUrl: '/local/reports/report_r_seed_04.pdf',
    ),
    Report(
      id: 'r_seed_05',
      childId: 'محمد أحمد',
      title: 'تقرير التقدم الشهري — يناير',
      fileUrl: '/local/reports/report_r_seed_05.pdf',
      fileType: 'pdf',
      createdAt: DateTime(2024, 2, 10),
      isVisibleToFamily: false,
      uploadedBy: 'موظف الاستقبال',
      status: 'pending',
      pdfUrl: '/local/reports/report_r_seed_05.pdf',
    ),
    Report(
      id: 'r_seed_06',
      childId: 'محمد أحمد',
      title: 'تقرير الاختبار السلوكي',
      description: 'نتائج الاختبار السلوكي للفصل الدراسي الأول.',
      fileUrl: '/local/reports/report_r_seed_06.jpg',
      fileType: 'image',
      createdAt: DateTime(2024, 3, 5),
      isVisibleToFamily: true,
      uploadedBy: 'موظف الاستقبال',
      status: 'approved',
      pdfUrl: null, // image-type report has no PDF
    ),

    // ── سارة محمود ───────────────────────────────────────────────────────────
    Report(
      id: 'r_seed_07',
      childId: 'سارة محمود',
      title: 'تقرير الفحص الشامل',
      fileUrl: '/local/reports/report_r_seed_07.pdf',
      fileType: 'pdf',
      createdAt: DateTime(2024, 1, 20),
      isVisibleToFamily: true,
      uploadedBy: 'موظف الاستقبال',
      status: 'approved',
      pdfUrl: '/local/reports/report_r_seed_07.pdf',
    ),

    // ── يوسف علي ─────────────────────────────────────────────────────────────
    Report(
      id: 'r_seed_08',
      childId: 'يوسف علي',
      title: 'تقرير التطور اللغوي',
      description: 'تقرير مفصل عن التطور اللغوي.',
      fileUrl: '/local/reports/report_r_seed_08.pdf',
      fileType: 'pdf',
      createdAt: DateTime(2024, 2, 28),
      isVisibleToFamily: false,
      uploadedBy: 'موظف الاستقبال',
      status: 'approved',
      pdfUrl: '/local/reports/report_r_seed_08.pdf',
    ),
  ];

  final _random = Random();

  // ── Private helpers ──────────────────────────────────────────────────────────

  /// Simulates network latency (500–1000 ms).
  Future<void> _delay() =>
      Future.delayed(Duration(milliseconds: 500 + _random.nextInt(500)));

  /// Throws a simulated network error with ~10 % probability.
  void _maybeThrow() {
    if (simulateFailures && _random.nextDouble() < 0.1) {
      throw Exception('خطأ في الشبكة: فشل الطلب. حاول مرة أخرى.');
    }
  }

  // ── ReportRepository implementation ─────────────────────────────────────────

  @override
  Future<List<Report>> getReportsByChildId(String childId) async {
    await _delay();
    _maybeThrow();
    return _store.where((r) => r.childId == childId).toList();
  }

  @override
  Future<Report> createReport(Report report) async {
    await _delay();
    _maybeThrow();
    _store.add(report);
    return report;
  }

  @override
  Future<void> updateReportStatus(String reportId, String status) async {
    await _delay();
    _maybeThrow();
    final idx = _store.indexWhere((r) => r.id == reportId);
    if (idx == -1) throw Exception('التقرير غير موجود: $reportId');
    _store[idx] = _store[idx].copyWith(status: status);
  }

  @override
  Future<Report> getReportById(String reportId) async {
    await _delay();
    _maybeThrow();
    return _store.firstWhere(
      (r) => r.id == reportId,
      orElse: () => throw Exception('التقرير غير موجود: $reportId'),
    );
  }
}
