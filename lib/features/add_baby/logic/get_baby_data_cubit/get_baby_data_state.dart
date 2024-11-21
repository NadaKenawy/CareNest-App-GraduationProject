import 'package:care_nest/features/add_baby/data/models/get_baby_data_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'get_baby_data_state.freezed.dart';

@freezed
class GetBabyDataState<T> with _$GetBabyDataState<T> {
  const factory GetBabyDataState.initial() = _Initial;
  const factory GetBabyDataState.loading() = Loading;
  const factory GetBabyDataState.success(List<BabyData>? babyData) =
      Success;
  const factory GetBabyDataState.error({required String error}) = Error;
}
