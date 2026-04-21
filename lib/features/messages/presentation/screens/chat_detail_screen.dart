import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../providers/messages_provider.dart';
import '../widgets/guardian_avatar.dart';
import '../widgets/message_bubble.dart';

class ChatDetailScreen extends ConsumerStatefulWidget {
  final String conversationId;

  const ChatDetailScreen({super.key, required this.conversationId});

  @override
  ConsumerState<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends ConsumerState<ChatDetailScreen> {
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage() {
    final text = _inputController.text.trim();
    if (text.isEmpty) return;
    ref.read(messagesProvider.notifier).sendMessage(widget.conversationId, text);
    _inputController.clear();
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final state = ref.watch(messagesProvider);
    final conversation = state.conversations.firstWhere(
      (c) => c.id == widget.conversationId,
    );
    final messages = conversation.messages;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context, res, l10n, isDark, conversation.guardianName,
                conversation.childName),
            Divider(
              height: 1,
              color: isDark
                  ? Colors.white.withValues(alpha: 0.08)
                  : Colors.black.withValues(alpha: 0.08),
            ),
            Expanded(
              child: messages.isEmpty
                  ? Center(
                      child: Text(
                        l10n.noMessages,
                        style: TextStyle(
                          fontSize: res.scaleText(14),
                          color: AppColors.textSecondary,
                        ),
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      padding:
                          EdgeInsets.symmetric(vertical: res.scaleSpacing(8)),
                      itemCount: messages.length,
                      itemBuilder: (_, i) =>
                          MessageBubble(message: messages[i]),
                    ),
            ),
            _buildInputBar(context, res, l10n, isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(
    BuildContext context,
    ResponsiveHelper res,
    AppLocalizations l10n,
    bool isDark,
    String name,
    String childName,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(12),
        vertical: res.scaleSpacing(10),
      ),
      child: Row(
        children: [
          GuardianAvatar(size: res.scaleWidth(40)),
          SizedBox(width: res.scaleSpacing(10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: res.scaleText(16),
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : AppColors.textPrimary,
                ),
              ),
              Text(
                '(${l10n.guardianOf(childName)})',
                style: TextStyle(
                  fontSize: res.scaleText(12),
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_forward_ios,
              size: res.scaleWidth(18),
              color: AppColors.primary,
            ),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(
              minWidth: res.scaleWidth(36),
              minHeight: res.scaleWidth(36),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputBar(
    BuildContext context,
    ResponsiveHelper res,
    AppLocalizations l10n,
    bool isDark,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(12),
        vertical: res.scaleSpacing(10),
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              constraints: BoxConstraints(minHeight: res.scaleHeight(44)),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.backgroundDark
                    : AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(res.scaleRadius(22)),
                border: Border.all(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.black.withValues(alpha: 0.1),
                ),
              ),
              child: TextField(
                controller: _inputController,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                maxLines: null,
                onSubmitted: (_) => _sendMessage(),
                style: TextStyle(
                  fontSize: res.scaleText(13),
                  color: isDark ? Colors.white : AppColors.textPrimary,
                ),
                decoration: InputDecoration(
                  hintText: l10n.typeMessage,
                  hintStyle: TextStyle(
                    fontSize: res.scaleText(13),
                    color: AppColors.textSecondary,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: res.scaleSpacing(16),
                    vertical: res.scaleSpacing(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: res.scaleSpacing(10)),
          GestureDetector(
            onTap: _sendMessage,
            child: Container(
              width: res.scaleWidth(42),
              height: res.scaleWidth(42),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: Icon(
                Icons.send,
                color: Colors.white,
                size: res.scaleWidth(18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
