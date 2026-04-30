import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../providers/reports_provider.dart';

class UploadReportBottomSheet extends ConsumerStatefulWidget {
  final String childId;
  final String? uploadedBy;

  const UploadReportBottomSheet({
    super.key,
    required this.childId,
    this.uploadedBy,
  });

  static Future<void> show(
    BuildContext context, {
    required String childId,
    String? uploadedBy,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      builder: (_) => UploadReportBottomSheet(
        childId: childId,
        uploadedBy: uploadedBy,
      ),
    );
  }

  @override
  ConsumerState<UploadReportBottomSheet> createState() =>
      _UploadReportBottomSheetState();
}

class _UploadReportBottomSheetState
    extends ConsumerState<UploadReportBottomSheet> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _selectedFileType; // 'pdf' or 'image'
  bool _fileSelected = false;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _pickFile(String type) {
    setState(() {
      _selectedFileType = type;
      _fileSelected = true;
    });
  }

  void _submit(AppLocalizations l10n) {
    if (!_formKey.currentState!.validate()) return;
    if (!_fileSelected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.noFileSelected),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    // Simulate async upload
    Future.delayed(const Duration(milliseconds: 600), () {
      if (!mounted) return;
      ref.read(reportsProvider.notifier).uploadReport(
            childId: widget.childId,
            title: _titleController.text.trim(),
            description: _descController.text.trim().isEmpty
                ? null
                : _descController.text.trim(),
            fileType: _selectedFileType ?? 'pdf',
            uploadedBy: widget.uploadedBy,
          );
      setState(() => _isSubmitting = false);
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.saveSuccess),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.success,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? AppColors.surfaceDark : Colors.white;

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(res.scaleRadius(AppSpacing.radiusXxl)),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Column(
            children: [
              // Drag handle
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: res.scaleHeight(12)),
                  width: res.scaleWidth(40),
                  height: res.scaleHeight(4),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // Header
              Padding(
                padding: EdgeInsets.fromLTRB(
                  res.scaleSpacing(AppSpacing.p16),
                  res.scaleHeight(AppSpacing.p12),
                  res.scaleSpacing(AppSpacing.p16),
                  res.scaleHeight(AppSpacing.p12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.close_rounded,
                        color: AppColors.textSecondary,
                        size: res.scaleText(22),
                      ),
                    ),
                    Text(
                      l10n.uploadReport,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: res.scaleText(17),
                        color: isDark ? Colors.white : AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(width: res.scaleWidth(22)),
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: isDark ? Colors.grey[700] : Colors.grey[200],
              ),

              // Form body
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.fromLTRB(
                    res.scaleSpacing(AppSpacing.p16),
                    res.scaleHeight(AppSpacing.p16),
                    res.scaleSpacing(AppSpacing.p16),
                    res.scaleHeight(AppSpacing.p16),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Report Title
                        _fieldLabel(l10n.reportTitleLabel, res, isDark),
                        SizedBox(height: res.scaleHeight(8)),
                        _buildTextField(
                          controller: _titleController,
                          hint: l10n.reportTitleHint,
                          res: res,
                          isDark: isDark,
                          validator: (v) =>
                              (v == null || v.trim().isEmpty)
                                  ? l10n.fieldRequired
                                  : null,
                        ),
                        SizedBox(height: res.scaleHeight(AppSpacing.p16)),

                        // Description
                        _fieldLabel(l10n.reportDescriptionLabel, res, isDark),
                        SizedBox(height: res.scaleHeight(8)),
                        _buildTextField(
                          controller: _descController,
                          hint: l10n.reportDescriptionHint,
                          res: res,
                          isDark: isDark,
                          maxLines: 3,
                        ),
                        SizedBox(height: res.scaleHeight(AppSpacing.p16)),

                        // File Picker
                        _fieldLabel(l10n.selectFile, res, isDark),
                        SizedBox(height: res.scaleHeight(8)),
                        Row(
                          children: [
                            Expanded(
                              child: _FileTypeButton(
                                label: l10n.pdfType,
                                icon: Icons.picture_as_pdf_rounded,
                                color: AppColors.primary,
                                isSelected: _selectedFileType == 'pdf',
                                res: res,
                                isDark: isDark,
                                onTap: () => _pickFile('pdf'),
                              ),
                            ),
                            SizedBox(width: res.scaleWidth(12)),
                            Expanded(
                              child: _FileTypeButton(
                                label: l10n.imageType,
                                icon: Icons.image_rounded,
                                color: AppColors.info,
                                isSelected: _selectedFileType == 'image',
                                res: res,
                                isDark: isDark,
                                onTap: () => _pickFile('image'),
                              ),
                            ),
                          ],
                        ),
                        if (_fileSelected) ...[
                          SizedBox(height: res.scaleHeight(8)),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle_rounded,
                                color: AppColors.success,
                                size: res.scaleText(16),
                              ),
                              SizedBox(width: res.scaleWidth(6)),
                              Text(
                                l10n.fileSelected,
                                style: TextStyle(
                                  fontSize: res.scaleText(13),
                                  color: AppColors.success,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                        SizedBox(height: res.scaleHeight(AppSpacing.p24)),

                        // Submit button
                        SizedBox(
                          width: double.infinity,
                          height: res.scaleHeight(52),
                          child: ElevatedButton(
                            onPressed:
                                _isSubmitting ? null : () => _submit(l10n),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              disabledBackgroundColor:
                                  AppColors.primary.withValues(alpha: 0.6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  res.scaleRadius(AppSpacing.radiusMd),
                                ),
                              ),
                              elevation: 0,
                            ),
                            child: _isSubmitting
                                ? SizedBox(
                                    width: res.scaleWidth(22),
                                    height: res.scaleWidth(22),
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    l10n.uploadReport,
                                    style: TextStyle(
                                      fontSize: res.scaleText(16),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                        SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _fieldLabel(String text, ResponsiveHelper res, bool isDark) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: res.scaleText(14),
        color: isDark ? Colors.white : AppColors.textPrimary,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required ResponsiveHelper res,
    required bool isDark,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        borderRadius:
            BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
        ),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: validator,
        style: TextStyle(
          fontSize: res.scaleText(14),
          color: isDark ? Colors.white : AppColors.textPrimary,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p12)),
          hintText: hint,
          hintStyle: TextStyle(
            color: AppColors.textSecondary,
            fontSize: res.scaleText(14),
          ),
        ),
      ),
    );
  }
}

class _FileTypeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final ResponsiveHelper res;
  final bool isDark;
  final VoidCallback onTap;

  const _FileTypeButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.res,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(
          vertical: res.scaleHeight(14),
          horizontal: res.scaleSpacing(12),
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? color.withValues(alpha: 0.1)
              : (isDark ? AppColors.backgroundDark : AppColors.backgroundLight),
          borderRadius:
              BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
          border: Border.all(
            color: isSelected ? color : (isDark ? Colors.grey[700]! : Colors.grey[300]!),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? color : AppColors.textSecondary,
              size: res.scaleText(20),
            ),
            SizedBox(width: res.scaleWidth(8)),
            Text(
              label,
              style: TextStyle(
                fontSize: res.scaleText(14),
                fontWeight:
                    isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? color : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
