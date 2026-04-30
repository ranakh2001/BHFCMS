enum MessageType { text, image, file }

enum MessageStatus { sent, delivered, read }

class ChatMessage {
  final String id;
  final String text;
  final DateTime timestamp;
  final bool isFromMe;
  final MessageStatus status;
  final MessageType type;
  final String? fileUrl;
  final String? localPath;
  final String? fileName;

  const ChatMessage({
    required this.id,
    this.text = '',
    required this.timestamp,
    required this.isFromMe,
    this.status = MessageStatus.delivered,
    this.type = MessageType.text,
    this.fileUrl,
    this.localPath,
    this.fileName,
  });

  ChatMessage copyWith({
    String? id,
    String? text,
    DateTime? timestamp,
    bool? isFromMe,
    MessageStatus? status,
    MessageType? type,
    String? fileUrl,
    String? localPath,
    String? fileName,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      text: text ?? this.text,
      timestamp: timestamp ?? this.timestamp,
      isFromMe: isFromMe ?? this.isFromMe,
      status: status ?? this.status,
      type: type ?? this.type,
      fileUrl: fileUrl ?? this.fileUrl,
      localPath: localPath ?? this.localPath,
      fileName: fileName ?? this.fileName,
    );
  }
}
