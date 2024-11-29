// ignore_for_file: deprecated_member_use
import 'dart:developer';

import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_state.dart';
import 'package:care_nest/features/reminders/logic/get_all_medication_schedule_cubit/get_all_medication_schedule_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidebarx/sidebarx.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    super.key,
    required this.controller,
  });
  final SidebarXController controller;
  @override
  Widget build(BuildContext context) {
    context.read<GetAllBabiesCubit>().getAllBabies();
    return BlocBuilder<GetAllBabiesCubit, GetAllBabiesState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Success) {
          final babiesList = state.babiesData;
          if (babiesList == null || babiesList.isEmpty) {
            return const Center(child: Text('No babies available.'));
          }
          return SidebarX(
            controller: controller,
            theme: SidebarXTheme(
              margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 28.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.sp),
              ),
              hoverColor: Colors.white.withOpacity(0.8),
              textStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
              selectedTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeightHelper.semiBold,
              ),
              itemTextPadding: EdgeInsets.only(left: 16.w),
              selectedItemTextPadding: EdgeInsets.only(left: 16.w),
              itemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.sp),
              ),
              selectedItemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.sp),
                gradient: const LinearGradient(
                  colors: [
                    ColorsManager.fourthryBlueColor,
                    ColorsManager.fourthryPinkColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              iconTheme: const IconThemeData(
                color: Colors.black,
                size: 20,
              ),
              selectedIconTheme: const IconThemeData(
                color: Colors.white,
              ),
            ),
            extendedTheme: SidebarXTheme(
              width: 250.w,
              decoration: const BoxDecoration(color: Colors.white),
            ),
            items: [
              ...babiesList.map(
                (baby) => SidebarXItem(
                  iconWidget: Image.asset(
                    baby.gender == 'Male'
                        ? AppImages.boyBabyImage
                        : AppImages.girlBabyImage,
                    width: 48.r,
                  ),
                  label: baby.name ?? 'Unknown',
                  onTap: () async {
                    context
                        .read<GetAllMedicationScheduleCubit>()
                        .getAllMedicationSchedule(baby.id!);
                    log('baby id: ${baby.id}');
                    await saveBabyId(baby.id ?? '');
                  },
                ),
              ),
              SidebarXItem(
                iconWidget: Image.asset(
                  'assets/images/Boy&Girl.png',
                  width: 48.r,
                ),
                label: 'All Reminders',
                onTap: () {},
              ),
            ],
          );
        } else if (state is Error) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return const Center(child: Text('No data available.'));
        }
      },
    );
  }

  Future<void> saveBabyId(String id) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.babyId, id);

    log("Saved id: ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyId)}");
  }
}
