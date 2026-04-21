import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../providers/messages_provider.dart';
import '../widgets/conversation_list_item.dart';
import 'chat_detail_screen.dart';

class MessagesScreen extends ConsumerStatefulWidget {
  const MessagesScreen({super.key});

  @override
  ConsumerState<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends ConsumerState<MessagesScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final state = ref.watch(messagesProvider);
    final conversations = state.filteredConversations;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context, res, l10n, isDark),
            SizedBox(height: res.scaleHeight(12)),
            _buildSearchBar(context, res, l10n, isDark),
            SizedBox(height: res.scaleHeight(8)),
            Expanded(
              child: conversations.isEmpty
                  ? _buildEmpty(context, res, l10n, isDark)
                  : ListView.separated(
                      itemCount: conversations.length,
                      separatorBuilder: (_, __) => Divider(
                        height: 1,
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.08)
                            : Colors.black.withValues(alpha: 0.07),
                        indent: res.scaleSpacing(16),
                        endIndent: res.scaleSpacing(16),
                      ),
                      itemBuilder: (context, index) {
                        final conv = conversations[index];
                        return ConversationListItem(
                          conversation: conv,
                          onTap: () {
                            ref
                                .read(messagesProvider.notifier)
                                .markConversationAsRead(conv.id);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ChatDetailScreen(
                                  conversationId: conv.id,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
            SizedBox(height: res.scaleHeight(80)),
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
  ) {
    return Padding(
      padding: EdgeInsets.only(
        top: res.scaleSpacing(16),
        left: res.scaleSpacing(16),
        right: res.scaleSpacing(16),
      ),
      child: Row(
        children: [
          SizedBox(width: res.scaleWidth(40)),
          Expanded(
            child: Text(
              l10n.messages,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: res.scaleText(18),
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
          SizedBox(width: res.scaleWidth(40)),
        ],
      ),
    );
  }

  Widget _buildSearchBar(
    BuildContext context,
    ResponsiveHelper res,
    AppLocalizations l10n,
    bool isDark,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(16)),
      child: Container(
        height: res.scaleHeight(44),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : Colors.white,
          borderRadius: BorderRadius.circular(res.scaleRadius(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          controller: _searchController,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          onChanged: (v) =>
              ref.read(messagesProvider.notifier).updateSearch(v),
          style: TextStyle(
            fontSize: res.scaleText(13),
            color: isDark ? Colors.white : AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: l10n.searchGuardian,
            hintStyle: TextStyle(
              fontSize: res.scaleText(13),
              color: AppColors.textSecondary,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: res.scaleSpacing(16),
              vertical: res.scaleSpacing(12),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmpty(
    BuildContext context,
    ResponsiveHelper res,
    AppLocalizations l10n,
    bool isDark,
  ) {
    return Center(
      child: Text(
        l10n.noConversations,
        style: TextStyle(
          fontSize: res.scaleText(14),
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
