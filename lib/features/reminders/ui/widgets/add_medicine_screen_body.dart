import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'medicine_form_fields.dart';
import 'medicine_header.dart';

class AddMedicineScreenBody extends StatefulWidget {
  const AddMedicineScreenBody({super.key});

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
                        timeController: _timeController,
                        startDayController: _startDayController,
                        finishDayController: _finishDayController,
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
                onPressed: () {},
                textStyle: TextStyles.font16WhiteBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
