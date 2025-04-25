import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/doctors/data/models/get_doctors/get_doctors_response.dart';
import 'package:care_nest/features/doctors/logic/get_all_doctors_cubit/get_all_doctors_cubit.dart';
import 'package:care_nest/features/doctors/logic/get_all_doctors_cubit/get_all_doctors_state.dart';
import 'package:care_nest/features/doctors/logic/get_booked_appointments_cubit/get_booked_appointments_cubit.dart';
import 'package:care_nest/features/doctors/logic/get_booked_appointments_cubit/get_booked_appointments_state.dart';
import 'package:care_nest/features/doctors/ui/widgets/appointment_card.dart';
import 'package:care_nest/features/doctors/ui/widgets/my_appoinment_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentScreenBody extends StatefulWidget {
  const MyAppointmentScreenBody({super.key});

  @override
  State<MyAppointmentScreenBody> createState() =>
      _MyAppointmentScreenBodyState();
}

class _MyAppointmentScreenBodyState extends State<MyAppointmentScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllDoctorsCubit>().getAllDoctors();
    context.read<GetBookedAppointmentsCubit>().getBookedAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Appointment',
          style: TextStyles.font20BlackSemiMedium,
        ),
      ),
      body: BlocBuilder<GetAllDoctorsCubit, GetAllDoctorsState>(
        builder: (context, doctorsState) {
          return doctorsState.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: AppointmentCardSkeleton()),
            error: (error) =>
                const Center(child: Text("Error loading doctors")),
            success: (doctorsList) {
              return BlocBuilder<GetBookedAppointmentsCubit,
                  GetBookedAppointmentsState>(
                builder: (context, appointmentsState) {
                  return appointmentsState.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () =>
                        const Center(child: AppointmentCardSkeleton()),
                    error: (error) =>
                        const Center(child: Text("Error loading appointments")),
                    success: (appointments) {
                      if (appointments == null || appointments.isEmpty) {
                        return Center(
                            child: Text('No appointments found',
                                style: TextStyles.font20BlackSemiBold.copyWith(
                                    fontWeight: FontWeightHelper.medium)));
                      }
                      final visibleAppointments = appointments
                          .where((a) => a.status != "Canceled")
                          .toList();
                      if (visibleAppointments.isEmpty) {
                        return Center(
                            child: Text('No appointments found',
                                style: TextStyles.font20BlackSemiBold.copyWith(
                                    fontWeight: FontWeightHelper.medium)));
                      }
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        child: ListView.separated(
                          itemCount: visibleAppointments.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 16.h),
                          itemBuilder: (context, index) {
                            final appointment = visibleAppointments[index];
                            final String doctorId = appointment.doctor!.id;
                            final DoctorData doctor = doctorsList!.firstWhere(
                              (doc) => doc.id == doctorId,
                              orElse: () => DoctorData(
                                id: doctorId,
                                user: null,
                                specialty: 'Specialization',
                                image: 'assets/images/doctors_test_img.png',
                              ),
                            );
                            final String doctorName = doctor.user != null
                                ? 'Dr. ${doctor.user!.firstName} ${doctor.user!.lastName}'
                                : 'Dr. $doctorId';
                            final String specialization =
                                doctor.specialty ?? 'Specialization';
                            final String dayType = appointment.day.type;
                            final String startTime =
                                appointment.day.time.startTime;
                            final String date = appointment.day.date
                                .toIso8601String()
                                .split("T")
                                .first;
                            final String dateTime =
                                '$dayType, $date | $startTime';
                            return AppointmentCard(
                              appointmentId: appointment.id,
                              doctorName: doctorName,
                              specialization: specialization,
                              dateTime: dateTime,
                              doctorData: doctor,
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
