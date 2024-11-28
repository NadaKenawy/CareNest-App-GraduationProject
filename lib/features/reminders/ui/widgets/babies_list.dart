import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MiniBabyContainer extends StatelessWidget {
  final String gender;
  final String name;
  final String babyId;

  const MiniBabyContainer({
    super.key,
    required this.gender,
    required this.name,
    required this.babyId,
  });

  @override
  Widget build(BuildContext context) {
    final Color containerColor = gender == 'Male'
        ? Colors.blueAccent // استخدم لون مناسب للجنس
        : Colors.pinkAccent;
    final String babyImage =
        gender == 'Male' ? 'assets/images/boy_baby.png' : 'assets/images/girl_baby.png';

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h), // مسافة بين العناصر
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        border: Border.all(color: containerColor),
        boxShadow: [
          BoxShadow(
            color: containerColor.withOpacity(0.4),
            blurRadius: 6.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r, // حجم الصورة أصغر
            backgroundImage: AssetImage(babyImage),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
