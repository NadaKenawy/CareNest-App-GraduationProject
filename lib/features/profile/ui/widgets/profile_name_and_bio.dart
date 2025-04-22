import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/user_model.dart';
import '../../../../core/theme/text_styless.dart';

class ProfileNameAndBio extends StatelessWidget {
  const ProfileNameAndBio({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${user.firstname} ${user.lastname}',
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
