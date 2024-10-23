import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DontHaveAnAccount extends StatelessWidget {
  final String textLabel;
  final String textButtonLabel;
  final Function()? onTap;
  const DontHaveAnAccount({
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
          style: TextStyles.font16PrimaryBlueRegular,
        ),
        SizedBox(
          width: 5.w,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            textButtonLabel,
            style: TextStyles.font16PrimaryPinkSemiBold,
          ),
        )
      ],
    );
  }
}
