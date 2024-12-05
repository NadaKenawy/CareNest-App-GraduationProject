import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsListViewItemSkeletonizer extends StatelessWidget {
  const NotificationsListViewItemSkeletonizer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 24.sp,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Container(
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 4.w,
              ),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            shortenText("Medication Reminder for Ali",
                                maxCharacters: 30),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            "10:00 AM",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        shortenText(
                            "It's time for medicine 2, hope your baby gets well.",
                            maxCharacters: 50),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String shortenText(String text, {int? maxCharacters, int? maxWords}) {
  if (maxCharacters != null && text.length > maxCharacters) {
    return '${text.substring(0, maxCharacters)}...';
  }

  if (maxWords != null && text.split(' ').length > maxWords) {
    return '${text.split(' ').take(maxWords).join(' ')}...';
  }

  return text;
}
