import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:care_nest/features/community/data/models/get_community_messages/get_community_messages_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_community_messages_state.freezed.dart';

@freezed
class GetCommunityMessagesState<T> with _$GetCommunityMessagesState<T> {
  const factory GetCommunityMessagesState.initial() = _Initial;
  const factory GetCommunityMessagesState.loading() = Loading;
  const factory GetCommunityMessagesState.success(
      List<CommunityMessage>? messages) = Success;
  const factory GetCommunityMessagesState.error(ApiErrorModel apiErrorModel) =
      Error;
}
