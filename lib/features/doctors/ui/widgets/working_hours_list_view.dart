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
    this.orders,
    required this.bookingDate,
  });

  final List<DaySchedule> daySchedule;
  final DaySchedule selectedDay;
  final String? selectedHour;
  final Function(String) onHourSelected;
  final List<Order>? orders;
  final String bookingDate;

  @override
  Widget build(BuildContext context) {
    final slots = daySchedule
        .where((day) => day.type == selectedDay.type)
        .expand((day) => day.slots ?? [])
        .toList();

    if (slots.isEmpty) return const Text("No available slots");

    List<String> availableHours = [];
    for (var slot in slots) {
      availableHours.addAll(getAvailableHours(slot.startTime!, slot.endTime!));
    }

    return SizedBox(
      height: 48.h,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: availableHours.map((hour) {
          bool isBooked = orders?.any((order) {
                String? orderTime = order.day?.time?.startTime;
                String? orderDayType = order.day?.type;
                return order.status == "Pending" &&
                    orderTime == hour &&
                    orderDayType == selectedDay.type;
              }) ??
              false;

          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: GestureDetector(
              onTap: isBooked ? null : () => onHourSelected(hour),
              child: WorkingHoursListItem(
                hourSchedule: Slot(startTime: hour),
                isSelected: selectedHour == hour,
                isBooked: isBooked,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  List<String> getAvailableHours(String startTime, String endTime) {
    DateTime start = parseTime(startTime);
    DateTime end = parseTime(endTime);
    List<String> hours = [];

    while (start.isBefore(end)) {
      String hourStr = "${start.hour.toString().padLeft(2, '0')}:00";
      hours.add(hourStr);
      start = start.add(const Duration(hours: 1));
    }

    return hours;
  }

  DateTime parseTime(String time) {
    List<String> parts = time.split(":");
    return DateTime(0, 1, 1, int.parse(parts[0]), int.parse(parts[1]));
  }
}
