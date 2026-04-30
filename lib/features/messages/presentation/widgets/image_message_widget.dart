import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../models/chat_message.dart';

class ImageMessageWidget extends StatelessWidget {
  final ChatMessage message;
  final bool isMe;

  const ImageMessageWidget({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final maxW = res.screenWidth * 0.65;

    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(res.scaleRadius(4)),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxW, maxHeight: maxW),
            child: _buildImage(res),
          ),
        ),
        if (message.text.isNotEmpty) ...[
          SizedBox(height: res.scaleSpacing(6)),
          Text(
            message.text,
            style: TextStyle(
              fontSize: res.scaleText(14),
              color: isMe ? Colors.white : AppColors.textPrimary,
              height: 1.4,
            ),
            textDirection: TextDirection.rtl,
          ),
        ],
      ],
    );
  }

  Widget _buildImage(ResponsiveHelper res) {
    if (message.localPath != null) {
      return Image.file(
        File(message.localPath!),
        fit: BoxFit.cover,
        errorBuilder: _errorWidget,
      );
    }
    if (message.fileUrl != null) {
      return Image.network(
        message.fileUrl!,
        fit: BoxFit.cover,
        loadingBuilder: (_, child, progress) {
          if (progress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: progress.expectedTotalBytes != null
                  ? progress.cumulativeBytesLoaded /
                      progress.expectedTotalBytes!
                  : null,
              color: AppColors.primary,
              strokeWidth: 2,
            ),
          );
        },
        errorBuilder: _errorWidget,
      );
    }
    return _errorWidget(null, null, null);
  }

  Widget _errorWidget(BuildContext? _, Object? __, StackTrace? ___) {
    return Container(
      width: 120,
      height: 120,
      color: Colors.black12,
      child: const Icon(Icons.broken_image, color: Colors.grey),
    );
  }
}
