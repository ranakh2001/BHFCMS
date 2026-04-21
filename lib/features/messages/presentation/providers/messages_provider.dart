import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chat_message.dart';
import '../models/conversation.dart';

class MessagesState {
  final List<Conversation> conversations;
  final String searchQuery;

  const MessagesState({
    required this.conversations,
    this.searchQuery = '',
  });

  List<Conversation> get filteredConversations {
    if (searchQuery.isEmpty) return conversations;
    final q = searchQuery.toLowerCase();
    return conversations.where((c) {
      return c.guardianName.toLowerCase().contains(q) ||
          c.childName.toLowerCase().contains(q);
    }).toList();
  }

  MessagesState copyWith({
    List<Conversation>? conversations,
    String? searchQuery,
  }) {
    return MessagesState(
      conversations: conversations ?? this.conversations,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class MessagesNotifier extends Notifier<MessagesState> {
  @override
  MessagesState build() {
    return MessagesState(conversations: _mockConversations());
  }

  List<Conversation> _mockConversations() {
    return [
      Conversation(
        id: '1',
        guardianName: 'سارة أحمد',
        childName: 'محمد',
        avatarAsset: '',
        unreadCount: 1,
        messages: [
          ChatMessage(
            id: 'm1',
            text: 'مرحبا استاذ محمد اود الاستفسار عن حاله ابني محمد',
            timestamp: DateTime(2024, 1, 1, 10, 11),
            isFromMe: false,
          ),
          ChatMessage(
            id: 'm2',
            text: 'اهلا استاذة سارة',
            timestamp: DateTime(2024, 1, 1, 10, 12),
            isFromMe: true,
            status: MessageStatus.read,
          ),
        ],
      ),
      Conversation(
        id: '2',
        guardianName: 'سارة أحمد',
        childName: 'محمد',
        avatarAsset: '',
        messages: [
          ChatMessage(
            id: 'm3',
            text: 'أود مناقشة الخطة العلاجية لابني',
            timestamp: DateTime(2024, 1, 1, 9, 30),
            isFromMe: false,
          ),
        ],
      ),
      Conversation(
        id: '3',
        guardianName: 'سارة أحمد',
        childName: 'محمد',
        avatarAsset: '',
        messages: [
          ChatMessage(
            id: 'm4',
            text: 'أود مناقشة الخطة العلاجية لابني',
            timestamp: DateTime(2024, 1, 1, 8, 15),
            isFromMe: false,
          ),
        ],
      ),
      Conversation(
        id: '4',
        guardianName: 'سارة أحمد',
        childName: 'محمد',
        avatarAsset: '',
        messages: [
          ChatMessage(
            id: 'm5',
            text: 'أود مناقشة الخطة العلاجية لابني',
            timestamp: DateTime(2024, 1, 1, 7, 45),
            isFromMe: false,
          ),
        ],
      ),
    ];
  }

  void updateSearch(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void sendMessage(String conversationId, String text) {
    if (text.trim().isEmpty) return;
    final newMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text.trim(),
      timestamp: DateTime.now(),
      isFromMe: true,
      status: MessageStatus.sent,
    );
    final updated = state.conversations.map((conv) {
      if (conv.id != conversationId) return conv;
      return conv.copyWith(messages: [...conv.messages, newMessage]);
    }).toList();
    state = state.copyWith(conversations: updated);
  }

  void markConversationAsRead(String conversationId) {
    final updated = state.conversations.map((conv) {
      if (conv.id != conversationId) return conv;
      return conv.copyWith(unreadCount: 0);
    }).toList();
    state = state.copyWith(conversations: updated);
  }
}

final messagesProvider =
    NotifierProvider<MessagesNotifier, MessagesState>(MessagesNotifier.new);
