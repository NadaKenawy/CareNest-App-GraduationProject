import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/create_cry/create_cry_response_model.dart';

part 'create_cry_state.freezed.dart';

@freezed
class CreateCryState<T> with _$CreateCryState<T> {
  const factory CreateCryState.initial() = _Initial;
  const factory CreateCryState.loading() = Loading;
  const factory CreateCryState.success(CreateCryResponse response) = Success;
  const factory CreateCryState.error(ApiErrorModel apiErrorModel) = Error;
}
