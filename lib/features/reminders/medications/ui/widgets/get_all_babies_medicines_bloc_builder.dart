import 'package:care_nest/features/reminders/medications/data/models/get_all_babies_medication_schedule/get_all_babies_medication_schedule_response.dart';
import 'package:care_nest/features/reminders/medications/logic/get_all_babies_medication_schedule_cubit/get_all_babies_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/logic/get_all_babies_medication_schedule_cubit/get_all_babies_medication_schedule_state.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/medicines_list_view.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/no_medicines_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'medicines_list_view_skeletonizer.dart';

// GetAllBabiesMedicinesBlocBuilder
class GetAllBabiesMedicinesBlocBuilder extends StatelessWidget {
  const GetAllBabiesMedicinesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllBabiesMedicationScheduleCubit,
        GetAllBabiesMedicationScheduleState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return setupLoading();
          },
          success: (babiesMedicationData) {
            var babiesMedicinesList =
                List<BabiesMedicationData>.from(babiesMedicationData!);
            return setupSuccess(babiesMedicinesList);
          },
          error: (error) {
            if (error.message == "No medication schedule found" ||
                error.message == "Invalid id format") {
              return const NoMedicinesText();
            }
            return setupError();
          },
          orElse: () => const NoMedicinesText(),
        );
      },
    );
  }

  Widget setupLoading() {
    return const MedicinesListViewSkeletonizer();
  }

  Widget setupSuccess(List<BabiesMedicationData> babiesMedicinesList) {
    return MedicinesListView(
      medicinesList: babiesMedicinesList,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
