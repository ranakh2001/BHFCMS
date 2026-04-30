import 'package:flutter/material.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../models/session_media_model.dart';
import 'audio_player_widget.dart';
import 'video_player_widget.dart';

class MediaItemCard extends StatefulWidget {
  final SessionMediaModel item;
  final bool isDark;
  final ResponsiveHelper res;
  /// When true, shows a visibility toggle switch (supervisor only).
  final bool canToggleVisibility;
  final ValueChanged<bool>? onVisibilityChanged;

  const MediaItemCard({
    super.key,
    required this.item,
    required this.isDark,
    required this.res,
    this.canToggleVisibility = false,
    this.onVisibilityChanged,
  });

  @override
  State<MediaItemCard> createState() => _MediaItemCardState();
}

class _MediaItemCardState extends State<MediaItemCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = widget.res;
    final isDark = widget.isDark;
    final item = widget.item;
    final isVideo = item.type == MediaType.video;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.only(bottom: res.scaleHeight(10)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius:
            BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.15 : 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // ── Header ──────────────────────────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: res.scaleSpacing(AppSpacing.p16),
              vertical: res.scaleHeight(12),
            ),
            child: Row(
              children: [
                // Type icon
                Container(
                  width: res.scaleWidth(38),
                  height: res.scaleHeight(38),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(res.scaleRadius(8)),
                  ),
                  child: Icon(
                    isVideo
                        ? Icons.videocam_outlined
                        : Icons.graphic_eq_rounded,
                    color: AppColors.primary,
                    size: res.scaleText(18),
                  ),
                ),
                SizedBox(width: res.scaleWidth(10)),
                // Title + type label — tappable area to expand
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => setState(() => _expanded = !_expanded),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: res.scaleText(13),
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? Colors.white
                                : AppColors.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          isVideo ? l10n.videoType : l10n.audioType,
                          style: TextStyle(
                            fontSize: res.scaleText(11),
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Right side: visibility toggle (supervisor) or chevron
                if (widget.canToggleVisibility) ...[
                  SizedBox(width: res.scaleWidth(4)),
                  Icon(
                    item.isVisibleToParent
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: res.scaleText(14),
                    color: item.isVisibleToParent
                        ? AppColors.primary
                        : AppColors.textSecondary,
                  ),
                  Transform.scale(
                    scale: 0.78,
                    alignment: Alignment.centerRight,
                    child: Switch(
                      value: item.isVisibleToParent,
                      onChanged: widget.onVisibilityChanged,
                      activeThumbColor: AppColors.primary,
                      activeTrackColor: AppColors.primary.withValues(alpha: 0.4),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ] else ...[
                  GestureDetector(
                    onTap: () => setState(() => _expanded = !_expanded),
                    child: AnimatedRotation(
                      turns: _expanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.textSecondary,
                        size: res.scaleText(22),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          // ── Expandable Player ────────────────────────────────────
          if (_expanded)
            Padding(
              padding: EdgeInsets.fromLTRB(
                res.scaleSpacing(AppSpacing.p16),
                0,
                res.scaleSpacing(AppSpacing.p16),
                res.scaleHeight(12),
              ),
              child: isVideo
                  ? VideoPlayerWidget(url: item.url, res: res, isDark: isDark)
                  : AudioPlayerWidget(url: item.url, res: res, isDark: isDark),
            ),
        ],
      ),
    );
  }
}
