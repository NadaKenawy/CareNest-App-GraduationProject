import 'dart:developer';
import 'package:care_nest/features/tips/data/repo/get_all_tips_of_baby_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import 'get_all_tips_of_baby_state.dart';

class GetAllTipsOfBabyCubit extends Cubit<GetAllTipsOfBabyState> {
  GetAllTipsOfBabyCubit(this._getAllTipsOfBabyRepo)
      : super(const GetAllTipsOfBabyState.initial());

  final GetAllTipsOfBabyRepo _getAllTipsOfBabyRepo;

  Future<void> getAllTipsOfBaby() async {
    emit(const GetAllTipsOfBabyState.loading());

    String token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    final response = await _getAllTipsOfBabyRepo.getAllTipsOfBaby(token);
    if (isClosed) return;

    response.when(
      success: (tipsOfBaby) {
        log('Tips data ${tipsOfBaby.data}');
        emit(
          GetAllTipsOfBabyState.success(tipsOfBaby.data ?? []),
        );
      },
      failure: (apiErrorModel) {
        emit(GetAllTipsOfBabyState.error(apiErrorModel));
      },
    );
  }
}
