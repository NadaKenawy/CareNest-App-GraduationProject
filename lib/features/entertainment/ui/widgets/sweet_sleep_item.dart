import 'package:care_nest/features/entertainment/data/models/get_white_noise_response.dart';
import 'package:care_nest/features/entertainment/ui/widgets/music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SweetSleepItem extends StatefulWidget {
  const SweetSleepItem(
      {super.key, required this.icon, required this.whiteNoiseData});

  final String icon;
  final WhiteNoiseData whiteNoiseData;

  @override
  State<SweetSleepItem> createState() => _SweetSleepItemState();
}

class _SweetSleepItemState extends State<SweetSleepItem> {
  final MusicPlayer _musicPlayer = MusicPlayer(); 
  bool isPlaying = false; 

  void _togglePlay() {
    if (isPlaying) {
      _musicPlayer.stopAudio();
    } else {
      _musicPlayer.playAudioWhite(widget.whiteNoiseData);
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    _musicPlayer.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlay, 
      child: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: isPlaying
              ? Colors.green
              : const Color(0xff011836), 
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Image.asset(
            widget.icon,
            height: 60.h,
            width: 60.w,
          ),
        ),
      ),
    );
  }
}
