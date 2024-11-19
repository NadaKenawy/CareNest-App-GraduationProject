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
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return gradient.createShader(bounds);
            },
            child: Text(
              'Gender: ',
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
          Expanded(
            child: RadioListTile(
              value: 'Girl',
              groupValue: gender,
              title: const Text('Girl'),
              onChanged: (value) => onChanged(value.toString()),
            ),
          ),
          Expanded(
            child: RadioListTile(
              value: 'Boy',
              groupValue: gender,
              title: const Text('Boy'),
              onChanged: (value) => onChanged(value.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
