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
    final allHours = availableHours;
    return SizedBox(
      height: 48.h,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: allHours.map((hour) {
          bool isBooked = orders?.any((order) {
                String orderDate =
                    order.day?.date?.toIso8601String().split("T").first ?? "";
                return order.day?.type == selectedDay.type &&
                    order.day?.time?.startTime == hour &&
                    orderDate == bookingDate;
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
