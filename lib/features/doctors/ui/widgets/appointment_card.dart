// appointment_card.dart
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/doctors/data/models/get_doctors/get_doctors_response.dart';
import 'package:care_nest/features/doctors/logic/cancel_booked_appointment_cubit/cancel_booked_appointment_cubit.dart';
import 'package:care_nest/features/doctors/logic/get_booked_appointments_cubit/get_booked_appointments_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppointmentCard extends StatelessWidget {
  final String appointmentId;
  final String doctorName;
  final String specialization;
  final String dateTime;
  final String doctorImage;
  final DoctorData doctorData;

  const AppointmentCard({
    super.key,
    required this.appointmentId,
    required this.doctorName,
    required this.specialization,
    required this.dateTime,
    required this.doctorImage,
    required this.doctorData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    doctorData.image ?? 'assets/images/doctors_test_img.png',
                    height: 120.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: TextStyles.font20BlackSemiBold,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      specialization,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      dateTime,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextButton(
                buttonText: 'Reschedule',
                textStyle: TextStyles.font16WhiteMedium,
                buttonColor: ColorsManager.secondryBlueColor,
                buttonWidth: 140.w,
                buttonHeight: 44.h,
                onPressed: () {
                  GoRouter.of(context).push(
                    AppRouter.kDoctorDetailsScreen,
                    extra: doctorData,
                  );
                },
              ),
              SizedBox(width: 16.w),
              AppTextButton(
                buttonText: 'Cancel',
                textStyle: TextStyles.font16SecondaryBlueSemiBold,
                borderColor: ColorsManager.secondryBlueColor,
                buttonColor: Colors.white,
                textColor: ColorsManager.secondryBlueColor,
                borderWidth: 2.w,
                buttonWidth: 140.w,
                buttonHeight: 44.h,
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.question,
                    animType: AnimType.scale,
                    title: 'Cancel Appointment',
                    desc: 'Are you sure you want to cancel this appointment?',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                      context
                          .read<CancelBookedAppointmentCubit>()
                          .cancelBookedAppointment(appointmentId)
                          .then((_) {
                        context
                            .read<GetBookedAppointmentsCubit>()
                            .getBookedAppointments();
                      });
                    },
                  ).show();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
