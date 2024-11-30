// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/widgets/custom_text_form_field.dart';

class MedicineFormFields extends StatelessWidget {
  final TextEditingController timeController;
  final TextEditingController startDayController;
  final TextEditingController finishDayController;
  final TextEditingController controller;

  const MedicineFormFields({
    required this.timeController,
    required this.startDayController,
    required this.finishDayController,
    super.key,
    required this.controller,
  });

  Future<void> _pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final hours = pickedTime.hour.toString().padLeft(2, '0');
      final minutes = pickedTime.minute.toString().padLeft(2, '0');
      timeController.text = '$hours:$minutes';
    }
  }

  Future<void> _pickDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      controller.text = "${pickedDate.toLocal()}".split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: controller,
          hintText: "Medicine Name",
          prefixIcon: const Icon(
            Icons.medical_services_outlined,
            color: ColorsManager.secondryBlueColor,
          ),
        ),
        SizedBox(height: 24.h),
        AppTextFormField(
          controller: timeController,
          hintText: "Select Time",
          readOnly: true,
          onTap: () => _pickTime(context),
          prefixIcon: Icon(
            Icons.alarm,
            size: 20.sp,
            color: ColorsManager.secondryBlueColor,
          ),
        ),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextFormField(
              controller: startDayController,
              hintText: "Start Day",
              readOnly: true,
              onTap: () => _pickDate(context, startDayController),
              width: 170.w,
              prefixIcon: Icon(
                Icons.calendar_today,
                size: 20.sp,
                color: ColorsManager.secondryBlueColor,
              ),
            ),
            AppTextFormField(
              controller: finishDayController,
              hintText: "Finish Day",
              readOnly: true,
              onTap: () => _pickDate(context, finishDayController),
              width: 170.w,
              prefixIcon: Icon(
                Icons.calendar_today_outlined,
                size: 20.sp,
                color: ColorsManager.secondryBlueColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
