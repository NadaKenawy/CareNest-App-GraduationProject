import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../data/models/message_model.dart';
import 'package:intl/intl.dart';

class ReceivedMessageBubble extends StatelessWidget {
  final Message message;

  const ReceivedMessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: message.userImage != null &&
                    message.userImage!.startsWith('http')
                ? NetworkImage(message.userImage!)
                : const AssetImage('assets/images/download.jpg')
                    as ImageProvider,
          ),
          SizedBox(width: 8.w),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    message.message,
                    style:
                        TextStyles.font12BlackMedium.copyWith(fontSize: 14.sp),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  DateFormat('hh:mm a').format(message.timestamp),
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                      fontFamily: 'Fredoka',
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SentMessageBubble extends StatelessWidget {
  final Message message;
  const SentMessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryPinkColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                      bottomLeft: Radius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    message.message,
                    style:
                        TextStyles.font16WhiteMedium.copyWith(fontSize: 14.sp),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  DateFormat('hh:mm a').format(message.timestamp),
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                      fontFamily: 'Fredoka',
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
