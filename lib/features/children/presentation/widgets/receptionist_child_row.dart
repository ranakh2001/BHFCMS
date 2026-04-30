import 'package:flutter/material.dart';
import '../../../../config/routes.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import 'upload_report_bottom_sheet.dart';

class ReceptionistChildRow extends StatelessWidget {
  final String name;
  final bool isActive;
  final List<String> reports;

  const ReceptionistChildRow({
    super.key,
    required this.name,
    required this.isActive,
    required this.reports,
  });

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(bottom: res.scaleHeight(12)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
        border: Border.all(
          color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          shape: const RoundedRectangleBorder(side: BorderSide.none),
          tilePadding: EdgeInsets.symmetric(
            horizontal: res.scaleSpacing(AppSpacing.p16),
            vertical: res.scaleHeight(4),
          ),
          leading: Container(
            padding: EdgeInsets.symmetric(
              horizontal: res.scaleSpacing(10),
              vertical: res.scaleHeight(4),
            ),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(res.scaleRadius(10)),
            ),
            child: Text(
              l10n.activeStatus,
              style: TextStyle(
                color: AppColors.success,
                fontSize: res.scaleText(12),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            name,
            style: TextStyle(
              fontSize: res.scaleText(16),
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                res.scaleSpacing(AppSpacing.p16),
                0,
                res.scaleSpacing(AppSpacing.p16),
                res.scaleHeight(16),
              ),
              child: Column(
                children: [
                  ...reports.map((report) => _ReportItem(
                    res: res,
                    label: report,
                    l10n: l10n,
                    isDark: isDark,
                  )),
                  SizedBox(height: res.scaleHeight(AppSpacing.p12)),
                  // Start Case Study Form button
                  SizedBox(
                    width: double.infinity,
                    height: res.scaleHeight(48),
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed(AppRoutes.caseStudyIntro),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              res.scaleRadius(AppSpacing.radiusXl)),
                        ),
                      ),
                      child: Text(
                        l10n.fillCaseStudyForm,
                        style: TextStyle(
                          fontSize: res.scaleText(15),
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                  // Upload Report button
                  SizedBox(
                    width: double.infinity,
                    height: res.scaleHeight(48),
                    child: OutlinedButton.icon(
                      onPressed: () => UploadReportBottomSheet.show(
                        context,
                        childId: name,
                        uploadedBy: l10n.receptionistRole,
                      ),
                      icon: Icon(
                        Icons.upload_file_rounded,
                        size: res.scaleText(18),
                        color: AppColors.primary,
                      ),
                      label: Text(
                        l10n.uploadReport,
                        style: TextStyle(
                          fontSize: res.scaleText(15),
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.primary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              res.scaleRadius(AppSpacing.radiusXl)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReportItem extends StatelessWidget {
  final ResponsiveHelper res;
  final String label;
  final AppLocalizations l10n;
  final bool isDark;

  const _ReportItem({
    required this.res,
    required this.label,
    required this.l10n,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: res.scaleHeight(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: res.scaleText(14),
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white70 : AppColors.textPrimary,
            ),
          ),
          SizedBox(
            height: res.scaleHeight(32),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.print_rounded, size: res.scaleText(14)),
              label: Text(
                l10n.printReport,
                style: TextStyle(fontSize: res.scaleText(12)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(12)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(res.scaleRadius(8)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
