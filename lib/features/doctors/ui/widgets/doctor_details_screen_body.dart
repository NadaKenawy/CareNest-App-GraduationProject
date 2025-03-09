import 'package:care_nest/features/doctors/ui/widgets/book_an_appointment_button.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctor_details_app_bar.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctor_details_header.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctor_details_select_schedule.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctor_details_working_hours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'doctor_details_about.dart';
import 'doctor_details_contact.dart';

class DoctorDetailsScreenBody extends StatelessWidget {
  const DoctorDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const DoctorDetailsAppBar(),
                SizedBox(
                  height: 8.h,
                ),
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
                  height: 28.h,
                ),
                const BookAnAppointmentButton(),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
