import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/get_doctors/get_doctors_response.dart';
import 'working_hours_list_item.dart';

class WorkingHoursListView extends StatelessWidget {
  const WorkingHoursListView({
    super.key,
    required this.daySchedule,
    required this.selectedDay,
    this.selectedHour,
    required this.onHourSelected,
  });

  final List<DaySchedule> daySchedule;
  final DaySchedule selectedDay;
  final String? selectedHour;
  final Function(String) onHourSelected;

  @override
  Widget build(BuildContext context) {
    final slots = daySchedule
        .where((day) => day.type == selectedDay.type)
        .expand((day) => day.slots ?? [])
        .toList();

    if (slots.isEmpty) return const Text("No available slots");

    return SizedBox(
      height: 48.h,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: slots.expand((slot) {
          final availableHours =
              getAvailableHours(slot.startTime!, slot.endTime!);
          return availableHours.map((hour) => Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: GestureDetector(
                  onTap: () => onHourSelected(hour),
                  child: WorkingHoursListItem(
                    hourSchedule: Slot(startTime: hour),
                     isSelected: selectedHour == hour,
                  ),
                ),
              ),);
        }).toList(),
      ),
    );
  }

  List<String> getAvailableHours(String startTime, String endTime) {
    DateTime start = parseTime(startTime);
    DateTime end = parseTime(endTime).subtract(const Duration(hours: 1));

    int totalHours = end.hour - start.hour;
    return List.generate(totalHours + 1, (index) {
      return "${start.hour + index}:00";
    });
  }

  DateTime parseTime(String time) {
    List<String> parts = time.split(":");
    return DateTime(0, 1, 1, int.parse(parts[0]), int.parse(parts[1]));
  }
}
