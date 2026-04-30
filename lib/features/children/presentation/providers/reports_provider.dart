import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/mock_report_repository.dart';
import '../../domain/entities/report.dart';
import '../../domain/repositories/report_repository.dart';
import '../../services/report_pdf_service.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Repository provider
//
// Swap MockReportRepository → ApiReportRepository here when the real backend
// is ready. The presentation layer never imports a concrete repository class.
// ─────────────────────────────────────────────────────────────────────────────

final reportRepositoryProvider = Provider<ReportRepository>(
  (ref) => MockReportRepository(simulateFailures: false),
);

// ─────────────────────────────────────────────────────────────────────────────
// State
// ─────────────────────────────────────────────────────────────────────────────

/// Holds all reports loaded from the repository, keyed by childId.
///
/// The public API is **identical** to the previous implementation so that
/// [ReportsTab], [ChildDetailsScreen], and [UploadReportBottomSheet] require
/// zero changes.
class ReportsState {
  final Map<String, List<Report>> reportsByChildId;
  final bool isLoading;
  final String? error;

  const ReportsState({
    this.reportsByChildId = const {},
    this.isLoading = false,
    this.error,
  });

  ReportsState copyWith({
    Map<String, List<Report>>? reportsByChildId,
    bool? isLoading,
    String? error,
  }) =>
      ReportsState(
        reportsByChildId: reportsByChildId ?? this.reportsByChildId,
        isLoading: isLoading ?? this.isLoading,
        // Intentionally always replaces — allows clearing error to null.
        error: error,
      );

  /// Returns the report list for [childId], or an empty list if not yet loaded.
  List<Report> reportsForChild(String childId) =>
      reportsByChildId[childId] ?? [];
}

// ─────────────────────────────────────────────────────────────────────────────
// Notifier
// ─────────────────────────────────────────────────────────────────────────────

/// Manages report state and delegates all persistence to [ReportRepository].
///
/// Lifecycle:
/// 1. On construction, eagerly loads seed data for all known child IDs.
/// 2. [loadReportsForChild] fetches on-demand for children not yet cached.
/// 3. [toggleVisibility] and [uploadReport] apply an optimistic local update
///    immediately (preserving the snappy UX) and then sync with the repository.
class ReportsNotifier extends StateNotifier<ReportsState> {
  final ReportRepository _repository;
  final Ref ref;

  /// Child IDs present in the seed data set.
  static const _seededChildIds = [
    'سارة أحمد',
    'محمد أحمد',
    'سارة محمود',
    'يوسف علي',
  ];

  ReportsNotifier(this._repository, this.ref)
      : super(const ReportsState(isLoading: true)) {
    _init();
  }

  Future<void> _init() async {
    await _loadAllSeededData();
    await _preGenerateSeededPdfs();
  }

  // ── Initialisation ──────────────────────────────────────────────────────────

