import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styless.dart';

class EntertainmentAppBar extends StatelessWidget {
  const EntertainmentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/entertainment_appbar.png',
        ),
        Positioned(
          top: 35.h,
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, top: 11.5.h),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  'Sweet Sleep',
                  style: TextStyles.font24WhiteMedium,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 110.h,
          left: 185.w,
          child: Row(
            children: [
              Container(
                height: 15.h,
                width: 15.w,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                height: 15.h,
                width: 15.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
