import 'dart:developer';

import 'package:care_nest/features/reminders/vaccinations/data/repo/get_baby_vaccines_repo.dart';
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

    final cachedResponse = _getBabyVaccinesRepo.getCachedBabyVaccines(babyId);
    if (cachedResponse != null) {
      log('✅ Returning cached data for babyId: $babyId');
      emit(GetBabyVaccinesState.success(cachedResponse.vaccineData));
      return;
    }

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _getBabyVaccinesRepo.getBabyVaccines(token, babyId);
    if (isClosed) return;
    response.when(
      success: (getBabyVaccinesResponse) {
        log('📥 Data fetched from API');
        _getBabyVaccinesRepo.cacheBabyVaccines(babyId, getBabyVaccinesResponse);
        emit(GetBabyVaccinesState.success(getBabyVaccinesResponse.vaccineData));
      },
      failure: (error) {
        emit(GetBabyVaccinesState.error(
            error: error.signUpErrorModel.errors!.first.msg ?? ''));
      },
    );
  }

  void getCachedBabyVaccines(String babyId) {
    log('🔍 Trying to fetch cached data for babyId: $babyId');
    final cachedResponse = _getBabyVaccinesRepo.getCachedBabyVaccines(babyId);
    if (cachedResponse != null) {
      log('✅ Cached Vaccines List Found: ${cachedResponse.vaccineData!.length}');
      emit(GetBabyVaccinesState.success(cachedResponse.vaccineData));
    } else {
      log('❌ No cached data found');
      emit(const GetBabyVaccinesState.error(error: "No cached data found"));
    }
  }
}
