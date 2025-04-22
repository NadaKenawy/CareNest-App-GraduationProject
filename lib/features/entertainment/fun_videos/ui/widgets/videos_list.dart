import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideosList extends StatelessWidget {
  final List? videos;
  final ValueChanged<dynamic> onVideoTap;

  const VideosList({
    super.key,
    required this.videos,
    required this.onVideoTap,
  });

  String? extractYouTubeId(String url) {
    try {
      final uri = Uri.parse(url);
      if (uri.host.contains('youtube.com')) {
        return uri.queryParameters['v'];
      } else if (uri.host.contains('youtu.be')) {
        return uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : null;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (videos == null || videos!.isEmpty) {
      return Center(
        child: Text(
          'No videos available',
          style: TextStyles.font20BlackSemiBold,
        ),
      );
    }
    return ListView.builder(
      itemCount: videos!.length,
      itemBuilder: (context, index) {
        final video = videos![index];
        final videoId = extractYouTubeId(video.url ?? '');
        final thumbnailUrl = videoId != null
            ? 'https://img.youtube.com/vi/$videoId/0.jpg'
            : 'assets/images/hq720 (1).jpg';
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => onVideoTap(video),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: thumbnailUrl.isNotEmpty
                      ? Image.network(
                          thumbnailUrl,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        )
                      : const SizedBox(),
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  video.name ?? '',
                  style: TextStyles.font20BlackSemiMedium,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
