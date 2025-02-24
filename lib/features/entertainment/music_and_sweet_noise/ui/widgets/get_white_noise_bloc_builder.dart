import 'package:care_nest/features/entertainment/music_and_sweet_noise/data/models/get_white_noise_response.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/logic/get_white_noise/get_white_noise_state.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/ui/widgets/sweet_sleep_group.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/ui/widgets/sweet_sleep_group_skeletonizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/get_white_noise/get_white_noise_cubit.dart';

class GetWhiteNoiseBlocBuilder extends StatelessWidget {
  const GetWhiteNoiseBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWhiteNoiseCubit, GetWhiteNoiseState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () {
              return setupLoading();
            },
            success: (whiteNoiseData) {
              var whiteNoiseList = List<WhiteNoiseData>.from(whiteNoiseData);

              return setupSuccess(whiteNoiseList);
            },
            error: (error) {
              return setupError();
            },
            orElse: () => const SizedBox.shrink());
      },
    );
  }

  Widget setupLoading() {
    return const SweetSleepGroupSkeletonizer();
  }

  Widget setupSuccess(List<WhiteNoiseData> whiteList) {
    return SweetSleepGroup(whiteNoiseData: whiteList);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
