import 'dart:developer';

import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/baby_growth/data/repos/get_baby_weight_growth_repo.dart';
import 'package:care_nest/features/baby_growth/logic/get_baby_weight_growth_cubit/get_baby_weight_growth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetBabyWeightGrowthCubit extends Cubit<GetBabyWeightGrowthState> {
  GetBabyWeightGrowthCubit(this._getBabyWeightGrowthRepo)
      : super(const GetBabyWeightGrowthState.initial());
  final GetBabyWeightGrowthRepo _getBabyWeightGrowthRepo;

  void getBabyWeightGrowth(String babyid) async {
    emit(const GetBabyWeightGrowthState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response =
        await _getBabyWeightGrowthRepo.getBabyWeightGrowth(token, babyid);
    if (isClosed) return;

    response.when(
      success: (getBabyGrowthResponse) {
        log('Decoded Data: ${getBabyGrowthResponse.data}');
        emit(
          GetBabyWeightGrowthState.success(
              getBabyGrowthResponse.data!.weight ?? []),
        );
      },
      failure: (apiErrorModel) {
        log('API Failure: ${apiErrorModel.message}');
        emit(GetBabyWeightGrowthState.error(apiErrorModel));
      },
    );
  }
}