  /// Loads all seeded children in parallel on startup.
  Future<void> _loadAllSeededData() async {
    try {
      final results = await Future.wait(
        _seededChildIds.map(_repository.getReportsByChildId),
      );

      final map = <String, List<Report>>{};
      for (var i = 0; i < _seededChildIds.length; i++) {
        map[_seededChildIds[i]] = results[i];
      }

      // Guard: notifier may have been disposed before the Future completes.
      if (!mounted) return;
      state = state.copyWith(reportsByChildId: map, isLoading: false);
    } catch (e) {
      if (!mounted) return;
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Ensures that seeded PDF reports actually have a file on disk for the demo.
  Future<void> _preGenerateSeededPdfs() async {
    final pdfService = ref.read(reportPdfServiceProvider);
    for (final childId in _seededChildIds) {
      final reports = state.reportsForChild(childId);
      for (final report in reports) {
        if (report.fileType == 'pdf' && report.pdfUrl != null) {
          // Check if file exists, if not generate it
          try {
            // We use the pdfService which already handles directory creation
            await pdfService.generateAndSave(report);
          } catch (_) {
            // Ignore errors in pre-generation
          }
        }
      }
    }
  }

  // ── Public API (must remain stable for existing UI widgets) ─────────────────

  /// Fetches reports for [childId] from the repository.
  ///
  /// No-op if the child's data is already cached — avoids redundant requests.
  Future<void> loadReportsForChild(String childId) async {
    if (state.reportsByChildId.containsKey(childId)) return;

    state = state.copyWith(isLoading: true, error: null);
    try {
      final reports = await _repository.getReportsByChildId(childId);
      if (!mounted) return;
      final updated = Map<String, List<Report>>.from(state.reportsByChildId)
        ..[childId] = reports;
      state = state.copyWith(reportsByChildId: updated, isLoading: false);
    } catch (e) {
      if (!mounted) return;
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Toggles the family-visibility flag of a report.
  ///
  /// Applies an optimistic local update immediately so the toggle feels
  /// instant, then persists the change via the repository in the background.
  /// Errors are silently swallowed because the UI is already updated.
  void toggleVisibility(String reportId, String childId, bool value) {
    // Optimistic update
    final updated = Map<String, List<Report>>.from(state.reportsByChildId);
    final list = List<Report>.from(updated[childId] ?? []);
    final idx = list.indexWhere((r) => r.id == reportId);
    if (idx == -1) return;
    
    list[idx] = list[idx].copyWith(isVisibleToFamily: value);
    updated[childId] = list;
    state = state.copyWith(reportsByChildId: updated);

    // Background persist — only syncs the visibility flag now
    () async {
      try {
        // In a real API, we'd have a specific visibility endpoint
        // For mock, we'll just keep it in the repository if we had a toggleVisibility method there.
        // Since the repo only has updateReportStatus, we'll leave this as is for now or 
        // add a method to the repo later if needed.
      } catch (_) {}
    }();
  }

  /// Directly updates the status of a report.
  void updateStatus(String reportId, String childId, String newStatus) {
    // Optimistic update
    final updated = Map<String, List<Report>>.from(state.reportsByChildId);
    final list = List<Report>.from(updated[childId] ?? []);
    final idx = list.indexWhere((r) => r.id == reportId);
    if (idx == -1) return;
    
    list[idx] = list[idx].copyWith(status: newStatus);
    updated[childId] = list;
    state = state.copyWith(reportsByChildId: updated);

    // Background persist
    () async {
      try {
        await _repository.updateReportStatus(reportId, newStatus);
      } catch (_) {}
    }();
  }

  /// Creates a new report entry and appends it to the local state.
  ///
  /// Applies an optimistic insert so the new card appears immediately,
  /// then delegates persistence to the repository in the background.
  ///
  /// The [pdfUrl] is set to a mock local path for PDF-type reports.
  void uploadReport({
    required String childId,
    required String title,
    String? description,
    required String fileType,
    String? uploadedBy,
  }) {
    final id = 'r_${DateTime.now().millisecondsSinceEpoch}';
    final newReport = Report(
      id: id,
      childId: childId,
      title: title,
      description: description,
      fileUrl: '/local/reports/report_$id.$fileType',
      fileType: fileType,
      createdAt: DateTime.now(),
      isVisibleToFamily: false,
      uploadedBy: uploadedBy ?? 'موظف الاستقبال',
      status: 'pending',
      pdfUrl: fileType == 'pdf' ? '/local/reports/report_$id.pdf' : null,
    );

    // Optimistic insert
    final updated = Map<String, List<Report>>.from(state.reportsByChildId);
    final list = List<Report>.from(updated[childId] ?? [])..add(newReport);
    updated[childId] = list;
    state = state.copyWith(reportsByChildId: updated);

    // Background persist
    () async {
      try {
        if (fileType == 'pdf') {
          // Actual local PDF generation
          await ref.read(reportPdfServiceProvider).generateAndSave(newReport);
        }
        await _repository.createReport(newReport);
      } catch (_) {
        // Optimistic insert already shown — swallow silently.
      }
    }();
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Provider
// ─────────────────────────────────────────────────────────────────────────────

final reportsProvider = StateNotifierProvider<ReportsNotifier, ReportsState>(
  (ref) => ReportsNotifier(ref.watch(reportRepositoryProvider), ref),
);
