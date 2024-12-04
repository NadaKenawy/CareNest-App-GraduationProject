// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/reminders/medications/logic/add_medication_schedule_cubit/add_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/add_medicine_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import 'medicine_form_fields.dart';
import 'medicine_header.dart';

class AddMedicineScreenBody extends StatefulWidget {
  const AddMedicineScreenBody({
    super.key,
  });

  @override
  State<AddMedicineScreenBody> createState() => _AddMedicineScreenBodyState();
}

class _AddMedicineScreenBodyState extends State<AddMedicineScreenBody> {
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _startDayController = TextEditingController();
  final TextEditingController _finishDayController = TextEditingController();
  final _formKey = GlobalKey<FormState>();  // Global key for the form validation

  @override
  void dispose() {
    _timeController.dispose();
    _startDayController.dispose();
    _finishDayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: _formKey,  
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 68.h),
                        const MedicineHeader(),
                        SizedBox(height: 52.h),
                        MedicineFormFields(
                          controller: context
                              .read<AddMedicationScheduleCubit>()
                              .medicationNameController,
                          timeController: context
                              .read<AddMedicationScheduleCubit>()
                              .timeController,
                          startDayController: context
                              .read<AddMedicationScheduleCubit>()
                              .beginController,
                          finishDayController: context
                              .read<AddMedicationScheduleCubit>()
                              .endController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32.h),
                child: AppTextButton(
                  buttonText: 'Make Reminder',
                  onPressed: () async {
                    // Validate the form fields
                    if (_formKey.currentState?.validate() ?? false) {
                      final babyId = await SharedPrefHelper.getSecuredString(
                          SharedPrefKeys.babyId);
                      log("Retrieved baby id: $babyId");

                      context
                          .read<AddMedicationScheduleCubit>()
                          .addMedicationSchedule(babyId);
                    } else {
                      log("Form is not valid");
                    }
                  },
                  textStyle: TextStyles.font16WhiteBold,
                ),
              ),
              const AddMedicineBlocListner(),
            ],
          ),
        ),
      ),
    );
  }
}
