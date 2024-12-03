import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:care_nest/features/add_baby/logic/delete_baby_cubit/delete_baby_cubit.dart';
import 'package:care_nest/features/add_baby/logic/delete_baby_cubit/delete_baby_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class BabyContainer extends StatelessWidget {
  final String gender;
  final String name;
  final String babyId;

  const BabyContainer({
    super.key,
    required this.gender,
    required this.name,
    required this.babyId,
  });

  @override
  Widget build(BuildContext context) {
    final Color containerColor = gender == 'Male'
        ? ColorsManager.secondryBlueColor
        : ColorsManager.primaryPinkColor;
    final String babyImage =
        gender == 'Male' ? AppImages.boyBabyImage : AppImages.girlBabyImage;

    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
        border: Border.all(
          color: containerColor,
        ),
        boxShadow: [
          BoxShadow(
            color: containerColor.withOpacity(0.5),
            blurRadius: 10.r,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        child: Row(
          children: [
            Image.asset(
              babyImage,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Text(
                '${name[0].toUpperCase()}${name.substring(1)}',
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeightHelper.semiBold,
                  fontSize: 28.sp,
                ),
              ),
            ),
            SizedBox(width: 24.w),
            BlocBuilder<DeleteBabyCubit, DeleteBabyState>(
              builder: (context, state) {
                return IconButton(
                  color: containerColor,
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      animType: AnimType.bottomSlide,
                      title: 'Delete Baby',
                      desc: 'Are you sure you want to delete this baby?',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        context
                            .read<DeleteBabyCubit>()
                            .deleteBaby(babyId, context);
                      },
                    ).show();
                  },
                  icon: const Icon(Icons.remove_circle_outline_outlined),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
