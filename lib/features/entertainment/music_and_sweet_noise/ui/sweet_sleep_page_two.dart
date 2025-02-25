import 'package:care_nest/features/entertainment/music_and_sweet_noise/ui/widgets/get_white_noise_bloc_builder.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/ui/widgets/sweet_sleep_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SweetSleepPageTwo extends StatelessWidget {
  const SweetSleepPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SweetSleepAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const GetWhiteNoiseBlocBuilder(),
        ),
      ],
    );
  }
}
