import 'package:care_nest/features/reminders/medications/data/models/get_all_medication_schedule/get_all_medication_schedule_response.dart';
import 'package:care_nest/features/reminders/medications/logic/get_all_medication_schedule_cubit/get_all_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/logic/get_all_medication_schedule_cubit/get_all_medication_schedule_state.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/medicines_list_view.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/no_medicines_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// GetAllMedicinesBlocBuilder
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
              var medicinesList = List<MedicationData>.from(medicinesData!);
              return setupSuccess(medicinesList);
            },
            error: (error) {
              if (error.message == "No medication schedule found" ||
                  error.message == "Invalid id format") {
                return const NoMedicinesText();
              }
              return setupError();
            },
            orElse: () => const SizedBox.shrink());
      },
    );
  }

  Widget setupLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget setupSuccess(List<MedicationData> medicinesList) {
    return MedicinesListView(
      medicinesList: medicinesList,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
