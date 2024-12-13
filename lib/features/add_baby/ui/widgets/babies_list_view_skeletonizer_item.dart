import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BabiesListViewSkeletonizerItem extends StatelessWidget {
  final String name;
  final String age;
  final String weight;
  final String height;
  final String gender;

  const BabiesListViewSkeletonizerItem({
    super.key,
    required this.name,
    required this.age,
    required this.weight,
    required this.height,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    final String babyImage =
        gender == 'Male' ? AppImages.boyBabyImage : AppImages.girlBabyImage;

    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
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
                    Image.asset(
                      babyImage,
                      width: 40.w,
                      height: 40.h,
                      fit: BoxFit.cover,
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
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  'Age: $age',
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
                ),
                SizedBox(width: 16.w),
                _buildStatColumn(
                  icon: Icons.straighten,
                  value: "$height cm",
                  label: "Height",
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
                _buildActionButton('Delete'),
                SizedBox(height: 8.h),
                _buildActionButton('Edit'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 20.sp),
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

  Widget _buildActionButton(String label) {
    return SizedBox(
      width: 56.w,
      height: 36.h,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          side: BorderSide(color: Colors.grey, width: 1.5.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 8.h),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeightHelper.medium,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}
