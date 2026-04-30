import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../config/routes.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../models/session_media_model.dart';
import 'media_item_card.dart';

class SessionTab extends StatefulWidget {
  final bool isDark;
  final ResponsiveHelper res;

  /// Therapist: can start assessments and upload media.
  final bool canManageSessions;

  /// Supervisor + Therapist: can upload video/audio.
  final bool canUploadMedia;

  /// Supervisor only: can toggle per-item visibility for parents.
  final bool canShareWithParent;

  /// Parent role: sees only items marked as visible.
  final bool isParent;

  const SessionTab({
    super.key,
    required this.isDark,
    required this.res,
    this.canManageSessions = false,
    this.canUploadMedia = false,
    this.canShareWithParent = false,
    this.isParent = false,
  });

  @override
  State<SessionTab> createState() => _SessionTabState();
}

class _SessionTabState extends State<SessionTab> {
  // ── Assessments (therapist) ─────────────────────────────────────────────────
  int _selectedTest = 0;
  bool _assessmentsExpanded = true;
  bool _addParentTask = false;

  // ── Section collapse state ──────────────────────────────────────────────────
  bool _mediaExpanded = true;
  bool _assignmentsExpanded = true;

  // ── Media items (uploaded in-session) ──────────────────────────────────────
  final List<SessionMediaModel> _mediaItems = [];

  // ── Assignments (shared with parent by supervisor) ──────────────────────────
  late List<AssignmentModel> _assignments;
  bool _assignmentsInitialized = false;

