import 'package:care_nest/features/entertainment/ui/widgets/music_list_view_item.dart';
import 'package:flutter/material.dart';

import '../../data/models/get_music_response.dart';

class MusicListView extends StatefulWidget {
  const MusicListView({
    super.key,
    required this.musicList,
  });
  final List<MusicData> musicList;

  @override
  State<MusicListView> createState() => _MusicListViewState();
}

class _MusicListViewState extends State<MusicListView> {
  ValueNotifier<String?> currentPlayingNotifier = ValueNotifier<String?>(null);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.musicList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: MusicListViewItem(
              musicData: widget.musicList[index],
              currentPlayingNotifier: currentPlayingNotifier,
            ),
          );
        });
  }
}
