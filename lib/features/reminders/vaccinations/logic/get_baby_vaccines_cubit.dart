
import 'package:care_nest/features/reminders/vaccinations/data/repo/get_baby_vaccines_respo.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/get_baby_vaccines_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class GetBabyVaccinesCubit extends Cubit<GetBabyVaccinesState> {
  final GetBabyVaccinesRepo _getBabyVaccinesRepo;

  GetBabyVaccinesCubit(this._getBabyVaccinesRepo)
      : super(const GetBabyVaccinesState.initial());

  void getBabyVaccines(String babyId) async {
    emit(const GetBabyVaccinesState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _getBabyVaccinesRepo.getBabyVaccines(token, babyId);

    response.when(
      success: (getBabyVaccinesResponse) {
        emit(GetBabyVaccinesState.success(getBabyVaccinesResponse.vaccineData));
      },
      failure: (error) {
        emit(GetBabyVaccinesState.error(
            error: error.signUpErrorModel.errors!.first.msg ?? ''));
      },
    );
  }
}
