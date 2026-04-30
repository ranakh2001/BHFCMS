import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/permissions/user_role_policy.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../providers/attachment_provider.dart';
import '../providers/messages_provider.dart';
import '../widgets/attachment_preview_widget.dart';
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

  Future<void> _sendMessage() async {
    final text = _inputController.text.trim();
    final attachState = ref.read(attachmentProvider);

    if (text.isEmpty && !attachState.hasAttachment) return;

    if (attachState.hasAttachment) {
      final url = await ref.read(attachmentProvider.notifier).upload();
      if (url == null) return;

      if (!mounted) return;
      ref.read(messagesProvider.notifier).sendAttachmentMessage(
            conversationId: widget.conversationId,
            type: attachState.type!,
            fileUrl: url,
            text: text,
            fileName: attachState.fileName,
            localPath: attachState.localPath,
          );
      ref.read(attachmentProvider.notifier).clearAttachment();
    } else {
      ref.read(messagesProvider.notifier).sendMessage(widget.conversationId, text);
    }

    _inputController.clear();
    _scrollToBottom();
  }

  void _showAttachmentOptions() {
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: isDark ? AppColors.surfaceDark : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(res.scaleRadius(20)),
        ),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: res.scaleSpacing(16),
            horizontal: res.scaleSpacing(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: res.scaleWidth(40),
                height: res.scaleHeight(4),
                margin: EdgeInsets.only(bottom: res.scaleSpacing(16)),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.2)
                      : Colors.black.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(res.scaleRadius(2)),
                ),
              ),
              _AttachOption(
                icon: Icons.photo_library_rounded,
                label: 'اختيار من المعرض',
                color: AppColors.primary,
                isDark: isDark,
                res: res,
                onTap: () {
                  Navigator.of(ctx).pop();
                  ref
                      .read(attachmentProvider.notifier)
                      .pickImage(ImageSource.gallery);
                },
              ),
              SizedBox(height: res.scaleSpacing(8)),
              _AttachOption(
                icon: Icons.camera_alt_rounded,
                label: 'التقاط صورة',
                color: AppColors.secondary,
                isDark: isDark,
                res: res,
                onTap: () {
                  Navigator.of(ctx).pop();
                  ref
                      .read(attachmentProvider.notifier)
                      .pickImage(ImageSource.camera);
                },
              ),
              SizedBox(height: res.scaleSpacing(8)),
              _AttachOption(
                icon: Icons.insert_drive_file_rounded,
                label: 'إرفاق ملف',
                color: AppColors.accent,
                isDark: isDark,
                res: res,
                onTap: () {
                  Navigator.of(ctx).pop();
                  ref.read(attachmentProvider.notifier).pickFile();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final state = ref.watch(messagesProvider);
    final policy = ref.watch(currentPolicyProvider);
    final attachState = ref.watch(attachmentProvider);
    final isParent = !(policy?.canManageSessions ?? true);
    final conversation = state.conversations.firstWhere(
      (c) => c.id == widget.conversationId,
    );
    final messages = conversation.messages;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(
              context,
              res,
              l10n,
              isDark,
              conversation.guardianName,
              conversation.childName,
              isParent,
            ),
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
                      padding: EdgeInsets.symmetric(
                        vertical: res.scaleSpacing(8),
                      ),
                      itemCount: messages.length,
                      itemBuilder: (_, i) =>
                          MessageBubble(message: messages[i]),
                    ),
            ),
            _buildInputBar(context, res, l10n, isDark, attachState),
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
    bool isParent,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(12),
        vertical: res.scaleSpacing(10),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              size: res.scaleWidth(18),
              color: AppColors.primary,
            ),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(
              minWidth: res.scaleWidth(36),
              minHeight: res.scaleWidth(36),
            ),
          ),
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
                isParent
                    ? '(${l10n.therapistOf(childName)})'
                    : '(${l10n.guardianOf(childName)})',
                style: TextStyle(
                  fontSize: res.scaleText(12),
                  color: AppColors.textSecondary,
                ),
              ),
            ],
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
    AttachmentState attachState,
  ) {
    final isUploading = attachState.isUploading;

    return Container(
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (attachState.hasAttachment)
            AttachmentPreviewWidget(
              state: attachState,
              onRemove: () =>
                  ref.read(attachmentProvider.notifier).clearAttachment(),
              onRetry: () =>
                  ref.read(attachmentProvider.notifier).retryUpload(),
            ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: res.scaleSpacing(12),
              vertical: res.scaleSpacing(10),
            ),
            child: Row(
              children: [
                _buildAttachButton(res, isDark, isUploading),
                SizedBox(width: res.scaleSpacing(6)),
                Expanded(
                  child: Container(
                    constraints:
                        BoxConstraints(minHeight: res.scaleHeight(44)),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.backgroundDark
                          : AppColors.backgroundLight,
                      borderRadius:
                          BorderRadius.circular(res.scaleRadius(22)),
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
                      onSubmitted: (_) => isUploading ? null : _sendMessage(),
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
                _buildSendButton(res, isUploading),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttachButton(
    ResponsiveHelper res,
    bool isDark,
    bool isUploading,
  ) {
    return GestureDetector(
      onTap: isUploading ? null : _showAttachmentOptions,
      child: Container(
        width: res.scaleWidth(38),
        height: res.scaleWidth(38),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.05),
        ),
        child: Icon(
          Icons.attach_file_rounded,
          size: res.scaleWidth(20),
          color: isUploading ? AppColors.textSecondary : AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildSendButton(ResponsiveHelper res, bool isUploading) {
    return GestureDetector(
      onTap: isUploading ? null : _sendMessage,
      child: Container(
        width: res.scaleWidth(42),
        height: res.scaleWidth(42),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isUploading
              ? AppColors.primary.withValues(alpha: 0.5)
              : AppColors.primary,
        ),
        child: isUploading
            ? Padding(
                padding: EdgeInsets.all(res.scaleSpacing(11)),
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Icon(
                Icons.send,
                color: Colors.white,
                size: res.scaleWidth(18),
              ),
      ),
    );
  }
}

class _AttachOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool isDark;
  final ResponsiveHelper res;
  final VoidCallback onTap;

  const _AttachOption({
    required this.icon,
    required this.label,
    required this.color,
    required this.isDark,
    required this.res,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(res.scaleRadius(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: res.scaleSpacing(12),
          vertical: res.scaleSpacing(12),
        ),
        child: Row(
          children: [
            Container(
              width: res.scaleWidth(44),
              height: res.scaleWidth(44),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(res.scaleRadius(12)),
              ),
              child: Icon(icon, color: color, size: res.scaleWidth(22)),
            ),
            SizedBox(width: res.scaleSpacing(14)),
            Text(
              label,
              style: TextStyle(
                fontSize: res.scaleText(15),
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white : AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
