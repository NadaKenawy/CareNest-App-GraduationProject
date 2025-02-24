import 'package:care_nest/features/entertainment/entertainment_app_bar.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/ui/widgets/get_music_bloc_builder.dart';
import 'package:flutter/material.dart';

class EntertainmentScreenBody extends StatelessWidget {
  const EntertainmentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          EntertainmentAppBar(),
          Expanded(child: GetMusicBlocBuilder()),
        ],
      ),
    );
  }
}
