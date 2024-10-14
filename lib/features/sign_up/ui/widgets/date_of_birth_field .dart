import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  // List of days, months, and years as before
  List<int> days = List.generate(31, (index) => index + 1);
  List<int> months = List.generate(12, (index) => index + 1);
  List<int> years = List.generate(101, (index) => DateTime.now().year - index);

  void _updateDate() {
    // Call the Cubit function to update the date of birth
    context
        .read<SignupCubit>()
        .updateDateOfBirth(_selectedDay, _selectedMonth, _selectedYear);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: DropdownButtonFormField<int>(
            decoration: const InputDecoration(
              hintText: "MM",
              // Other decoration settings...
            ),
            value: _selectedMonth,
            onChanged: (value) {
              setState(() {
                _selectedMonth = value;
                widget.onMonthSelected(value);
                _updateDate();
              });
            },
            items: months.map((month) {
              return DropdownMenuItem<int>(
                value: month,
                child: Text(month.toString()),
              );
            }).toList(),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DropdownButtonFormField<int>(
            decoration: const InputDecoration(
              hintText: "DD",
              // Other decoration settings...
            ),
            value: _selectedDay,
            onChanged: (value) {
              setState(() {
                _selectedDay = value;
                widget.onDaySelected(value);
                _updateDate();
              });
            },
            items: days.map((day) {
              return DropdownMenuItem<int>(
                value: day,
                child: Text(day.toString()),
              );
            }).toList(),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DropdownButtonFormField<int>(
            decoration: const InputDecoration(
              hintText: "YYYY",
              // Other decoration settings...
            ),
            value: _selectedYear,
            onChanged: (value) {
              setState(() {
                _selectedYear = value;
                widget.onYearSelected(value);
                _updateDate();
              });
            },
            items: years.map((year) {
              return DropdownMenuItem<int>(
                value: year,
                child: Text(year.toString()),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
