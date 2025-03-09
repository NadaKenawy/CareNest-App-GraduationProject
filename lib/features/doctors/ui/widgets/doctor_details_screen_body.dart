import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctor_details_header.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctor_details_select_schedule.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctor_details_working_hours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors_manager.dart';
import 'doctor_details_about.dart';
import 'doctor_details_contact.dart';

class DoctorDetailsScreenBody extends StatelessWidget {
  const DoctorDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doctor Details',
          style: TextStyles.font20BlackSemiBold,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const DoctorDetailsHeader(),
                SizedBox(
                  height: 20.h,
                ),
                const DoctorDetailsAbout(),
                SizedBox(
                  height: 20.h,
                ),
                const DoctorDetailsContact(),
                SizedBox(
                  height: 20.h,
                ),
                const DoctorDetailsSelectSchedule(),
                SizedBox(
                  height: 20.h,
                ),
                const DoctorDetailsWorkingHours(),
                SizedBox(
                  height: 24.h,
                ),
                AppTextButton(
                  buttonText: 'Book An Appointment',
                  textStyle: TextStyles.font16WhiteBold,
                  buttonColor: ColorsManager.secondryBlueColor,
                  onPressed: () {},
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
