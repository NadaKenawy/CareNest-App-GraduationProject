import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/colors_manager.dart';

class DateOfBirthField extends StatefulWidget {
  final TextEditingController? controller;

  const DateOfBirthField({super.key, this.controller});

  @override
  DateOfBirthFieldState createState() => DateOfBirthFieldState();
}

class DateOfBirthFieldState extends State<DateOfBirthField> {
  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    dateController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      dateController.dispose();
    }
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: ColorsManager.primaryBlueColor,
            hintColor: ColorsManager.primaryBlueColor,
            colorScheme: const ColorScheme.light(
              primary: ColorsManager.primaryBlueColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: TextStyle(
            fontSize: 14.sp,
            color: ColorsManager.primaryBlueColor,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Date of birth is required';
            }
            return null;
          },
          controller: dateController,
          readOnly: true,
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            hintText: "YYYY-MM-DD",
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: ColorsManager.secondryBlueColor,
                width: 2.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: ColorsManager.secondryBlueColor,
                width: 2.w,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
          ),
        ),
      ],
    );
  }
}
