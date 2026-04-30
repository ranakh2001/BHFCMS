enum MessageStatus { sent, delivered, read }

class ChatMessage {
  final String id;
  final String text;
  final DateTime timestamp;
  final bool isFromMe;
  final MessageStatus status;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.timestamp,
    required this.isFromMe,
    this.status = MessageStatus.delivered,
  });

  ChatMessage copyWith({
    String? id,
    String? text,
    DateTime? timestamp,
    bool? isFromMe,
    MessageStatus? status,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      text: text ?? this.text,
      timestamp: timestamp ?? this.timestamp,
      isFromMe: isFromMe ?? this.isFromMe,
      status: status ?? this.status,
    );
  }
}
