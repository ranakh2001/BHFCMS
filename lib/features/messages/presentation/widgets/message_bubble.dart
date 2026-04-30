import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../models/chat_message.dart';
import 'file_message_widget.dart';
import 'image_message_widget.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({super.key, required this.message});

  String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final isMe = message.isFromMe;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(16),
        vertical: res.scaleSpacing(4),
      ),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: res.screenWidth * 0.72),
          child: Container(
            padding: _bubblePadding(res),
            decoration: BoxDecoration(
              color: isMe ? AppColors.primary : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(res.scaleRadius(16)),
                topRight: Radius.circular(res.scaleRadius(16)),
                bottomLeft: isMe
                    ? Radius.circular(res.scaleRadius(16))
                    : Radius.circular(res.scaleRadius(4)),
                bottomRight: isMe
                    ? Radius.circular(res.scaleRadius(4))
                    : Radius.circular(res.scaleRadius(16)),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildContent(res, isMe),
                SizedBox(height: res.scaleHeight(4)),
                _buildFooter(res, isMe),
              ],
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsets _bubblePadding(ResponsiveHelper res) {
    if (message.type == MessageType.image) {
      return EdgeInsets.all(res.scaleSpacing(4));
    }
    return EdgeInsets.symmetric(
      horizontal: res.scaleSpacing(14),
      vertical: res.scaleSpacing(10),
    );
  }

  Widget _buildContent(ResponsiveHelper res, bool isMe) {
    switch (message.type) {
      case MessageType.image:
        return ImageMessageWidget(message: message, isMe: isMe);
      case MessageType.file:
        return FileMessageWidget(message: message, isMe: isMe);
      case MessageType.text:
        return Text(
          message.text,
          style: TextStyle(
            fontSize: res.scaleText(14),
            color: isMe ? Colors.white : AppColors.textPrimary,
            height: 1.4,
          ),
          textDirection: TextDirection.rtl,
        );
    }
  }

  Widget _buildFooter(ResponsiveHelper res, bool isMe) {
    final footerPadding = message.type == MessageType.image
        ? EdgeInsets.symmetric(horizontal: res.scaleSpacing(10))
        : EdgeInsets.zero;

    return Padding(
      padding: footerPadding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isMe) ...[
            _StatusIcon(status: message.status, res: res),
            SizedBox(width: res.scaleSpacing(4)),
          ],
          Text(
            _formatTime(message.timestamp),
            style: TextStyle(
              fontSize: res.scaleText(10),
              color: isMe
                  ? Colors.white.withValues(alpha: 0.75)
                  : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusIcon extends StatelessWidget {
  final MessageStatus status;
  final ResponsiveHelper res;

  const _StatusIcon({required this.status, required this.res});

  @override
  Widget build(BuildContext context) {
    final size = res.scaleWidth(14);
    switch (status) {
      case MessageStatus.sent:
        return Icon(Icons.check, size: size, color: Colors.white70);
      case MessageStatus.delivered:
        return Icon(Icons.done_all, size: size, color: Colors.white70);
      case MessageStatus.read:
        return Icon(Icons.done_all, size: size, color: Colors.lightBlueAccent);
    }
  }
}
