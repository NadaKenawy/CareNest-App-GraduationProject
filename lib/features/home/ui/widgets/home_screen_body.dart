import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/features/home/ui/widgets/baby_cry_container.dart';
import 'package:care_nest/features/home/ui/widgets/communtiy_card.dart';
import 'package:care_nest/features/home/ui/widgets/large_card.dart';
import 'package:care_nest/features/home/ui/widgets/home_tittle.dart';
import 'package:care_nest/features/home/ui/widgets/mama_tips_card.dart';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTittle(),
              SizedBox(height: 32.h),
              const BabyCryContainer(),
              SizedBox(height: 60.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    children: [
                      LargeCard(
                        imagePath: 'assets/images/baby-weighting.png',
                        title: 'Baby Growth',
                        description: "Track every stage of your baby's growth",
                        backgroundColor: ColorsManager.secondryBlueColor,
                      ),
                      SizedBox(height: 20),
                      MamaTipsCard(),
                    ],
                  ),
                  SizedBox(width: 14.w),
                  const Column(
                    children: [
                      RemindersCard(),
                      SizedBox(height: 20),
                      LargeCard(
                        imagePath: 'assets/images/doctors.png',
                        title: 'Doctors',
                        description:
                            "Expert care available for your little one",
                        backgroundColor: Color(0xffBB87E0),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LargeCard(
                    imagePath: 'assets/images/entertainment.png',
                    title: 'Entertainment',
                    description:
                        "Stories, videos, and music for a relaxed baby",
                    backgroundColor: ColorsManager.thirdryBlueColor,
                  ),
                  SizedBox(height: 20),
                  LargeCard(
                    imagePath: 'assets/images/shopping.png',
                    title: 'Shopping',
                    description: "Seamless shopping for every baby moment",
                    backgroundColor: ColorsManager.thirdryPinkColor,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CommuntiyCard(),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
