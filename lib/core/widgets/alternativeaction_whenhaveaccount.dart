import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlternativeActionWhenHaveAccount extends StatelessWidget {
  final String textLabel;
  final String textButtonLabel;
  final Function()? onTap;
  const AlternativeActionWhenHaveAccount({
    super.key,
    required this.textLabel,
    required this.textButtonLabel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textLabel,
          style: TextStyles.font16BlueRegular,
        ),
        SizedBox(
          width: 5.w,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            textButtonLabel,
            style: TextStyle(
              color: ColorsManager.primaryPinkColor,
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        )
      ],
    );
  }
}
