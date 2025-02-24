import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:care_nest/features/entertainment/fun_videos/data/model/get_all_channels_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_channels_state.freezed.dart';

@freezed
class GetAllChannelsState<T> with _$GetAllChannelsState<T> {
  const factory GetAllChannelsState.initial() = _Initial;
  const factory GetAllChannelsState.loading() = Loading;
  const factory GetAllChannelsState.success(List<ChannelData>? channelsData) = Success;
  const factory GetAllChannelsState.error(ApiErrorModel apiErrorModel) = Error;
}
