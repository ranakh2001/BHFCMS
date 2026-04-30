import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../models/chat_message.dart';

class FileMessageWidget extends StatelessWidget {
  final ChatMessage message;
  final bool isMe;

  const FileMessageWidget({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final iconColor = isMe ? Colors.white70 : AppColors.primary;
    final textColor = isMe ? Colors.white : AppColors.textPrimary;
    final subColor = isMe ? Colors.white70 : AppColors.textSecondary;
    final dividerColor = isMe
        ? Colors.white.withValues(alpha: 0.2)
        : Colors.black.withValues(alpha: 0.08);

    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: res.scaleWidth(40),
              height: res.scaleWidth(40),
              decoration: BoxDecoration(
                color: isMe
                    ? Colors.white.withValues(alpha: 0.15)
                    : AppColors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(res.scaleRadius(8)),
              ),
              child: Icon(
                _fileIcon(message.fileName),
                color: iconColor,
                size: res.scaleWidth(22),
              ),
            ),
            SizedBox(width: res.scaleSpacing(10)),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message.fileName ?? 'ملف',
                    style: TextStyle(
                      fontSize: res.scaleText(13),
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: res.scaleSpacing(2)),
                  Text(
                    _fileExtLabel(message.fileName),
                    style: TextStyle(
                      fontSize: res.scaleText(11),
                      color: subColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: res.scaleSpacing(8)),
        Divider(height: 1, color: dividerColor),
        SizedBox(height: res.scaleSpacing(6)),
        GestureDetector(
          onTap: () => _openFile(context),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.download_rounded,
                size: res.scaleWidth(14),
                color: iconColor,
              ),
              SizedBox(width: res.scaleSpacing(4)),
              Text(
                'فتح الملف',
                style: TextStyle(
                  fontSize: res.scaleText(12),
                  fontWeight: FontWeight.w600,
                  color: isMe ? Colors.white : AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        if (message.text.isNotEmpty) ...[
          SizedBox(height: res.scaleSpacing(6)),
          Text(
            message.text,
            style: TextStyle(
              fontSize: res.scaleText(14),
              color: textColor,
              height: 1.4,
            ),
            textDirection: TextDirection.rtl,
          ),
        ],
      ],
    );
  }

  void _openFile(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('فتح: ${message.fileName ?? 'ملف'}'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  IconData _fileIcon(String? name) {
    if (name == null) return Icons.insert_drive_file;
    switch (name.split('.').last.toLowerCase()) {
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

  String _fileExtLabel(String? name) {
    if (name == null) return 'ملف';
    switch (name.split('.').last.toLowerCase()) {
      case 'pdf':
        return 'PDF';
      case 'doc':
      case 'docx':
        return 'Word';
      case 'xls':
      case 'xlsx':
        return 'Excel';
      case 'ppt':
      case 'pptx':
        return 'PowerPoint';
      case 'txt':
        return 'نص';
      default:
        return name.split('.').last.toUpperCase();
    }
  }
}
