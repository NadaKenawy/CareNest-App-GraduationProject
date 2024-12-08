import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VaccinationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String data;

  const VaccinationItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border(
            left: BorderSide(
              color: ColorsManager.secondryBlueColor,
              width: 8.w,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            children: [
              InkWell(
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsManager.secondryBlueColor),
                  child: Padding(
                    padding: EdgeInsets.all(2.sp),
                    child: Icon(Icons.check, color: Colors.white, size: 24.sp),
                  ),
                ),
              ),
              SizedBox(width: 24.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeightHelper.semiBold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.black.withOpacity(.5),
                        fontWeight: FontWeightHelper.medium,
                        fontSize: 12.sp,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
