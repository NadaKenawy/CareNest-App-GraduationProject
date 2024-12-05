// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/add_baby/ui/widgets/my_babies_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../logic/get_all_babies_cubit/get_all_babies_cubit.dart';

class MyBabiesScreenBody extends StatelessWidget {
  const MyBabiesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'My Babies',
          style: TextStyles.font20BlackSemiBold,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 32.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: 16.w,
                left: 16.w,
              ),
              child: const MyBabiesBlocBuilder(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
            child: AppTextButton(
              buttonText: 'Add New Baby',
              textStyle: TextStyles.font16WhiteBold,
              gradientColors: const [
                ColorsManager.secondryBlueColor,
                ColorsManager.primaryPinkColor,
              ],
              onPressed: () {
                GoRouter.of(context)
                    .push(AppRouter.kAddBabyScreen)
                    .then((value) {
                  if (value == true) {
                    log('update baby done');
                    context.read<GetAllBabiesCubit>().getAllBabies();
                  } else {
                    log('update baby not done');
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
