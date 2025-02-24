import 'dart:developer';
import 'package:care_nest/features/entertainment/fun_videos/data/repo/get_all_channels_repo.dart';
import 'package:care_nest/features/entertainment/fun_videos/logic/get_all_channels_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class GetAllChannelsCubit extends Cubit<GetAllChannelsState> {
  GetAllChannelsCubit(this._getAllChannelsRepo)
      : super(const GetAllChannelsState.initial());

  final GetAllChannelsRepo _getAllChannelsRepo;

  Future<void> getAllChannels() async {
    emit(const GetAllChannelsState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    final response = await _getAllChannelsRepo.getAllChannels(token);
    if (isClosed) return;

    response.when(
      success: (channels) {
        log('Channels data ${channels.data}');
        emit(GetAllChannelsState.success(channels.data ?? []));
      },
      failure: (apiErrorModel) {
        emit(GetAllChannelsState.error(apiErrorModel));
      },
    );
  }
}
