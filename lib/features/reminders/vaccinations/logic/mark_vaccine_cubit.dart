import 'package:care_nest/features/reminders/vaccinations/data/repo/mark_vaccine_repo.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/get_baby_vaccines_cubit.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/mark_vaccine_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class MarkVaccineCubit extends Cubit<MarkVaccineState> {
  final MarkVaccineRepo _markVaccineRepo;

  MarkVaccineCubit(this._markVaccineRepo)
      : super(const MarkVaccineState.initial());

  void markVaccine(
      String babyId, String vaccineId, BuildContext context) async {
    emit(const MarkVaccineState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _markVaccineRepo.markVaccine(
      token,
      babyId,
      vaccineId,
    );

    response.when(
      success: (markVaccineResponse) {
        emit(MarkVaccineState.success(markVaccineResponse.vaccineData));
        context.read<GetBabyVaccinesCubit>().getBabyVaccines(babyId);
      },
      failure: (error) {
        emit(MarkVaccineState.error(
            error: error.signUpErrorModel.errors!.first.msg ??
                'An error occurred while marking vaccine.'));
      },
    );
  }
}
