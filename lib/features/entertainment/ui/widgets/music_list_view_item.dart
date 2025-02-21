import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/text_styless.dart';

class MusicListViewItem extends StatelessWidget {
  const MusicListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 115.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xff011836),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.w, top: 8.h),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                    iconSize: 40,
                  ),
                  Text(
                    'Brahms\' Lullaby',
                    style: TextStyles.font16WhiteBold.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 25.w,
                right: 8.w,
              ),
              child: Row(
                children: [
                  Container(
                    width: 280.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff1a2f4a),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  SvgPicture.asset('assets/images/sleep_icon.svg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
