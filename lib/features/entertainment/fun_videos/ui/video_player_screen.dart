import 'package:care_nest/features/entertainment/fun_videos/ui/widgets/video_player_screen_body.dart';
import 'package:flutter/material.dart';

class VideoPlayerScreen extends StatelessWidget {
  final String videoId;
  const VideoPlayerScreen({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: VideoPlayerScreenBody(videoId: videoId),
    );
  }
}
