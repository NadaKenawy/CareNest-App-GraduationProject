// appointment_card.dart
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/doctors/data/models/get_doctors/get_doctors_response.dart';
import 'package:care_nest/features/doctors/logic/cancel_booked_appointment_cubit/cancel_booked_appointment_cubit.dart';
import 'package:care_nest/features/doctors/logic/get_booked_appointments_cubit/get_booked_appointments_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentCard extends StatelessWidget {
  final String appointmentId;
  final String doctorName;
  final String specialization;
  final String dateTime;
  final DoctorData doctorData;

  const AppointmentCard({
    super.key,
    required this.appointmentId,
    required this.doctorName,
    required this.specialization,
    required this.dateTime,
    required this.doctorData,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = doctorData.image ?? '';

    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(25),
            blurRadius: 6.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: (imageUrl.startsWith('http://') ||
                    imageUrl.startsWith('https://'))
                ? Image.network(
                    imageUrl,
                    width: 80.w,
                    height: 80.h,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Image.asset(
                      'assets/images/download.jpg',
                      width: 80.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.asset(
                    'assets/images/download.jpg',
                    width: 80.w,
                    height: 80.h,
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: '$doctorName\n',
                          style: TextStyles.font20BlackSemiBold
                              .copyWith(fontWeight: FontWeightHelper.medium),
                          children: [
                            TextSpan(
                              text: specialization,
                              style: TextStyles.font16BlackMedium
                                  .copyWith(height: 1.5),
                            ),
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Icon(Icons.close, size: 24.sp),
                      color: ColorsManager.secondryBlueColor,
                      splashRadius: 20.r,
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.question,
                          animType: AnimType.scale,
                          title: 'Cancel Appointment',
                          desc:
                              'Are you sure you want to cancel this appointment?',
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
                Text(
                  dateTime,
                  style:
                      TextStyles.font12BlackMedium.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
