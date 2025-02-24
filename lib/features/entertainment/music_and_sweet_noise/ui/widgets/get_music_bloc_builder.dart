import 'package:care_nest/features/entertainment/music_and_sweet_noise/data/models/get_music_response.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/logic/get_music_cubit/get_music_state.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/ui/widgets/music_list_view.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/ui/widgets/music_list_view_skeletonizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/get_music_cubit/get_music_cubit.dart';

class GetMusicBlocBuilder extends StatelessWidget {
  const GetMusicBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMusicCubit, GetMusicState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () {
              return setupLoading();
            },
            success: (musicData) {
              var musicList = List<MusicData>.from(musicData);

              return setupSuccess(musicList);
            },
            error: (error) {
              return setupError();
            },
            orElse: () => const SizedBox.shrink());
      },
    );
  }

  Widget setupLoading() {
    return const MusicListViewSkeletonizer();
  }

  Widget setupSuccess(List<MusicData> musicList) {
    return MusicListView(
      musicList: musicList,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
