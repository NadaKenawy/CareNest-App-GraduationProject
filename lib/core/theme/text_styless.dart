import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font16PrimaryBlueRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.primaryBlueColor,
  );

  static TextStyle font14PrimaryBlueRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.primaryBlueColor,
  );

  static TextStyle font24PrimaryBlueSemiBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.primaryBlueColor,
  );

  static TextStyle font24PrimaryBlueBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.primaryBlueColor,
  );

  static TextStyle font36PrimaryBlueBold = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.primaryBlueColor,
  );

  static TextStyle font16SecondaryBlueBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.secondryBlueColor,
  );

  static TextStyle font20SecondaryBlueMedium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.secondryBlueColor,
  );

  static TextStyle font16WhiteBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.white,
  );

  static TextStyle font16PrimaryPinkSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.primaryPinkColor,
  );

  static TextStyle font24PrimaryPinkBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.primaryPinkColor,
  );

  static TextStyle font20BlackSemiBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.black,
  );

  static TextStyle font16PrimaryBlackMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
  );
}
