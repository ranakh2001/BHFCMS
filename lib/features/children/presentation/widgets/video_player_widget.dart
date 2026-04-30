import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  final ResponsiveHelper res;
  final bool isDark;

  const VideoPlayerWidget({
    super.key,
    required this.url,
    required this.res,
    required this.isDark,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _controller;
  bool _initialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  Future<void> _initController() async {
    if (widget.url.isEmpty) {
      if (mounted) setState(() => _hasError = true);
      return;
    }
    try {
      final ctrl = widget.url.startsWith('http')
          ? VideoPlayerController.networkUrl(Uri.parse(widget.url))
          : VideoPlayerController.file(File(widget.url));
      _controller = ctrl;
      await ctrl.initialize();
      ctrl.addListener(() {
        if (mounted) setState(() {});
      });
      if (mounted) setState(() => _initialized = true);
    } catch (_) {
      if (mounted) setState(() => _hasError = true);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final res = widget.res;
    final isDark = widget.isDark;

    if (_hasError) {
      return _buildPlaceholder(isDark, res, Icons.videocam_off_outlined);
    }
    if (!_initialized || _controller == null) {
      return SizedBox(
        height: res.scaleHeight(160),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    final ctrl = _controller!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(res.scaleRadius(8)),
          child: AspectRatio(
            aspectRatio: ctrl.value.aspectRatio,
            child: VideoPlayer(ctrl),
          ),
        ),
        SizedBox(height: res.scaleHeight(8)),
        _buildControls(ctrl, res, isDark),
      ],
    );
  }

  Widget _buildControls(
      VideoPlayerController ctrl, ResponsiveHelper res, bool isDark) {
    final position = ctrl.value.position;
    final duration = ctrl.value.duration;
    final isPlaying = ctrl.value.isPlaying;

    return Row(
      children: [
        GestureDetector(
          onTap: () => isPlaying ? ctrl.pause() : ctrl.play(),
          child: Container(
            width: res.scaleWidth(36),
            height: res.scaleHeight(36),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
              color: Colors.white,
              size: res.scaleText(18),
            ),
          ),
        ),
        SizedBox(width: res.scaleWidth(8)),
        Expanded(
          child: VideoProgressIndicator(
            ctrl,
            allowScrubbing: true,
            colors: VideoProgressColors(
              playedColor: AppColors.primary,
              bufferedColor: AppColors.primary.withValues(alpha: 0.3),
              backgroundColor: isDark ? Colors.grey[700]! : Colors.grey[300]!,
            ),
            padding:
                EdgeInsets.symmetric(vertical: res.scaleHeight(8)),
          ),
        ),
        SizedBox(width: res.scaleWidth(8)),
        Text(
          '${_fmt(position)} / ${_fmt(duration)}',
          style: TextStyle(
            fontSize: res.scaleText(11),
            color: isDark ? Colors.white60 : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholder(bool isDark, ResponsiveHelper res, IconData icon) {
    return Container(
      height: res.scaleHeight(120),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.grey[200],
        borderRadius: BorderRadius.circular(res.scaleRadius(8)),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.textSecondary, size: res.scaleText(32)),
            SizedBox(height: res.scaleHeight(4)),
            Text(
              'No preview available',
              style: TextStyle(
                fontSize: res.scaleText(12),
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _fmt(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }
}
