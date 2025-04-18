import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_styless.dart';

class ProfileNameAndBio extends StatelessWidget {
  const ProfileNameAndBio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Mahmoud Aladwy',
          style: TextStyles.font24PrimaryBlueBold.copyWith(
            color: Colors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Keep going, you’re doing great! ❤️',
          style: TextStyles.font16PrimaryBlueRegular.copyWith(
            color: Colors.black,
          ),
        )
      ],
    );
  }
}