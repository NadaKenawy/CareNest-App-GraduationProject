import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidebarx/sidebarx.dart';

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    super.key,
    required this.controller,
    this.items,
  });

  final SidebarXController controller;
  final List<SidebarXItem>? items;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: controller,
      theme: SidebarXTheme(
        margin: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          color: ColorsManager.fourthryBlueColor,
          borderRadius: BorderRadius.circular(20.sp),
        ),
        hoverColor: ColorsManager.fourthryBlueColor.withOpacity(0.8),
        textStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: EdgeInsets.only(left: 30.w),
        selectedItemTextPadding: EdgeInsets.only(left: 30.w),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(color: ColorsManager.fourthryBlueColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(
              color: ColorsManager.fourthryBlueColor.withOpacity(0.5)),
          gradient: const LinearGradient(
            colors: [
              ColorsManager.thirdryBlueColor,
              ColorsManager.secondryBlueColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: SidebarXTheme(
        width: 200.w,
        decoration: const BoxDecoration(
          color: ColorsManager.fourthryBlueColor,
        ),
      ),
      items: items ??
          [
            SidebarXItem(
              icon: Icons.home,
              label: 'Home',
              onTap: () {},
            ),
            SidebarXItem(icon: Icons.search, label: 'Search', onTap: () {}),
            SidebarXItem(icon: Icons.settings, label: 'Settings', onTap: () {}),
          ],
    );
  }
}
