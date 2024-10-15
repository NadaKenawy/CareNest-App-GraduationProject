// ignore_for_file: file_names

import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateOfBirthDropdowns extends StatefulWidget {
  final Function(int?) onDaySelected;
  final Function(int?) onMonthSelected;
  final Function(int?) onYearSelected;
  final String? errorMessage; // Add this to receive error message

  const DateOfBirthDropdowns({
    super.key,
    required this.onDaySelected,
    required this.onMonthSelected,
    required this.onYearSelected,
    this.errorMessage,
  });

  @override
  State<DateOfBirthDropdowns> createState() => _DateOfBirthDropdownsState();
}

class _DateOfBirthDropdownsState extends State<DateOfBirthDropdowns> {
  int? _selectedDay;
  int? _selectedMonth;
  int? _selectedYear;

  List<int> days = List.generate(31, (index) => index + 1);
  List<int> months = List.generate(12, (index) => index + 1);
  List<int> years = List.generate(101, (index) => DateTime.now().year - index);

  void _updateDate() {
    context.read<SignupCubit>().updateDateOfBirth(
          _selectedDay,
          _selectedMonth,
          _selectedYear,
        );
  }

  @override
  Widget build(BuildContext context) {
    // Define error color
    Color errorColor = widget.errorMessage != null
        ? Colors.red
        : ColorsManager.primaryBlueColor;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Month Dropdown
            Expanded(
              child: DropdownButtonFormField<int>(
                decoration: InputDecoration(
                  hintText: "MM",
                  hintStyle: TextStyle(
                    color: errorColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: errorColor, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: errorColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: errorColor,
                      width: 2,
                    ),
                  ),
                ),
                value: _selectedMonth,
                onChanged: (value) {
                  setState(() {
                    _selectedMonth = value;
                    widget.onMonthSelected(value);
                    _updateDate();
                  });
                },
                style: TextStyle(
                  color: errorColor,
                ),
                dropdownColor: Colors.white,
                iconEnabledColor: errorColor,
                items: months.map((month) {
                  return DropdownMenuItem<int>(
                    value: month,
                    child: Text(month.toString()),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(width: 16),
            // Day Dropdown
            Expanded(
              child: DropdownButtonFormField<int>(
                decoration: InputDecoration(
                  hintText: "DD",
                  hintStyle: TextStyle(
                    color: errorColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: errorColor, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: errorColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: errorColor, width: 2),
                  ),
                ),
                value: _selectedDay,
                onChanged: (value) {
                  setState(() {
                    _selectedDay = value;
                    widget.onDaySelected(value);
                    _updateDate();
                  });
                },
                style: TextStyle(
                  color: errorColor,
                ),
                dropdownColor: Colors.white,
                iconEnabledColor: errorColor,
                items: days.map((day) {
                  return DropdownMenuItem<int>(
                    value: day,
                    child: Text(day.toString()),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(width: 16),
            // Year Dropdown
            Expanded(
              child: DropdownButtonFormField<int>(
                decoration: InputDecoration(
                  hintText: "YYYY",
                  hintStyle: TextStyle(
                    color: errorColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: errorColor, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: errorColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: errorColor, width: 2),
                  ),
                ),
                value: _selectedYear,
                onChanged: (value) {
                  setState(() {
                    _selectedYear = value;
                    widget.onYearSelected(value);
                    _updateDate();
                  });
                },
                style: TextStyle(
                  color: errorColor,
                ),
                dropdownColor: Colors.white,
                iconEnabledColor: errorColor,
                items: years.map((year) {
                  return DropdownMenuItem<int>(
                    value: year,
                    child: Text(year.toString()),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        if (widget.errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.errorMessage!,
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}
