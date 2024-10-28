import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/features/home/ui/widgets/forward_arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MamaTipsCard extends StatelessWidget {
  const MamaTipsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xffFFBB5D),
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffFFBB5D).withOpacity(0.5),
            offset: const Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.14,
      width: MediaQuery.of(context).size.width * 0.5 - 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mama Tips',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.semiBold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12.h), 
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Parenting Tips,\nJust for You',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeightHelper.medium,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          const ForwardArrowButton(
            iconColor: Color(0xffFFBB5D),
          ),
        ],
      ),
    );
  }
}
