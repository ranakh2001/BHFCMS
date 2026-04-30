import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../domain/entities/report.dart';
import '../providers/reports_provider.dart';

class ReportsTab extends ConsumerWidget {
  final bool isDark;
  final ResponsiveHelper res;
  final String childId;
  final bool isSupervisor;
  final bool isFamily;

  const ReportsTab({
    super.key,
    required this.isDark,
    required this.res,
    required this.childId,
    this.isSupervisor = false,
    this.isFamily = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final reportsState = ref.watch(reportsProvider);
    final allReports = reportsState.reportsForChild(childId);

    final reports = isFamily
        ? allReports.where((r) => r.isVisibleToFamily).toList()
        : allReports;

    if (reports.isEmpty) {
      return _buildEmptyState(l10n, isFamily);
    }

    return ListView.separated(
      padding: EdgeInsets.fromLTRB(
        res.scaleSpacing(AppSpacing.p16),
        res.scaleHeight(AppSpacing.p12),
        res.scaleSpacing(AppSpacing.p16),
        res.scaleHeight(80),
      ),
      itemCount: reports.length,
      separatorBuilder: (_, __) => SizedBox(height: res.scaleHeight(12)),
      itemBuilder: (context, index) {
        final report = reports[index];
        return _ReportCard(
          report: report,
          isDark: isDark,
          res: res,
          childId: childId,
          isSupervisor: isSupervisor,
          isFamily: isFamily,
        );
      },
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n, bool family) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.description_outlined,
            size: res.scaleText(56),
            color: isDark ? Colors.grey[600] : Colors.grey[300],
          ),
          SizedBox(height: res.scaleHeight(16)),
          Text(
            family ? l10n.noVisibleReports : l10n.noReports,
            style: TextStyle(
              fontSize: res.scaleText(15),
              color: isDark ? Colors.white54 : AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ReportCard extends ConsumerWidget {
  final Report report;
  final bool isDark;
  final ResponsiveHelper res;
  final String childId;
  final bool isSupervisor;
  final bool isFamily;

  const _ReportCard({
    required this.report,
    required this.isDark,
    required this.res,
    required this.childId,
    required this.isSupervisor,
    required this.isFamily,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isPdf = report.fileType == 'pdf';
    final cardColor = isDark ? AppColors.surfaceDark : Colors.white;

    return InkWell(
      onTap: isSupervisor
          ? () => _ReportManagementSheet.show(context, ref, report.id, childId)
          : null,
      borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
      child: Container(
        padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
          border: Border.all(
            color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.15 : 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row: Title + Type/Status
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    report.title,
                    style: TextStyle(
                      fontSize: res.scaleText(15),
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : AppColors.textPrimary,
                    ),
                  ),
                ),
                SizedBox(width: res.scaleWidth(12)),
                _TypeBadge(isPdf: isPdf, res: res, l10n: l10n),
                SizedBox(width: res.scaleWidth(8)),
                _StatusBadge(status: report.status, res: res, l10n: l10n),
              ],
            ),

            if (report.description != null && report.description!.isNotEmpty) ...[
              SizedBox(height: res.scaleHeight(8)),
              Text(
                report.description!,
                style: TextStyle(
                  fontSize: res.scaleText(12),
                  color: AppColors.textSecondary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],

            SizedBox(height: res.scaleHeight(AppSpacing.p12)),
            Divider(
              height: 1,
              color: isDark ? Colors.grey[700] : Colors.grey[200],
            ),
            SizedBox(height: res.scaleHeight(AppSpacing.p12)),

            // Meta row: date + uploadedBy + Action buttons (for family)
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: res.scaleText(13),
                        color: AppColors.textSecondary,
                      ),
                      SizedBox(width: res.scaleWidth(4)),
                      Text(
                        _formatDate(report.createdAt),
                        style: TextStyle(
                          fontSize: res.scaleText(12),
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isFamily) ...[
                  _ActionButton(
                    icon: Icons.visibility_outlined,
                    label: l10n.viewReport,
                    color: AppColors.info,
                    res: res,
                    onTap: () => _viewReport(context, report),
                  ),
                  SizedBox(width: res.scaleWidth(8)),
                  _ActionButton(
                    icon: Icons.download_rounded,
                    label: l10n.downloadReport,
                    color: AppColors.primary,
                    res: res,
                    onTap: () => _downloadReport(context, report, l10n),
                  ),
                ],
                if (isSupervisor)
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: res.scaleText(14),
                    color: AppColors.textSecondary.withValues(alpha: 0.5),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';
  }

  Future<void> _viewReport(BuildContext context, Report report) async {
    if (report.fileType == 'pdf' && report.pdfUrl != null) {
      final file = File(report.pdfUrl!);
      if (await file.exists()) {
        final bytes = await file.readAsBytes();
        if (!context.mounted) return;
        await Printing.layoutPdf(
          onLayout: (format) async => bytes,
          name: report.title,
        );
      } else {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('الملف غير موجود محلياً')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(report.title)),
      );
    }
  }

  Future<void> _downloadReport(BuildContext context, Report report, AppLocalizations l10n) async {
    if (report.pdfUrl != null) {
      final file = File(report.pdfUrl!);
      if (await file.exists()) {
        await Share.shareXFiles([XFile(report.pdfUrl!)], text: report.title);
      } else {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('الملف غير موجود محلياً')),
        );
      }
    }
  }
}

class _ReportManagementSheet extends ConsumerWidget {
  final String reportId;
  final String childId;

  const _ReportManagementSheet({required this.reportId, required this.childId});

  static void show(BuildContext context, WidgetRef ref, String reportId, String childId) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final sheet = _ReportManagementSheet(reportId: reportId, childId: childId);
        if (isTablet) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: sheet,
            ),
          );
        }
        return sheet;
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportsState = ref.watch(reportsProvider);
    final report = reportsState.reportsForChild(childId).firstWhere(
          (r) => r.id == reportId,
          orElse: () => reportsState.reportsForChild(childId).first, // Fallback
        );

