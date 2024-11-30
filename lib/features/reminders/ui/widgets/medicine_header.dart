import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/utils/app_images.dart';

class MedicineHeader extends StatelessWidget {
  const MedicineHeader({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 132.w,
          height: 132.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsManager.secondryBlueColor.withOpacity(.1),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Image.asset(
              AppImages.medicineIcon,
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          text ?? 'Add Medicine',
          style: TextStyle(
            fontWeight: FontWeightHelper.semiBold,
            fontSize: 28.sp,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
