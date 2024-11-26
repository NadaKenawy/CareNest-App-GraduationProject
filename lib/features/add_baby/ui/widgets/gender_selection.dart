import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderSelection extends StatelessWidget {
  final Gradient gradient;
  final String gender;
  final ValueChanged<String>? onChanged;

  const GenderSelection({
    super.key,
    required this.gradient,
    required this.gender,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          gender == 'Male' || gender == 'Female'
              ? Text(
                  'Gender:',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: gender == 'Male'
                        ? ColorsManager.secondryBlueColor
                        : ColorsManager.primaryPinkColor,
                  ),
                )
              : ShaderMask(
                  shaderCallback: (bounds) {
                    return gradient.createShader(bounds);
                  },
                  child: Text(
                    'Gender:',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = gradient.createShader(
                          const Rect.fromLTWH(0.0, 0.0, 0.0, 50.0),
                        ),
                    ),
                  ),
                ),
          SizedBox(width: 16.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Radio(
                    value: 'Female',
                    groupValue: gender,
                    activeColor: ColorsManager.primaryPinkColor,
                    onChanged: (value) => onChanged!(value.toString()),
                  ),
                  Text(
                    'Girl',
                    style: TextStyle(
                      color: gender == 'Female'
                          ? ColorsManager.primaryPinkColor
                          : Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 24.w),
              Row(
                children: [
                  Radio(
                    value: 'Male',
                    groupValue: gender,
                    activeColor: ColorsManager.secondryBlueColor,
                    onChanged: (value) => onChanged!(value.toString()),
                  ),
                  Text(
                    'Boy',
                    style: TextStyle(
                      color: gender == 'Male'
                          ? ColorsManager.secondryBlueColor
                          : Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
