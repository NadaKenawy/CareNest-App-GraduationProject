import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/features/reminders/ui/widgets/get_all_medicines_bloc_builder.dart';
import 'package:care_nest/features/reminders/ui/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/features/reminders/ui/widgets/week_days_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:sidebarx/sidebarx.dart';

class RemindersScreenBody extends StatefulWidget {
  const RemindersScreenBody({super.key});

  @override
  _RemindersScreenBodyState createState() => _RemindersScreenBodyState();
}

class _RemindersScreenBodyState extends State<RemindersScreenBody> {
  final DateTime _currentDate = DateTime.now();
  final SidebarXController _controller = SidebarXController(selectedIndex: 0);

  @override
  Widget build(BuildContext context) {
    DateTime startDate =
        _currentDate.subtract(Duration(days: _currentDate.weekday % 7));
    DateTime endDate = startDate.add(const Duration(days: 6));
    List<DateTime> weekDays = _generateDates(startDate, endDate);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'My Reminders',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeightHelper.semiBold,
            fontSize: 24.sp,
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu, size: 24.sp, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: ExampleSidebarX(controller: _controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kAddMedicineScreen);
        },
        backgroundColor: Colors.white,
        shape: const CircleBorder(
          side: BorderSide(
            color: ColorsManager.primaryPinkColor,
            width: 3,
          ),
        ),
        child: Icon(
          Icons.add,
          size: 32.sp,
          color: ColorsManager.primaryPinkColor,
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.h),
            WeekDaysWidget(weekDays: weekDays, currentDate: _currentDate),
            SizedBox(height: 32.h),
            Text(
              'Today',
              style: TextStyle(
                fontWeight: FontWeightHelper.semiBold,
                fontSize: 28.sp,
                color: Colors.black,
              ),
            ),
            // const NoMedicinesText(),
            const GetAllMedicinesBlocBuilder(),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  List<DateTime> _generateDates(DateTime start, DateTime end) {
    List<DateTime> dates = [];
    for (int i = 0; i <= end.difference(start).inDays; i++) {
      dates.add(start.add(Duration(days: i)));
    }
    return dates;
  }
}
