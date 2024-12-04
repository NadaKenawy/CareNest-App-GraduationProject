import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/theme/colors_manager.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.white,
      shape: const CircleBorder(
        side: BorderSide(
          color: ColorsManager.primaryPinkColor,
        ),
      ),
      child: Icon(
        Icons.add,
        size: 32.sp,
        color: ColorsManager.primaryPinkColor,
      ),
    );
  }
}
