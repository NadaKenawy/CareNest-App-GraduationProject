// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/reminders/data/models/get_all_medication_schedule_response.dart';
import 'package:care_nest/features/reminders/logic/update_medication_schedule_cubit/update_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/ui/widgets/update_medicine_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import 'medicine_form_fields.dart';
import 'medicine_header.dart';

class UpdateMedicinesScreenBody extends StatefulWidget {
  const UpdateMedicinesScreenBody({
    super.key,
    required this.medicinesList,
  });
  final MedicationData medicinesList;
  @override
  State<UpdateMedicinesScreenBody> createState() =>
      _AddMedicineScreenBodyState();
}

class _AddMedicineScreenBodyState extends State<UpdateMedicinesScreenBody> {
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _startDayController = TextEditingController();
  final TextEditingController _finishDayController = TextEditingController();

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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 68.h),
                      const MedicineHeader(
                        text: "Update Medicine",
                      ),
                      SizedBox(height: 52.h),
                      MedicineFormFields(
                        medicineName: widget.medicinesList.medicationName,
                        controller: context
                            .read<UpdateMedicationScheduleCubit>()
                            .medicationNameController,
                        selectTime: widget.medicinesList.time,
                        timeController: context
                            .read<UpdateMedicationScheduleCubit>()
                            .timeController,
                        startDay:
                            widget.medicinesList.begin.toString().split(' ')[0],
                        startDayController: context
                            .read<UpdateMedicationScheduleCubit>()
                            .beginController,
                        finishDay:
                            widget.medicinesList.end.toString().split(' ')[0],
                        finishDayController: context
                            .read<UpdateMedicationScheduleCubit>()
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
                buttonText: 'Update Medicine',
                onPressed: () async {
                  final babyId = await SharedPrefHelper.getSecuredString(
                      SharedPrefKeys.babyId);
                  log("Retrieved baby id: $babyId");

                  context
                      .read<UpdateMedicationScheduleCubit>()
                      .emitUpdateMedicationScheduleState(
                          babyId, widget.medicinesList.id ?? '');
                },
                textStyle: TextStyles.font16WhiteBold,
              ),
            ),
            UpdateMedicineBlocListener(
              id: widget.medicinesList.id ?? '',
            ),
            // const AddMedicineBlocListner(),
          ],
        ),
      ),
    );
  }
}
