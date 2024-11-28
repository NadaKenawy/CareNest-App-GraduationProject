import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/get_all_babies/get_all_babies_response.dart';

part 'get_all_babies_state.freezed.dart';

@freezed
class GetAllBabiesState<T> with _$GetAllBabiesState<T> {
  const factory GetAllBabiesState.initial() = _Initial;
  const factory GetAllBabiesState.loading() = Loading;
  const factory GetAllBabiesState.success(List<BabiesData>? babiesData) =
      Success;
  const factory GetAllBabiesState.error({required String error}) = Error;
}
