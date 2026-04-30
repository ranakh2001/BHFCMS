import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String url;
  final ResponsiveHelper res;
  final bool isDark;

  const AudioPlayerWidget({
    super.key,
    required this.url,
    required this.res,
    required this.isDark,
  });

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final _player = AudioPlayer();
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    if (widget.url.isEmpty) {
      if (mounted) setState(() => _hasError = true);
      return;
    }
    try {
      if (widget.url.startsWith('http')) {
        await _player.setUrl(widget.url);
      } else {
        await _player.setFilePath(widget.url);
      }
    } catch (_) {
      if (mounted) setState(() => _hasError = true);
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final res = widget.res;
    final isDark = widget.isDark;

    if (_hasError) {
      return _buildErrorState(isDark, res);
    }

    return Container(
      padding: EdgeInsets.all(res.scaleSpacing(12)),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.grey[100],
        borderRadius: BorderRadius.circular(res.scaleRadius(8)),
      ),
      child: Row(
        children: [
          StreamBuilder<PlayerState>(
            stream: _player.playerStateStream,
            builder: (_, snapshot) {
              final isPlaying = snapshot.data?.playing ?? false;
              return GestureDetector(
                onTap: () => isPlaying ? _player.pause() : _player.play(),
                child: Container(
                  width: res.scaleWidth(42),
                  height: res.scaleHeight(42),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: res.scaleText(22),
                  ),
                ),
              );
            },
          ),
          SizedBox(width: res.scaleWidth(12)),
          Expanded(
            child: StreamBuilder<Duration?>(
              stream: _player.durationStream,
              builder: (_, durSnap) {
                final duration = durSnap.data ?? Duration.zero;
                final maxMs =
                    duration.inMilliseconds.toDouble().clamp(1.0, double.infinity);

                return StreamBuilder<Duration>(
                  stream: _player.positionStream,
                  builder: (_, posSnap) {
                    final position = posSnap.data ?? Duration.zero;
                    final curMs =
                        position.inMilliseconds.toDouble().clamp(0.0, maxMs);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: AppColors.primary,
                            inactiveTrackColor:
                                isDark ? Colors.grey[600] : Colors.grey[300],
                            thumbColor: AppColors.primary,
                            overlayShape: SliderComponentShape.noOverlay,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 6),
                            trackHeight: 3,
                          ),
                          child: Slider(
                            value: curMs,
                            max: maxMs,
                            onChanged: (v) =>
                                _player.seek(Duration(milliseconds: v.toInt())),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: res.scaleSpacing(4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _fmt(position),
                                style: TextStyle(
                                  fontSize: res.scaleText(10),
                                  color: isDark
                                      ? Colors.white60
                                      : AppColors.textSecondary,
                                ),
                              ),
                              Text(
                                _fmt(duration),
                                style: TextStyle(
                                  fontSize: res.scaleText(10),
                                  color: isDark
                                      ? Colors.white60
                                      : AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(bool isDark, ResponsiveHelper res) {
    return Container(
      padding: EdgeInsets.all(res.scaleSpacing(12)),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.grey[100],
        borderRadius: BorderRadius.circular(res.scaleRadius(8)),
      ),
      child: Row(
        children: [
          Icon(Icons.mic_off_rounded,
              color: AppColors.textSecondary, size: res.scaleText(28)),
          SizedBox(width: res.scaleWidth(12)),
          Text(
            'No preview available',
            style: TextStyle(
              fontSize: res.scaleText(13),
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  String _fmt(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }
}
