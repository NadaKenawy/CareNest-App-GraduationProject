import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';
part 'update_user_state.freezed.dart';
@freezed
class UpdateUserState<T> with _$UpdateUserState<T> {
  const factory UpdateUserState.initial() = _Initial;
   const factory UpdateUserState.loading() = Loading;
  const factory UpdateUserState.success(T data) = Success;
  const factory UpdateUserState.error(ApiErrorModel apiErrorModel) = Error;
}
