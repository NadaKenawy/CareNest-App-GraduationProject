import 'package:care_nest/features/reminders/medications/ui/widgets/no_medicines_text.dart';
import 'package:care_nest/features/reminders/vaccinations/data/models/get_baby_vaccines_response.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/get_baby_vaccines_cubit.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/get_baby_vaccines_state.dart';
import 'package:care_nest/features/reminders/vaccinations/ui/widgets/vaccination_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetBabyVaccinesBlocBuilder extends StatelessWidget {
  const GetBabyVaccinesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBabyVaccinesCubit, GetBabyVaccinesState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return setupLoading();
          },
          success: (vaccineData) {
            var vaccinesList = List<BabyVaccineData>.from(vaccineData!);
            return setupSuccess(vaccinesList);
          },
          error: (error) {
            if (error == "No vaccination data found" ||
                error == "Invalid id format") {}
            return setupError(error);
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget setupSuccess(List<BabyVaccineData> vaccinesList) {
    return VaccinationList(
      vaccinesList: vaccinesList,
    );
  }

  Widget setupError(String error) {
    return const SizedBox.shrink();
  }
}
