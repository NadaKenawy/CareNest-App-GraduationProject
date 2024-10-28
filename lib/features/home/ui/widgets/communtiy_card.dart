import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/features/home/ui/widgets/forward_arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommuntiyCard extends StatelessWidget {
  const CommuntiyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xff8794C3),
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff8794C3).withOpacity(0.5),
            offset: const Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      height: 120.h,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Community',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.semiBold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Join fellow moms to share advice, support each\nother,andnavigate parenting together',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeightHelper.medium,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .085,
                  ),
                  const ForwardArrowButton(
                    iconColor: Color(0xff8794C3),
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