    final l10n = AppLocalizations.of(context)!;
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? AppColors.surfaceDark : Colors.white;

    return Container(
      padding: EdgeInsets.fromLTRB(
        res.scaleSpacing(AppSpacing.p20),
        res.scaleHeight(AppSpacing.p12),
        res.scaleSpacing(AppSpacing.p20),
        res.scaleHeight(AppSpacing.p24),
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(res.scaleRadius(AppSpacing.radiusXxl)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: res.scaleHeight(16)),
              width: res.scaleWidth(40),
              height: res.scaleHeight(4),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Row(
            children: [
              Icon(Icons.settings_suggest_rounded, color: AppColors.primary, size: res.scaleText(24)),
              SizedBox(width: res.scaleWidth(12)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('إدارة التقرير', style: TextStyle(fontWeight: FontWeight.bold, fontSize: res.scaleText(18), color: isDark ? Colors.white : AppColors.textPrimary)),
                    Text(report.title, style: TextStyle(fontSize: res.scaleText(13), color: AppColors.textSecondary), maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: res.scaleHeight(24)),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                if (report.pdfUrl != null) {
                  final file = File(report.pdfUrl!);
                  if (await file.exists()) {
                    await Printing.layoutPdf(onLayout: (f) async => await file.readAsBytes(), name: report.title);
                  }
                }
              },
              icon: const Icon(Icons.picture_as_pdf_rounded),
              label: Text(l10n.viewReport),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.info.withValues(alpha: 0.1),
                foregroundColor: AppColors.info,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: res.scaleHeight(14)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radiusMd)),
              ),
            ),
          ),
          SizedBox(height: res.scaleHeight(24)),
          Text('حالة التقرير', style: TextStyle(fontWeight: FontWeight.bold, fontSize: res.scaleText(14), color: isDark ? Colors.white : AppColors.textPrimary)),
          SizedBox(height: res.scaleHeight(12)),
          _StatusOption(label: 'معتمد', status: 'approved', currentStatus: report.status, color: AppColors.success, onTap: () => ref.read(reportsProvider.notifier).updateStatus(report.id, childId, 'approved')),
          _StatusOption(label: 'قيد المراجعة', status: 'pending', currentStatus: report.status, color: AppColors.warning, onTap: () => ref.read(reportsProvider.notifier).updateStatus(report.id, childId, 'pending')),
          _StatusOption(label: 'مرفوض', status: 'rejected', currentStatus: report.status, color: AppColors.error, onTap: () => ref.read(reportsProvider.notifier).updateStatus(report.id, childId, 'rejected')),
          SizedBox(height: res.scaleHeight(24)),
          Container(
            padding: EdgeInsets.all(res.scaleSpacing(12)),
            decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(AppSpacing.radiusMd)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.visibleToFamily, style: TextStyle(fontWeight: FontWeight.bold, fontSize: res.scaleText(14), color: isDark ? Colors.white : AppColors.textPrimary)),
                      const Text('عند التفعيل، سيتمكن الأهل من رؤية هذا التقرير', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
                Switch.adaptive(
                  value: report.isVisibleToFamily,
                  activeThumbColor: AppColors.primary,
                  activeTrackColor: AppColors.primary.withValues(alpha: 0.5),
                  onChanged: (val) => ref.read(reportsProvider.notifier).toggleVisibility(report.id, childId, val),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusOption extends StatelessWidget {
  final String label;
  final String status;
  final String currentStatus;
  final Color color;
  final VoidCallback onTap;

  const _StatusOption({required this.label, required this.status, required this.currentStatus, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final isSelected = status == currentStatus;
    return Padding(
      padding: EdgeInsets.only(bottom: res.scaleHeight(8)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(16), vertical: res.scaleHeight(12)),
          decoration: BoxDecoration(
            color: isSelected ? color.withValues(alpha: 0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            border: Border.all(color: isSelected ? color : Colors.grey[200]!, width: isSelected ? 1.5 : 1),
          ),
          child: Row(
            children: [
              Icon(isSelected ? Icons.check_circle_rounded : Icons.circle_outlined, color: isSelected ? color : Colors.grey[400], size: res.scaleText(20)),
              SizedBox(width: res.scaleWidth(12)),
              Text(label, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, color: isSelected ? color : AppColors.textSecondary)),
            ],
          ),
        ),
      ),
    );
  }
}

class _TypeBadge extends StatelessWidget {
  final bool isPdf;
  final ResponsiveHelper res;
  final AppLocalizations l10n;
  const _TypeBadge({required this.isPdf, required this.res, required this.l10n});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(8), vertical: res.scaleHeight(3)),
      decoration: BoxDecoration(color: (isPdf ? AppColors.primary : AppColors.info).withValues(alpha: 0.12), borderRadius: BorderRadius.circular(20)),
      child: Text(isPdf ? l10n.pdfType : l10n.imageType, style: TextStyle(color: isPdf ? AppColors.primary : AppColors.info, fontSize: res.scaleText(11), fontWeight: FontWeight.w600)),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  final ResponsiveHelper res;
  final AppLocalizations l10n;
  const _StatusBadge({required this.status, required this.res, required this.l10n});
  @override
  Widget build(BuildContext context) {
    Color color;
    String label;
    switch (status) {
      case 'approved': color = AppColors.success; label = 'معتمد'; break;
      case 'rejected': color = AppColors.error; label = 'مرفوض'; break;
      case 'pending': default: color = AppColors.warning; label = 'قيد المراجعة'; break;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(8), vertical: res.scaleHeight(3)),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(20)),
      child: Text(label, style: TextStyle(color: color, fontSize: res.scaleText(11), fontWeight: FontWeight.w600)),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final ResponsiveHelper res;
  final VoidCallback onTap;
  const _ActionButton({required this.icon, required this.label, required this.color, required this.res, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: res.scaleHeight(34),
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: res.scaleText(14)),
        label: Text(label, style: TextStyle(fontSize: res.scaleText(12))),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(10)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd))),
        ),
      ),
    );
  }
}
