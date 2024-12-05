import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeTittle extends StatelessWidget {
  const HomeTittle({
    super.key,
    required this.userName,
  });
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, ${userName[0].toUpperCase()}${userName.substring(1)}',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
            Text(
              'Your Baby’s First Steps',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: ColorsManager.primaryPinkColor,
          ),
          child: IconButton(
            icon: const FaIcon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kNotificationsScreen);
            },
          ),
        ),
      ],
    );
  }
}
