// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/theme/colors_manager.dart';

class DateOfBirthDropdowns extends StatefulWidget {
  final Function(int?) onDaySelected;
  final Function(int?) onMonthSelected;
  final Function(int?) onYearSelected;

  const DateOfBirthDropdowns({
    super.key,
    required this.onDaySelected,
    required this.onMonthSelected,
    required this.onYearSelected,
  });

  @override
  State<DateOfBirthDropdowns> createState() => _DateOfBirthDropdownsState();
}

class _DateOfBirthDropdownsState extends State<DateOfBirthDropdowns> {
  int? _selectedDay;
  int? _selectedMonth;
  int? _selectedYear;

  // قائمة الأيام
  List<int> days = List.generate(31, (index) => index + 1);
  // قائمة الأشهر
  List<int> months = List.generate(12, (index) => index + 1);
  // قائمة السنوات (يمكنك تعديل بداية ونهاية السنوات حسب الحاجة)
  List<int> years = List.generate(101, (index) => DateTime.now().year - index);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: DropdownButtonFormField<int>(
            decoration: InputDecoration(
              isDense: true,
              hintText: "MM",
              hintStyle: const TextStyle(
                color: ColorsManager.primaryPinkColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: ColorsManager.primaryBlueColor,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: ColorsManager.primaryBlueColor,
                  width: 2,
                ),
              ),
            ),
            value: _selectedMonth,
            onChanged: (value) {
              setState(() {
                _selectedMonth = value;
                widget.onMonthSelected(value);
              });
            },
            items: months.map(
              (month) {
                return DropdownMenuItem<int>(
                  value: month,
                  child: Text(
                    month.toString(),
                    style: const TextStyle(
                      color: ColorsManager.primaryBlueColor,
                    ),
                  ),
                );
              },
            ).toList(),
            iconEnabledColor: ColorsManager.primaryBlueColor,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DropdownButtonFormField<int>(
            decoration: InputDecoration(
              isDense: true,
              hintText: "DD",
              hintStyle: const TextStyle(
                color: ColorsManager.primaryPinkColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: ColorsManager.primaryBlueColor,
                  width: 2.w,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: ColorsManager.primaryBlueColor,
                  width: 2.w,
                ),
              ),
            ),
            value: _selectedDay,
            onChanged: (value) {
              setState(
                () {
                  _selectedDay = value;
                  widget.onDaySelected(value);
                },
              );
            },
            items: days.map(
              (day) {
                return DropdownMenuItem<int>(
                  value: day,
                  child: Text(
                    day.toString(),
                    style:
                        const TextStyle(color: ColorsManager.primaryBlueColor),
                  ),
                );
              },
            ).toList(),
            iconEnabledColor: ColorsManager.primaryBlueColor,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: SizedBox(
            height: 48.h,
            child: DropdownButtonFormField<int>(
              decoration: InputDecoration(
                isDense: true,
                hintText: "YYYY",
                hintStyle: const TextStyle(
                  color: ColorsManager.primaryPinkColor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: ColorsManager.primaryBlueColor,
                    width: 2.w,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: ColorsManager.primaryBlueColor,
                    width: 2.w,
                  ),
                ),
              ),
              value: _selectedYear,
              onChanged: (value) {
                setState(() {
                  _selectedYear = value;
                  widget.onYearSelected(value);
                });
              },
              items: years.map(
                (year) {
                  return DropdownMenuItem<int>(
                    value: year,
                    child: Text(
                      year.toString(),
                      style: const TextStyle(
                          color: ColorsManager.primaryBlueColor),
                    ),
                  );
                },
              ).toList(),
              iconEnabledColor: ColorsManager.primaryBlueColor,
            ),
          ),
        ),
      ],
    );
  }
}
