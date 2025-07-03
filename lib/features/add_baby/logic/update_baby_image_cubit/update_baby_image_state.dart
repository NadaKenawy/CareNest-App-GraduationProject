import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/update_baby_image/update_baby_image_response.dart';
part 'update_baby_image_state.freezed.dart';

@freezed
class UpdateBabyImageState<T> with _$UpdateBabyImageState<T> {
  const factory UpdateBabyImageState.initial() = _Initial;
  const factory UpdateBabyImageState.loading() = Loading;
  const factory UpdateBabyImageState.success(UpdateBabyImageResponse updateBabyImageResponse) = Success;
  const factory UpdateBabyImageState.error(ApiErrorModel apiErrorModel) = Error;
}
