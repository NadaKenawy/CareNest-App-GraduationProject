import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctor_details_header.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctor_details_select_schedule.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctor_details_working_hours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../data/models/get_doctors/get_doctors_response.dart';
import 'doctor_details_about.dart';
import 'doctor_details_contact.dart';

class DoctorDetailsScreenBody extends StatefulWidget {
  const DoctorDetailsScreenBody({super.key, required this.doctorData});

  final DoctorData doctorData;

  @override
  State<DoctorDetailsScreenBody> createState() =>
      _DoctorDetailsScreenBodyState();
}

class _DoctorDetailsScreenBodyState extends State<DoctorDetailsScreenBody> {
  late DaySchedule selectedDay;
  String? selectedHour;

  @override
  void initState() {
    super.initState();
    selectedDay = widget.doctorData.day!.first;
  }

  void updateSelectedDay(DaySchedule newDay) {
    setState(() {
      selectedDay = newDay;
      selectedHour = null;
    });
  }

   void updateSelectedHour(String hour) {
    setState(() {
      selectedHour = hour;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        backgroundColor: const Color(0xfff9f9f9),
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
                DoctorDetailsHeader(
                  doctorData: widget.doctorData,
                ),
                SizedBox(
                  height: 20.h,
                ),
                DoctorDetailsAbout(
                  doctorData: widget.doctorData,
                ),
                SizedBox(
                  height: 20.h,
                ),
                DoctorDetailsContact(
                  doctorData: widget.doctorData,
                ),
                SizedBox(
                  height: 20.h,
                ),
                DoctorDetailsSelectSchedule(
                  selectedDay: selectedDay,
                  doctorData: widget.doctorData,
                  onDaySelected: updateSelectedDay,
                ),
                SizedBox(
                  height: 20.h,
                ),
                DoctorDetailsWorkingHours(
                  doctorData: widget.doctorData,
                  selectedDay: selectedDay,
                   selectedHour: selectedHour,
                  onHourSelected: updateSelectedHour,
                ),
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
