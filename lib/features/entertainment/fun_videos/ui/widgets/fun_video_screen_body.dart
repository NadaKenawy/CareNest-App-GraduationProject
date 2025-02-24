import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/entertainment/fun_videos/logic/get_all_channels_cubit.dart';
import 'package:care_nest/features/entertainment/fun_videos/logic/get_all_channels_state.dart';
import 'package:care_nest/features/entertainment/fun_videos/ui/video_player_screen.dart';
import 'package:care_nest/features/entertainment/fun_videos/ui/widgets/channels_list.dart';
import 'package:care_nest/features/entertainment/fun_videos/ui/widgets/videos_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunVideoScreenBody extends StatefulWidget {
  const FunVideoScreenBody({super.key});

  @override
  State<FunVideoScreenBody> createState() => _FunVideoScreenBodyState();
}

class _FunVideoScreenBodyState extends State<FunVideoScreenBody> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<GetAllChannelsCubit>().getAllChannels();
  }

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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: BlocBuilder<GetAllChannelsCubit, GetAllChannelsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  success: (channelsData) {
                    if (channelsData == null || channelsData.isEmpty) {
                      return Center(
                        child: Text(
                          'No channels available',
                          style: TextStyles.font20BlackSemiBold,
                        ),
                      );
                    }
                    if (selectedIndex >= channelsData.length) {
                      selectedIndex = 0;
                    }
                    final selectedChannel = channelsData[selectedIndex];
                    return Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Fun Videos',
                              style: TextStyles.font20BlackSemiBold,
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        ChannelsList(
                          channels: channelsData,
                          selectedIndex: selectedIndex,
                          onChannelSelected: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                        SizedBox(height: 12.h),
                        Expanded(
                          child: VideosList(
                            videos: selectedChannel.videos,
                            onVideoTap: (video) {
                              final videoId = extractYouTubeId(video.url ?? '');
                              if (videoId != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        VideoPlayerScreen(videoId: videoId),
                                    fullscreenDialog: true,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  error: (apiErrorModel) => Center(
                    child: Text(
                      apiErrorModel.message ?? 'Error occurred',
                      style: TextStyles.font20BlackSemiBold,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
