import 'package:care_nest/core/utils/colors.dart';
import 'package:care_nest/core/utils/font_weight_helper.dart';
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
        Text(textLabel,
            style: TextStyle(
              color: ColorsData.primaryBlueColor,
              fontSize: 16.sp,
            )),
        SizedBox(
          width: 5.w,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            textButtonLabel,
            style: TextStyle(
                color: ColorsData.primaryPinkColor,
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.semiBold),
          ),
        )
      ],
    );
  }
}
