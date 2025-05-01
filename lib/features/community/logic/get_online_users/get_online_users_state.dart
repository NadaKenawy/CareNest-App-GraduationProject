import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../data/models/get_online_users/get_online_users_response.dart';
part 'get_online_users_state.freezed.dart';

@freezed
class GetOnlineUsersState<T> with _$GetOnlineUsersState<T> {
  const factory GetOnlineUsersState.initial() = _Initial;
  const factory GetOnlineUsersState.loading() = Loading;
  const factory GetOnlineUsersState.success(List<User> messages) = Success;
  const factory GetOnlineUsersState.error(ApiErrorModel apiErrorModel) = Error;
}
