import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoNotificationsText extends StatelessWidget {
  const NoNotificationsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.notificationsIcon,
            width: 100.w,
          ),
          SizedBox(height: 24.h),
          Text(
            'There Is No Notification Yet',
            style: TextStyle(
                fontSize: 24.sp, fontWeight: FontWeightHelper.semiBold),
          ),
          SizedBox(height: 120.h),
        ],
      ),
    );
  }
}
