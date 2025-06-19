import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsToggleButton extends StatefulWidget {
  final ValueChanged<int> onToggle;
  const DoctorsToggleButton({super.key, required this.onToggle});

  @override
  State<DoctorsToggleButton> createState() => _DoctorsToggleButtonState();
}

class _DoctorsToggleButtonState extends State<DoctorsToggleButton> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 328.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: const Color(0xffeeeeee),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            _buildSegment("List View", 0),
            _buildSegment("Map View", 1),
          ],
        ),
      ),
    );
  }

  Widget _buildSegment(String text, int index) {
    bool isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
          widget.onToggle(selectedIndex);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected
                ? ColorsManager.secondryBlueColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              color:
                  isSelected ? Colors.white : ColorsManager.secondryBlueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
