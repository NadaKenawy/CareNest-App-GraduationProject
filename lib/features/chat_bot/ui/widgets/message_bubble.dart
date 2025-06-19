import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isBot;
  const MessageBubble({super.key, required this.text, required this.isBot});

  @override
  Widget build(BuildContext context) {
    const avatar = CircleAvatar(
      backgroundColor: Colors.white,
      radius: 20,
      backgroundImage: AssetImage('assets/images/bot_avatar.png'),
    );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (isBot) ...[
            avatar,
            SizedBox(width: 8.w)
          ] else ...[
            SizedBox(width: 16.w),
          ],
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
              decoration: BoxDecoration(
                color:
                    isBot ? Colors.grey[200] : ColorsManager.primaryPinkColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                  bottomLeft: Radius.circular(isBot ? 0 : 16.r),
                  bottomRight: Radius.circular(isBot ? 16.r : 0),
                ),
              ),
              child: Text(
                text,
                style: isBot
                    ? TextStyles.font16BlackMedium.copyWith(fontSize: 14.sp)
                    : TextStyles.font16WhiteMedium.copyWith(fontSize: 14.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
