import 'package:flutter/material.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/ui/widgets/get_music_bloc_builder.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/ui/widgets/sweet_sleep_app_bar.dart';

class SweetSleepBody extends StatelessWidget {
  const SweetSleepBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SweetSleepAppBar(),
        Expanded(
          child: GetMusicBlocBuilder(),
        ),
      ],
    );
  }
}
