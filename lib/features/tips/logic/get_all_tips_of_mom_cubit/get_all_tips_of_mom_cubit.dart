

import 'dart:developer';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/tips/data/repo/get_all_tips_of_mom_repo.dart';
import 'package:care_nest/features/tips/logic/get_all_tips_of_mom_cubit/get_all_tips_of_mom_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllTipsOfMomCubit extends Cubit<GetAllTipsOfMomState> {
  GetAllTipsOfMomCubit(this._getAllTipsOfMomRepo)
      : super(const GetAllTipsOfMomState.initial());

  final GetAllTipsOfMomRepo _getAllTipsOfMomRepo;

  Future<void> getAllTipsOfMom() async {
    emit(const GetAllTipsOfMomState.loading());

    String token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    final response = await _getAllTipsOfMomRepo.getAllTipsOfMom(token);
    if (isClosed) return;

    response.when(
      success: (tipsOfMom) {
        log('Tips data ${tipsOfMom.data}');
        emit(
          GetAllTipsOfMomState.success(tipsOfMom.data ?? []),
        );
      },
      failure: (apiErrorModel) {
        emit(GetAllTipsOfMomState.error(apiErrorModel));
      },
    );
  }
}
