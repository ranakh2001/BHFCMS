import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../models/chat_message.dart';
import '../providers/attachment_provider.dart';

class AttachmentPreviewWidget extends StatelessWidget {
  final AttachmentState state;
  final VoidCallback onRemove;
  final VoidCallback onRetry;

  const AttachmentPreviewWidget({
    super.key,
    required this.state,
    required this.onRemove,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(12),
        vertical: res.scaleSpacing(6),
      ),
      padding: EdgeInsets.all(res.scaleSpacing(10)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(res.scaleRadius(12)),
        border: Border.all(
          color: state.hasError
              ? AppColors.error
              : isDark
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              _buildThumbnail(res),
              SizedBox(width: res.scaleSpacing(10)),
              Expanded(child: _buildInfo(res, isDark)),
              if (!state.isUploading)
                GestureDetector(
                  onTap: onRemove,
                  child: Icon(
                    Icons.close,
                    size: res.scaleWidth(18),
                    color: AppColors.textSecondary,
                  ),
                ),
            ],
          ),
          if (state.isUploading) ...[
            SizedBox(height: res.scaleSpacing(8)),
            ClipRRect(
              borderRadius: BorderRadius.circular(res.scaleRadius(4)),
              child: LinearProgressIndicator(
                value: state.uploadProgress,
                backgroundColor: isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.black.withValues(alpha: 0.08),
                color: AppColors.primary,
                minHeight: res.scaleHeight(4),
              ),
            ),
          ],
          if (state.hasError) ...[
            SizedBox(height: res.scaleSpacing(6)),
            Row(
              children: [
                Icon(
                  Icons.error_outline,
                  size: res.scaleWidth(14),
                  color: AppColors.error,
                ),
                SizedBox(width: res.scaleSpacing(4)),
                Text(
                  'فشل الرفع',
                  style: TextStyle(
                    fontSize: res.scaleText(11),
                    color: AppColors.error,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onRetry,
                  child: Text(
                    'إعادة المحاولة',
                    style: TextStyle(
                      fontSize: res.scaleText(11),
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildThumbnail(ResponsiveHelper res) {
    final size = res.scaleWidth(48);
    if (state.type == MessageType.image && state.localPath != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(res.scaleRadius(8)),
        child: Image.file(
          File(state.localPath!),
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _fileIconBox(size, res, Icons.image),
        ),
      );
    }
    return _fileIconBox(size, res, _fileIcon(state.fileName));
  }

  Widget _fileIconBox(double size, ResponsiveHelper res, IconData icon) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(res.scaleRadius(8)),
      ),
      child: Icon(icon, color: AppColors.primary, size: res.scaleWidth(24)),
    );
  }

  Widget _buildInfo(ResponsiveHelper res, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          state.fileName ?? 'مرفق',
          style: TextStyle(
            fontSize: res.scaleText(13),
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : AppColors.textPrimary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: res.scaleSpacing(2)),
        Text(
          state.isUploading
              ? '${(state.uploadProgress * 100).toStringAsFixed(0)}%'
              : state.hasError
                  ? 'فشل'
                  : state.type == MessageType.image
                      ? 'صورة'
                      : 'ملف',
          style: TextStyle(
            fontSize: res.scaleText(11),
            color: state.hasError ? AppColors.error : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  IconData _fileIcon(String? name) {
    if (name == null) return Icons.insert_drive_file;
    final ext = name.split('.').last.toLowerCase();
    switch (ext) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'xls':
      case 'xlsx':
        return Icons.table_chart;
      case 'ppt':
      case 'pptx':
        return Icons.slideshow;
      default:
        return Icons.insert_drive_file;
    }
  }
}
