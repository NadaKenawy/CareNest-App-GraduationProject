import 'package:care_nest/features/entertainment/data/repos/get_music_repo.dart';
import 'package:care_nest/features/entertainment/logic/cubit/get_music_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class GetMusicCubit extends Cubit<GetMusicState> {
  GetMusicCubit(this._getMusicRepo) : super(const GetMusicState.initial());
  final GetMusicRepo _getMusicRepo;

  void getMusic() async {
    emit(const GetMusicState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    final response = await _getMusicRepo.getMusic(token);

    response.when(success: (getMusicResponse) {
      emit(GetMusicState.success(getMusicResponse.data));
    }, failure: (error) {
      emit(GetMusicState.error(error));
    });
  }
}
