import '../entities/report.dart';

/// Abstract contract for the report data layer.
///
/// The UI and business logic depend **only** on this interface.
/// Swap [MockReportRepository] → [ApiReportRepository] without
/// touching a single line of presentation code.
abstract class ReportRepository {
  /// Returns all reports belonging to the given [childId].
  Future<List<Report>> getReportsByChildId(String childId);

  /// Persists a new [report] and returns the saved instance.
  Future<Report> createReport(Report report);

  /// Updates the [status] of the report identified by [reportId].
  /// Valid values: `'approved'` | `'pending'` | `'rejected'`
  Future<void> updateReportStatus(String reportId, String status);

  /// Returns a single report by its [reportId].
  /// Throws if not found.
  Future<Report> getReportById(String reportId);
}
