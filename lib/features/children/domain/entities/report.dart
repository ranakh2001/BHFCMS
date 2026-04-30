/// Domain entity representing a child's report.
///
/// [status] lifecycle values: `'approved'` | `'pending'` | `'rejected'`
/// [pdfUrl]  local path stored as `/local/reports/report_<id>.pdf` for mock;
///           will hold a remote URL when the real backend is connected.
class Report {
  final String id;
  final String childId;
  final String title;
  final String? description;

  /// File URL — mock path or future remote URL.
  final String fileUrl;

  /// `'pdf'` or `'image'`
  final String fileType;

  final DateTime createdAt;
  final bool isVisibleToFamily;
  final String? uploadedBy;

  /// Report approval status: `'approved'` | `'pending'` | `'rejected'`
  final String status;

  /// Local PDF path (e.g. `/local/reports/report_<id>.pdf`).
  /// Null for image-type reports.
  final String? pdfUrl;

  const Report({
    required this.id,
    required this.childId,
    required this.title,
    this.description,
    required this.fileUrl,
    required this.fileType,
    required this.createdAt,
    this.isVisibleToFamily = false,
    this.uploadedBy,
    this.status = 'approved',
    this.pdfUrl,
  });

  Report copyWith({
    String? id,
    String? childId,
    String? title,
    String? description,
    String? fileUrl,
    String? fileType,
    DateTime? createdAt,
    bool? isVisibleToFamily,
    String? uploadedBy,
    String? status,
    String? pdfUrl,
  }) {
    return Report(
      id: id ?? this.id,
      childId: childId ?? this.childId,
      title: title ?? this.title,
      description: description ?? this.description,
      fileUrl: fileUrl ?? this.fileUrl,
      fileType: fileType ?? this.fileType,
      createdAt: createdAt ?? this.createdAt,
      isVisibleToFamily: isVisibleToFamily ?? this.isVisibleToFamily,
      uploadedBy: uploadedBy ?? this.uploadedBy,
      status: status ?? this.status,
      pdfUrl: pdfUrl ?? this.pdfUrl,
    );
  }
}
