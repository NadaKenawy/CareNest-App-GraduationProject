import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';

class ReceivedMessageBubble extends StatelessWidget {
  final String text;
  final String time;
  final String avatarUrl;
  final List<String>? images;
  final String? mediaUrl;
  final String? mediaType;

  const ReceivedMessageBubble({
    super.key,
    required this.text,
    required this.time,
    required this.avatarUrl,
    this.images,
    this.mediaUrl,
    this.mediaType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: avatarUrl.startsWith('http')
                ? NetworkImage(avatarUrl)
                : AssetImage(avatarUrl) as ImageProvider,
          ),
          SizedBox(width: 8.w),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (text.isNotEmpty)
                        Text(
                          text,
                          style: TextStyles.font12BlackMedium
                              .copyWith(fontSize: 14.sp),
                        ),
                      if (images != null && images!.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: images!.map((imageUrl) {
                            return Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: imageUrl.startsWith('/') ||
                                        imageUrl.startsWith('file:')
                                    ? Image.file(
                                        File(imageUrl),
                                        width: 200.w,
                                        height: 200.h,
                                        fit: BoxFit.cover,
                                      )
                                    : CachedNetworkImage(
                                        imageUrl: imageUrl,
                                        width: 200.w,
                                        height: 200.h,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Container(
                                          width: 200.w,
                                          height: 200.h,
                                          color: Colors.grey[300],
                                          child: const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          width: 200.w,
                                          height: 200.h,
                                          color: Colors.grey[300],
                                          child: const Icon(Icons.error),
                                        ),
                                      ),
                              ),
                            );
                          }).toList(),
                        ),
                      if (mediaUrl != null &&
                          (mediaType?.startsWith('audio') ?? false))
                        VoiceMessagePlayer(url: mediaUrl!),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                    fontFamily: 'Fredoka',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SentMessageBubble extends StatelessWidget {
  final String text;
  final String time;
  final List<String>? images;
  final String? mediaUrl;
  final String? mediaType;
  final VoidCallback? onLongPress;

  const SentMessageBubble({
    super.key,
    required this.text,
    required this.time,
    this.images,
    this.mediaUrl,
    this.mediaType,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onLongPress: onLongPress,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: ColorsManager.primaryPinkColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                        bottomLeft: Radius.circular(16.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (text.isNotEmpty)
                          Text(
                            text,
                            style: TextStyles.font16WhiteMedium
                                .copyWith(fontSize: 14.sp),
                          ),
                        if (images != null && images!.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: images!.map((imageUrl) {
                              return Padding(
                                padding: EdgeInsets.only(top: 8.h),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: imageUrl.startsWith('/') ||
                                          imageUrl.startsWith('file:')
                                      ? Image.file(
                                          File(imageUrl),
                                          width: 200.w,
                                          height: 200.h,
                                          fit: BoxFit.cover,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl: imageUrl,
                                          width: 200.w,
                                          height: 200.h,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              Container(
                                            width: 200.w,
                                            height: 200.h,
                                            color: Colors.grey[300],
                                            child: const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Container(
                                            width: 200.w,
                                            height: 200.h,
                                            color: Colors.grey[300],
                                            child: const Icon(Icons.error),
                                          ),
                                        ),
                                ),
                              );
                            }).toList(),
                          ),
                        if (mediaUrl != null &&
                            (mediaType?.startsWith('audio') ?? false))
                          VoiceMessagePlayer(url: mediaUrl!),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                    fontFamily: 'Fredoka',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VoiceMessagePlayer extends StatefulWidget {
  final String url;
  const VoiceMessagePlayer({super.key, required this.url});

  @override
  State<VoiceMessagePlayer> createState() => _VoiceMessagePlayerState();
}

class _VoiceMessagePlayerState extends State<VoiceMessagePlayer> {
  late AudioPlayer _player;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.onDurationChanged.listen((d) => setState(() => _duration = d));
    _player.onPositionChanged.listen((p) => setState(() => _position = p));
    _player.onPlayerComplete.listen((_) => setState(() {
          _isPlaying = false;
          _position = Duration.zero;
        }));
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _togglePlay() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.play(UrlSource(widget.url));
    }
    setState(() => _isPlaying = !_isPlaying);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: _togglePlay,
        ),
        Expanded(
          child: Slider(
            value: _position.inSeconds.toDouble(),
            max: _duration.inSeconds.toDouble() > 0
                ? _duration.inSeconds.toDouble()
                : 1,
            onChanged: (value) async {
              final pos = Duration(seconds: value.toInt());
              await _player.seek(pos);
            },
          ),
        ),
        Text(
          "${_position.inSeconds}/${_duration.inSeconds} sec",
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
