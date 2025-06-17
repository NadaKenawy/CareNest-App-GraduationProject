import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageInputField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSend;
  const MessageInputField(
      {super.key, required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 16.w, right: 12.w, bottom: 20.h, top: 4.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                cursorColor: ColorsManager.primaryPinkColor,
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Type your question...',
                  border: InputBorder.none,
                  hintStyle: TextStyles.font16BlackMedium.copyWith(
                    color: Colors.grey[500],
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                ),
                minLines: 1,
                maxLines: 3,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: const BoxDecoration(
              color: ColorsManager.primaryPinkColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                final text = controller.text.trim();
                if (text.isNotEmpty) {
                  onSend(text);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
