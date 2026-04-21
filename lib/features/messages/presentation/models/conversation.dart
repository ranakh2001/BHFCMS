import 'chat_message.dart';

class Conversation {
  final String id;
  final String guardianName;
  final String childName;
  final String avatarAsset;
  final List<ChatMessage> messages;
  final int unreadCount;

  const Conversation({
    required this.id,
    required this.guardianName,
    required this.childName,
    required this.avatarAsset,
    required this.messages,
    this.unreadCount = 0,
  });

  ChatMessage? get lastMessage => messages.isEmpty ? null : messages.last;

  Conversation copyWith({
    String? id,
    String? guardianName,
    String? childName,
    String? avatarAsset,
    List<ChatMessage>? messages,
    int? unreadCount,
  }) {
    return Conversation(
      id: id ?? this.id,
      guardianName: guardianName ?? this.guardianName,
      childName: childName ?? this.childName,
      avatarAsset: avatarAsset ?? this.avatarAsset,
      messages: messages ?? this.messages,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }
}
