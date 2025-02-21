import 'dart:developer';
import 'package:care_nest/features/tips/data/repo/get_tip_details_repo.dart';
import 'package:care_nest/features/tips/logic/get_tip_details_cubit/get_tip_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class GetTipDetailsCubit extends Cubit<GetTipDetailsState> {
  GetTipDetailsCubit(this._getTipDetailsRepo)
      : super(const GetTipDetailsState.initial());

  final GetTipDetailsRepo _getTipDetailsRepo;

  Future<void> getTipDetails(String tipId) async {
    emit(const GetTipDetailsState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    final response = await _getTipDetailsRepo.getTipDetails(token, tipId);
    if (isClosed) return;

    response.when(
      success: (tipDetailsResponse) {
        log('Tip Details Data: ${tipDetailsResponse.data}');
        emit(GetTipDetailsState.success(tipDetailsResponse.data));
      },
      failure: (apiErrorModel) {
        emit(GetTipDetailsState.error(apiErrorModel));
      },
    );
  }
}
