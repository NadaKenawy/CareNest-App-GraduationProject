import 'package:care_nest/features/entertainment/ui/widgets/entertainment_app_bar.dart';
import 'package:care_nest/features/entertainment/ui/widgets/music_list_view_item.dart';
import 'package:flutter/material.dart';

class EntertainmentScreenBody extends StatelessWidget {
  const EntertainmentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          EntertainmentAppBar(),
          MusicListViewItem(),
        ],
      ),
    );
  }
}
