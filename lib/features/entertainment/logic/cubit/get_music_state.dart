import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/get_music_response.dart';
part 'get_music_state.freezed.dart';
@freezed
class GetMusicState with _$GetMusicState {
  const factory GetMusicState.initial() = _Initial;
  const factory GetMusicState.loading() = Loading;
  const factory GetMusicState.success(List<MusicData> musicData) = Success;
  const factory GetMusicState.error(ApiErrorModel apiErrorModel) = Error;
}
