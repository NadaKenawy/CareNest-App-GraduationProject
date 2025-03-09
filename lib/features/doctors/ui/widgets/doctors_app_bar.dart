import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_router.dart';

class DoctorsAppBar extends StatefulWidget {
  final Function(String) onOptionSelected;

  const DoctorsAppBar({super.key, required this.onOptionSelected});

  @override
  State<DoctorsAppBar> createState() => _DoctorsAppBarState();
}

class _DoctorsAppBarState extends State<DoctorsAppBar> {
  String selectedOption = 'Pediatricians';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: () => _showPopupMenu(context),
          child: Row(
            children: [
              Text(
                selectedOption,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 4.w),
              Icon(Icons.arrow_drop_down, size: 24.sp),
            ],
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kMyAppointmentsScreen);
          },
          icon: Icon(Icons.calendar_month, size: 24.sp),
        ),
      ],
    );
  }

  void _showPopupMenu(BuildContext context) async {
    final result = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(60.w, 80.h, 50.w, 0),
      items: [
        _buildMenuItem('Pediatricians'),
        _buildMenuItem('Gynecologists'),
        _buildMenuItem('Hospitals & Pharmacies'),
      ],
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    );

    if (result != null) {
      setState(() {
        selectedOption = result;
      });

      widget.onOptionSelected(result);
    }
  }

  PopupMenuItem<String> _buildMenuItem(String value) {
    return PopupMenuItem(
      value: value,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Text(
          value,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
