import 'package:care_nest/features/doctors/data/models/get_doctors/get_doctors_response.dart';
import 'package:care_nest/features/doctors/logic/get_all_doctors_cubit/get_all_doctors_cubit.dart';
import 'package:care_nest/features/doctors/logic/get_all_doctors_cubit/get_all_doctors_state.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'doctors_list_skeletonizer.dart';

class GetAllDoctorsBlocBuilder extends StatelessWidget {
  const GetAllDoctorsBlocBuilder({super.key, required this.selectedSpecialty});
  final String selectedSpecialty;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllDoctorsCubit, GetAllDoctorsState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return setupLoading();
          },
          success: (getAllDoctorsData) {
            var doctorsList = List<DoctorData>.from(getAllDoctorsData!);
            var filteredDoctors = doctorsList
                .where((doctor) => doctor.specialty == selectedSpecialty)
                .toList();

            return setupSuccess(filteredDoctors);
          },
          error: (error) {
            return setupError();
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupLoading() {
    return const DoctorsListSkeletonizer();
  }

  Widget setupSuccess(List<DoctorData> doctorsList) {
    return doctorsList.isNotEmpty
        ? DoctorsListView(doctorsList: doctorsList)
        : const Center(child: Text('No doctors found for this specialty'));
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
