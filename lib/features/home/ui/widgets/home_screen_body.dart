import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/features/home/ui/widgets/baby_cry_container.dart';
import 'package:care_nest/features/home/ui/widgets/large_card.dart';
import 'package:care_nest/features/home/ui/widgets/home_tittle.dart';
import 'package:care_nest/features/home/ui/widgets/reminders_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeTittle(),
            SizedBox(height: 32.h),
            const BabyCryContainer(),
            SizedBox(height: 56.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LargeCard(
                  imagePath: 'assets/images/baby-weighting.png',
                  title: 'Baby Growth',
                  description: "Track every stage of your baby's growth!",
                  backgroundColor: ColorsManager.secondryBlueColor,
                ),
                RemindersCard()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