  final _imagePicker = ImagePicker();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_assignmentsInitialized) {
      final l10n = AppLocalizations.of(context)!;
      _assignments = [
        AssignmentModel(
          id: '1',
          title: l10n.visualCommunicationTest,
          isSharedWithParent: true,
        ),
        AssignmentModel(
          id: '2',
          title: l10n.behavioralSkillsTest,
          isSharedWithParent: false,
        ),
        AssignmentModel(
          id: '3',
          title: l10n.commandResponseTest,
          isSharedWithParent: true,
        ),
      ];
      _assignmentsInitialized = true;
    }
  }

  // ── Picking ─────────────────────────────────────────────────────────────────

  Future<void> _pickVideo() async {
    final result = await _imagePicker.pickVideo(source: ImageSource.gallery);
    if (result != null && mounted) {
      final videoCount = _mediaItems
          .where((m) => m.type == MediaType.video)
          .length;
      setState(() {
        _mediaItems.add(
          SessionMediaModel(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            type: MediaType.video,
            url: result.path,
            title: 'Video ${videoCount + 1}',
          ),
        );
      });
    }
  }

  Future<void> _pickAudio() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null && result.files.single.path != null && mounted) {
      setState(() {
        _mediaItems.add(
          SessionMediaModel(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            type: MediaType.audio,
            url: result.files.single.path!,
            title: result.files.single.name,
          ),
        );
      });
    }
  }

  void _toggleMediaVisibility(String id, bool value) {
    setState(() {
      final i = _mediaItems.indexWhere((m) => m.id == id);
      if (i != -1)
        _mediaItems[i] = _mediaItems[i].copyWith(isVisibleToParent: value);
    });
  }

  void _toggleAssignmentShare(String id, bool value) {
    setState(() {
      final i = _assignments.indexWhere((a) => a.id == id);
      if (i != -1)
        _assignments[i] = _assignments[i].copyWith(isSharedWithParent: value);
    });
  }

  // ── Build ────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final res = widget.res;
    final isDark = widget.isDark;

    final tests = [
      l10n.visualCommunicationTest,
      l10n.behavioralSkillsTest,
      l10n.commandResponseTest,
    ];

    // Filter data by role
    final visibleMedia = widget.isParent
        ? _mediaItems.where((m) => m.isVisibleToParent).toList()
        : _mediaItems;

    final visibleAssignments = widget.isParent
        ? _assignments.where((a) => a.isSharedWithParent).toList()
        : _assignments;

    final showAssignmentsSection = widget.isParent || widget.canShareWithParent;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        res.scaleSpacing(AppSpacing.p16),
        res.scaleHeight(8),
        res.scaleSpacing(AppSpacing.p16),
        res.scaleHeight(80),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 1. Session Media ───────────────────────────────────────────────
          _buildSectionHeader(
            title: l10n.sessionMediaSection,
            expanded: _mediaExpanded,
            onTap: () => setState(() => _mediaExpanded = !_mediaExpanded),
            res: res,
            isDark: isDark,
          ),
          if (_mediaExpanded) ...[
            SizedBox(height: res.scaleHeight(AppSpacing.p8)),
            if (visibleMedia.isEmpty)
              _buildEmptyState(l10n.noMediaAvailable, isDark, res)
            else
              ...visibleMedia.map(
                (item) => MediaItemCard(
                  key: ValueKey(item.id),
                  item: item,
                  isDark: isDark,
                  res: res,
                  canToggleVisibility: widget.canShareWithParent,
                  onVisibilityChanged: widget.canShareWithParent
                      ? (v) => _toggleMediaVisibility(item.id, v)
                      : null,
                ),
              ),
          ],

          SizedBox(height: res.scaleHeight(AppSpacing.p16)),

          // ── 2. Upload Buttons (supervisor + therapist) ─────────────────────
          if (widget.canUploadMedia) ...[
            _buildUploadCard(
              context: context,
              label: l10n.uploadSessionVideo,
              icon: Icons.videocam_outlined,
              res: res,
              isDark: isDark,
              onTap: _pickVideo,
            ),
            SizedBox(height: res.scaleHeight(AppSpacing.p12)),
            _buildUploadCard(
              context: context,
              label: l10n.uploadSessionAudio,
              icon: Icons.graphic_eq_rounded,
              res: res,
              isDark: isDark,
              onTap: _pickAudio,
            ),
            SizedBox(height: res.scaleHeight(AppSpacing.p16)),
          ],

          // ── 3. Assignments (parent reads / supervisor manages) ─────────────
          if (showAssignmentsSection) ...[
            _buildSectionHeader(
              title: l10n.assignmentsForParent,
              expanded: _assignmentsExpanded,
              onTap: () =>
                  setState(() => _assignmentsExpanded = !_assignmentsExpanded),
              res: res,
              isDark: isDark,
            ),
            if (_assignmentsExpanded) ...[
              SizedBox(height: res.scaleHeight(AppSpacing.p8)),
              if (visibleAssignments.isEmpty)
                _buildEmptyState(l10n.noAssignments, isDark, res)
              else
                ...visibleAssignments.map(
                  (a) => _buildAssignmentTile(
                    assignment: a,
                    isDark: isDark,
                    res: res,
                  ),
                ),
            ],
            SizedBox(height: res.scaleHeight(AppSpacing.p16)),
          ],

          // ── 4. Assessments (therapist only) ───────────────────────────────
          if (widget.canManageSessions) ...[
            _buildSectionHeader(
              title: l10n.assessmentsSection,
              expanded: _assessmentsExpanded,
              onTap: () =>
                  setState(() => _assessmentsExpanded = !_assessmentsExpanded),
              res: res,
              isDark: isDark,
            ),
            if (_assessmentsExpanded) ...[
              SizedBox(height: res.scaleHeight(AppSpacing.p8)),
              ...List.generate(tests.length, (i) {
                final selected = _selectedTest == i;
                return GestureDetector(
                  onTap: () => setState(() => _selectedTest = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.only(bottom: res.scaleHeight(8)),
                    padding: EdgeInsets.symmetric(
                      horizontal: res.scaleSpacing(AppSpacing.p16),
                      vertical: res.scaleHeight(AppSpacing.p12),
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.primary
                          : (isDark ? AppColors.surfaceDark : Colors.white),
                      borderRadius: BorderRadius.circular(
                        res.scaleRadius(AppSpacing.radiusMd),
                      ),
                      border: Border.all(
                        color: selected
                            ? AppColors.primary
                            : (isDark ? Colors.grey[700]! : Colors.grey[200]!),
                      ),
                      boxShadow: selected
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withValues(
                                  alpha: 0.25,
                                ),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : [],
                    ),
                    child: Text(
                      tests[i],
                      style: TextStyle(
                        fontSize: res.scaleText(14),
                        fontWeight: selected
                            ? FontWeight.w600
                            : FontWeight.normal,
                        color: selected
                            ? Colors.white
                            : (isDark ? Colors.white : AppColors.textPrimary),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }),
              SizedBox(height: res.scaleHeight(AppSpacing.p8)),
              // Parent task checkbox
              GestureDetector(
                onTap: () => setState(() => _addParentTask = !_addParentTask),
                child: Row(
                  children: [
                    SizedBox(
                      width: res.scaleWidth(24),
                      height: res.scaleHeight(24),
                      child: Checkbox(
                        value: _addParentTask,
                        onChanged: (v) =>
                            setState(() => _addParentTask = v ?? false),
                        activeColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            res.scaleRadius(4),
                          ),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    SizedBox(width: res.scaleWidth(8)),
                    Expanded(
                      child: Text(
                        l10n.addParentTask,
                        style: TextStyle(
                          fontSize: res.scaleText(13),
                          color: isDark
                              ? Colors.white70
                              : AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: res.scaleHeight(AppSpacing.p20)),
              SizedBox(
                height: res.scaleHeight(50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.assessment,
                      arguments: {
                        'testName': tests[_selectedTest],
                        'testIndex': _selectedTest,
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        res.scaleRadius(AppSpacing.radiusMd),
                      ),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    l10n.startButton,
                    style: TextStyle(
                      fontSize: res.scaleText(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }

  // ── Private helpers ──────────────────────────────────────────────────────────

  Widget _buildEmptyState(String msg, bool isDark, ResponsiveHelper res) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: res.scaleHeight(16)),
      child: Center(
        child: Text(
          msg,
          style: TextStyle(
            fontSize: res.scaleText(13),
            color: isDark ? Colors.white38 : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildAssignmentTile({
    required AssignmentModel assignment,
    required bool isDark,
    required ResponsiveHelper res,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: res.scaleHeight(8)),
      padding: EdgeInsets.symmetric(
        horizontal: res.scaleSpacing(AppSpacing.p16),
        vertical: res.scaleHeight(AppSpacing.p12),
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(
          res.scaleRadius(AppSpacing.radiusMd),
        ),
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
      child: Row(
        children: [
          Icon(
            Icons.assignment_outlined,
            color: AppColors.primary,
            size: res.scaleText(18),
          ),
          SizedBox(width: res.scaleWidth(10)),
          Expanded(
            child: Text(
              assignment.title,
              style: TextStyle(
                fontSize: res.scaleText(13),
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white : AppColors.textPrimary,
              ),
            ),
          ),
          // Share toggle visible only to supervisor
          if (widget.canShareWithParent) ...[
            Icon(
              assignment.isSharedWithParent
                  ? Icons.share_outlined
                  : Icons.share,
              size: res.scaleText(14),
              color: assignment.isSharedWithParent
                  ? AppColors.primary
                  : AppColors.textSecondary,
            ),
            Transform.scale(
              scale: 0.78,
              alignment: Alignment.centerRight,
              child: Switch(
                value: assignment.isSharedWithParent,
                onChanged: (v) => _toggleAssignmentShare(assignment.id, v),
                activeThumbColor: AppColors.primary,
                activeTrackColor: AppColors.primary.withValues(alpha: 0.4),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildUploadCard({
    required BuildContext context,
    required String label,
    required IconData icon,
    required ResponsiveHelper res,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: res.scaleSpacing(AppSpacing.p16),
          vertical: res.scaleHeight(AppSpacing.p16),
        ),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : Colors.white,
          borderRadius: BorderRadius.circular(
            res.scaleRadius(AppSpacing.radiusMd),
          ),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.textSecondary,
              size: res.scaleText(20),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: res.scaleText(14),
                color: isDark ? Colors.white : AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(icon, color: AppColors.primary, size: res.scaleText(22)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required bool expanded,
    required VoidCallback onTap,
    required ResponsiveHelper res,
    required bool isDark,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: res.scaleText(15),
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
          AnimatedRotation(
            turns: expanded ? 0.25 : 0,
            duration: const Duration(milliseconds: 200),
            child: Icon(
              Icons.keyboard_arrow_left_rounded,
              color: AppColors.textSecondary,
              size: res.scaleText(22),
            ),
          ),
        ],
      ),
    );
  }
}
