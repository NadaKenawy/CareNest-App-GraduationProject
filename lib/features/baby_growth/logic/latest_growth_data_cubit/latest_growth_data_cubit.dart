import 'dart:developer';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/baby_growth/data/repos/latest_growth_data_repo.dart';
import 'package:care_nest/features/baby_growth/logic/latest_growth_data_cubit/latest_growth_data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestGrowthDataCubit extends Cubit<LatestGrowthDataState> {
  LatestGrowthDataCubit(this._latestGrowthDataRepo)
      : super(const LatestGrowthDataState.initial());

  final LatestGrowthDataRepo _latestGrowthDataRepo;

  void latestGrowthData(String id) async {
    emit(const LatestGrowthDataState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _latestGrowthDataRepo.getLatestGrowthData(token, id);
    if (isClosed) return;

    response.when(
      success: (latestGrowthDataResponse) {
        log('Decoded Data: ${latestGrowthDataResponse.data}');
        emit(
          LatestGrowthDataState.success(latestGrowthDataResponse.data!),
        );
      },
      failure: (apiErrorModel) {
        log('API Failure: ${apiErrorModel.message}');
        emit(LatestGrowthDataState.error(apiErrorModel));
      },
    );
  }
}
