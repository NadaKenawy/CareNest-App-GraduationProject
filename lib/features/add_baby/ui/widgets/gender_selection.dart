import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderSelection extends StatelessWidget {
  final Gradient gradient;
  final String gender;
  final ValueChanged<String> onChanged;

  const GenderSelection({
    super.key,
    required this.gradient,
    required this.gender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        // Using Row to align all elements horizontally
        mainAxisAlignment: MainAxisAlignment.center, // Center the row content
        children: [
          // النص "Gender"
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
          SizedBox(
              width: 16.w), // Add space between the label and radio buttons
          // اختيار الجندر
          Expanded(
            child: Row(
              // Using another Row to layout the radio buttons horizontally
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: RadioListTile(
                    value: 'Female',
                    groupValue: gender,
                    title: Text(
                      'Girl',
                      style: TextStyle(
                        color: gender == 'Female'
                            ? ColorsManager.primaryPinkColor
                            : Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                    activeColor: ColorsManager.primaryPinkColor,
                    onChanged: (value) => onChanged(value.toString()),
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: 'Male',
                    groupValue: gender,
                    title: Text(
                      'Boy',
                      style: TextStyle(
                        color: gender == 'Male'
                            ? ColorsManager.secondryBlueColor
                            : Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                    activeColor: ColorsManager.secondryBlueColor,
                    onChanged: (value) => onChanged(value.toString()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
