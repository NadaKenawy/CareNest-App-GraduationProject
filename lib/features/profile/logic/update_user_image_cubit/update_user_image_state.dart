import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../data/models/update_user_image_response.dart';
part 'update_user_image_state.freezed.dart';
@freezed
class UpdateUserImageState<T> with _$UpdateUserImageState<T> {
  const factory UpdateUserImageState.initial() = _Initial;
   const factory UpdateUserImageState.loading() = Loading;
  const factory UpdateUserImageState.success(
    UpdateUserImageResponse updateUserImageResponse,
  ) = Success;
  const factory UpdateUserImageState.error(ApiErrorModel apiErrorModel) = Error;
}
