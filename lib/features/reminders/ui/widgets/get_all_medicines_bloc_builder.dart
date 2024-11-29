import 'package:care_nest/features/reminders/logic/get_all_medication_schedule_cubit/get_all_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/logic/get_all_medication_schedule_cubit/get_all_medication_schedule_state.dart';
import 'package:care_nest/features/reminders/ui/widgets/medicines_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllMedicinesBlocBuilder extends StatelessWidget {
  const GetAllMedicinesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllMedicationScheduleCubit,
        GetAllMedicationScheduleState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () {
              return setupLoading();
            },
            success: (medicinesData) {
              var medicinesList = medicinesData;

              return setupSuccess(medicinesList);
            },
            error: (error) {
              return setupError();
            },
            orElse: () => const SizedBox.shrink());
      },
    );
  }

  Widget setupLoading() {
    //return const BabiesListViewSkeletonizer();
    return const CircularProgressIndicator();
  }

  Widget setupSuccess(medicinesList) {
    return MedicinesListView(
      medicinesList: medicinesList,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
