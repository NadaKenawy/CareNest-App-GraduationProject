import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/networking/api_error_model.dart';
import '../../data/models/get_white_noise_response.dart';
part 'get_white_noise_state.freezed.dart';

@freezed
class GetWhiteNoiseState with _$GetWhiteNoiseState {
  const factory GetWhiteNoiseState.initial() = _Initial;
  const factory GetWhiteNoiseState.loading() = Loading;
  const factory GetWhiteNoiseState.success(
      List<WhiteNoiseData> whiteNoiseData) = Success;
  const factory GetWhiteNoiseState.error(ApiErrorModel apiErrorModel) = Error;
}
