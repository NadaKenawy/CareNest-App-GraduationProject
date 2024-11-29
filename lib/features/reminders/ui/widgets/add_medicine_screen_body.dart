import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/reminders/logic/add_medication_schedule_cubit/add_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/ui/widgets/add_medicine_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                onPressed: () {
                  context
                      .read<AddMedicationScheduleCubit>()
                      .addMedicationSchedule("6749aea82a6810896bc57833");
                },
                textStyle: TextStyles.font16WhiteBold,
              ),
            ),
            const AddMedicineBlocListner(),
          ],
        ),
      ),
    );
  }
}
