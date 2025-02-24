import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChannelsList extends StatelessWidget {
  final List channels;
  final int selectedIndex;
  final ValueChanged<int> onChannelSelected;

  const ChannelsList({
    super.key,
    required this.channels,
    required this.selectedIndex,
    required this.onChannelSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: channels.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          final channel = channels[index];
          return GestureDetector(
            onTap: () => onChannelSelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.only(right: 12.w),
              width: isSelected ? 85.w : 70.w,
              height: isSelected ? 85.h : 70.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? ColorsManager.secondryBlueColor
                      : Colors.white,
                  width: 4.w,
                ),
                image: DecorationImage(
                  image: NetworkImage(channel.logo ?? 'assets/images/Cocomelon.webp'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
