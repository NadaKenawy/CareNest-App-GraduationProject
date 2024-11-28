// ignore_for_file: deprecated_member_use

import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:care_nest/features/add_baby/data/models/get_all_babies/get_all_babies_response.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidebarx/sidebarx.dart';
import '../../../../features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    super.key,
    required this.controller,
  });

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllBabiesCubit, GetAllBabiesState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Success && state.babiesData != null) {
          final List<BabiesData> babiesList = state.babiesData!;

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
                  fontWeight: FontWeightHelper.semiBold),
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
              iconTheme: IconThemeData(
                color: Colors.black.withOpacity(0.7),
                size: 20,
              ),
              selectedIconTheme: const IconThemeData(
                color: Colors.white,
                size: 20,
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
                  onTap: () {},
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
          return const Center(child: Text('Error loading babies.'));
        } else {
          return const Center(child: Text('No data.'));
        }
      },
    );
  }
}
