import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:care_nest/features/add_baby/logic/delete_baby_cubit/delete_baby_cubit.dart';
import 'package:care_nest/features/add_baby/logic/delete_baby_cubit/delete_baby_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BabyContainer extends StatelessWidget {
  final String gender;
  final String name;
  final String dateOfBirth;
  final String babyId;
  final String weight;
  final String height;
  final void Function()? onPressed;

  const BabyContainer({
    super.key,
    required this.gender,
    required this.name,
    required this.babyId,
    required this.dateOfBirth,
    required this.weight,
    required this.height,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Color containerColor = gender == 'Male'
        ? ColorsManager.secondryBlueColor
        : ColorsManager.primaryPinkColor;
    final String babyImage =
        gender == 'Male' ? AppImages.boyBabyImage : AppImages.girlBabyImage;

    DateTime birthDate = DateTime.parse(dateOfBirth);
    DateTime currentDate = DateTime.now();
    int differenceInDays = currentDate.difference(birthDate).inDays;
    String displayAge;
    if (differenceInDays < 7) {
      displayAge = "$differenceInDays day${differenceInDays > 1 ? 's' : ''}";
    } else if (differenceInDays < 30) {
      int weeks = (differenceInDays / 7).floor();
      displayAge = "$weeks week${weeks > 1 ? 's' : ''}";
    } else if (differenceInDays < 30 * 12) {
      int months = (differenceInDays / 30).floor();
      displayAge = "$months month${months > 1 ? 's' : ''}";
    } else {
      int years = (differenceInDays / 365).floor();
      displayAge = "$years year${years > 1 ? 's' : ''}";
    }
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
        border: Border.all(
          color: containerColor,
          width: 1.5.w,
        ),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage(babyImage),
                        size: 24.sp,
                        color: containerColor,
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        '${name[0].toUpperCase()}${name.substring(1)}',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeightHelper.semiBold,
                          fontSize: 20.sp,
                          color: containerColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    displayAge,
                    style: TextStyle(
                      fontWeight: FontWeightHelper.semiBold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              VerticalDivider(
                color: Colors.grey[300],
                thickness: 1,
                width: 16.w,
                indent: 10.h,
                endIndent: 10.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildStatColumn(
                    icon: Icons.monitor_weight_outlined,
                    value: "$weight kg",
                    label: "Weight",
                    color: containerColor,
                  ),
                  SizedBox(width: 16.w),
                  _buildStatColumn(
                    icon: Icons.straighten,
                    value: "$height cm",
                    label: "Height",
                    color: containerColor,
                  ),
                ],
              ),
              VerticalDivider(
                color: Colors.grey[300],
                thickness: 1,
                width: 16.w,
                indent: 10.h,
                endIndent: 10.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<DeleteBabyCubit, DeleteBabyState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: 56.w,
                        height: 36.h,
                        child: TextButton(
                          onPressed: () {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              animType: AnimType.bottomSlide,
                              title: 'Delete Baby',
                              desc:
                                  'Are you sure you want to delete this baby?',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {
                                context
                                    .read<DeleteBabyCubit>()
                                    .deleteBaby(babyId, context);
                              },
                            ).show();
                          },
                          style: TextButton.styleFrom(
                            side:
                                BorderSide(color: containerColor, width: 1.5.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                          ),
                          child: Text(
                            'Delete',
                            style: TextStyle(
                              color: containerColor,
                              fontWeight: FontWeightHelper.medium,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: 56.w,
                    height: 36.h,
                    child: TextButton(
                      onPressed: onPressed,
                      style: TextButton.styleFrom(
                        side: BorderSide(color: containerColor, width: 1.5.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                      ),
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          color: containerColor,
                          fontWeight: FontWeightHelper.medium,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Widget _buildStatColumn({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 20.sp),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeightHelper.semiBold,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
