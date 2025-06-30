import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/user_satisfaction/user_satisfaction_response_model.dart';

part 'user_satisfaction_state.freezed.dart';

@freezed
class UserSatisfactionState with _$UserSatisfactionState {
  const factory UserSatisfactionState.initial() = _Initial;
  const factory UserSatisfactionState.loading() = Loading;
  const factory UserSatisfactionState.success(
      UserSatisfactionResponseModel response) = Success;
  const factory UserSatisfactionState.error(String message) = Error;
}
