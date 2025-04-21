import 'dart:developer';

import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:care_nest/features/home/ui/widgets/baby_cry_container.dart';
import 'package:care_nest/features/home/ui/widgets/communtiy_card.dart';
import 'package:care_nest/features/home/ui/widgets/large_card.dart';
import 'package:care_nest/features/home/ui/widgets/home_tittle.dart';
import 'package:care_nest/features/home/ui/widgets/mama_tips_card.dart';
import 'package:care_nest/features/home/ui/widgets/reminders_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/logic/user_cubit/user_cubit.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserCubit>().state.user;
    log('Profile screen got user: ${user?.firstname}');
    if (user == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTittle(
                userName: user.firstname,
              ),
              SizedBox(height: 32.h),
              const BabyCryContainer(),
              SizedBox(height: 60.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      LargeCard(
                        imagePath: AppImages.babyWeightingImage,
                        title: 'Baby Growth',
                        description: "Track every stage of your baby's growth",
                        backgroundColor: ColorsManager.secondryBlueColor,
                        onPressed: () {},
                        routePath: AppRouter.kBabyHeightGrowthScreen,
                      ),
                      const SizedBox(height: 20),
                      const MamaTipsCard(),
                    ],
                  ),
                  SizedBox(width: 14.w),
                  Column(
                    children: [
                      const RemindersCard(),
                      const SizedBox(height: 20),
                      LargeCard(
                        imagePath: AppImages.doctorsImage,
                        title: 'Doctors',
                        description:
                            "Expert care available for your little one",
                        backgroundColor: const Color(0xffBB87E0),
                        onPressed: () {},
                        routePath: AppRouter.kDoctorsScreen,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LargeCard(
                    imagePath: AppImages.entertainmentImage,
                    title: 'Entertainment',
                    description:
                        "Stories, videos, and music for a relaxed baby",
                    backgroundColor: ColorsManager.thirdryBlueColor,
                    onPressed: () {},
                    routePath: AppRouter.kEntertainmentScreen,
                  ),
                  const SizedBox(height: 20),
                  LargeCard(
                    imagePath: AppImages.shoppingImage,
                    title: 'Shopping',
                    description: "Seamless shopping for every baby moment",
                    backgroundColor: ColorsManager.thirdryPinkColor,
                    onPressed: () {},
                    routePath: '',
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
