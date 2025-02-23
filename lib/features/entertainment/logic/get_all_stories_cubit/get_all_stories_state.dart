import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:care_nest/features/entertainment/data/models/get_all_stories/get_all_stories_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_stories_state.freezed.dart';

@freezed
class GetAllStoriesState<T> with _$GetAllStoriesState<T> {
  const factory GetAllStoriesState.initial() = _Initial;
  const factory GetAllStoriesState.loading() = Loading;
  const factory GetAllStoriesState.success(List<StoryData>? storiesData) = Success;
  const factory GetAllStoriesState.error(ApiErrorModel apiErrorModel) = Error;
}
