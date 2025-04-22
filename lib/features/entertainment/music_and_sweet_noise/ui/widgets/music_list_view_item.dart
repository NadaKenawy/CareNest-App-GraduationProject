import 'package:care_nest/features/entertainment/music_and_sweet_noise/data/models/get_music_response.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/ui/widgets/music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

import '../../../../../core/theme/text_styless.dart';

class MusicListViewItem extends StatefulWidget {
  const MusicListViewItem({
    super.key,
    required this.musicData,
    required this.currentPlayingNotifier,
  });

  final MusicData musicData;
  final ValueNotifier<String?> currentPlayingNotifier;

  @override
  State<MusicListViewItem> createState() => _MusicListViewItemState();
}

class _MusicListViewItemState extends State<MusicListViewItem> {
  final MusicPlayer _musicPlayer = MusicPlayer();
  double progress = 0.0;
  Duration totalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;

  @override
  void initState() {
    super.initState();
    _musicPlayer.onDurationChanged.listen((duration) {
      if (mounted) {
        setState(() {
          totalDuration = duration;
        });
      }
    });

    _musicPlayer.onPositionChanged.listen((position) {
      if (mounted) {
        setState(() {
          currentPosition = position;
          progress = totalDuration.inMilliseconds > 0
              ? position.inMilliseconds / totalDuration.inMilliseconds
              : 0.0;
        });
      }
    });

    _musicPlayer.onPlayerComplete.listen((_) {
      if (mounted) {
        setState(() {
          progress = 0.0;
          widget.currentPlayingNotifier.value = null;
        });
      }
    });
  }

  void _togglePlayPause() {
    bool isPlaying = widget.currentPlayingNotifier.value == widget.musicData.id;
    if (isPlaying) {
      _musicPlayer.stopAudio();
      widget.currentPlayingNotifier.value = null;
    } else {
      _musicPlayer.playAudio(widget.musicData);
      widget.currentPlayingNotifier.value = widget.musicData.id;
    }
  }

  @override
  void dispose() {
    _musicPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xff011836),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Row(
                children: [
                  ValueListenableBuilder<String?>(
                    valueListenable: widget.currentPlayingNotifier,
                    builder: (context, currentPlaying, child) {
                      bool isPlaying = currentPlaying == widget.musicData.id;
                      return IconButton(
                        onPressed: _togglePlayPause,
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        iconSize: 32,
                      );
                    },
                  ),
                  Text(
                    widget.musicData.name,
                    style: TextStyles.font16WhiteMedium.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 280.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                          color: const Color(0xff1a2f4a),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 280.w * progress,
                        height: 6.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 8.w),
                  SvgPicture.asset(
                    'assets/images/mdi_sleep.svg',
                    // width: 200.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
