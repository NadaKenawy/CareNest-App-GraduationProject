import 'package:care_nest/features/entertainment/music_and_sweet_noise/ui/widgets/sweet_sleep_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/get_white_noise_response.dart';

class SweetSleepGroup extends StatefulWidget {
  const SweetSleepGroup({super.key, required this.whiteNoiseData});
  final List<WhiteNoiseData> whiteNoiseData;

  @override
  State<SweetSleepGroup> createState() => _SweetSleepGroupState();
}

class _SweetSleepGroupState extends State<SweetSleepGroup> {
  final List<String> icons = const [
    'assets/images/wind.png',
    'assets/images/vaccum_cleaner.png',
    'assets/images/clock.png',
    'assets/images/waves.png',
    'assets/images/lifebuoy.png',
    'assets/images/lightning_bolt.png',
    'assets/images/ocean.png',
    'assets/images/underwater.png',
    'assets/images/lips-silence.png',
    'assets/images/heart.png',
    'assets/images/hair-dryer.png',
    'assets/images/computer.png',
  ];

  ValueNotifier<String?> activeItemNotifier = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.whiteNoiseData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 24.w,
        mainAxisSpacing: 24.h,
      ),
      itemBuilder: (context, index) {
        return SweetSleepItem(
          icon: icons[index],
          whiteNoiseData: widget.whiteNoiseData[index],
          activeItemNotifier: activeItemNotifier,
        );
      },
    );
  }
}
