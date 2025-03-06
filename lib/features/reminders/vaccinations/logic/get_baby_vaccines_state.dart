  import 'package:care_nest/features/reminders/vaccinations/data/models/get_baby_vaccines_response.dart';
  import 'package:freezed_annotation/freezed_annotation.dart';

  part 'get_baby_vaccines_state.freezed.dart';

  @freezed
  class GetBabyVaccinesState<T> with _$GetBabyVaccinesState<T> {
    const factory GetBabyVaccinesState.initial() = _Initial;
    const factory GetBabyVaccinesState.loading() = Loading;
    const factory GetBabyVaccinesState.success(
        List<BabyVaccineData>? vaccineData) = Success;
    const factory GetBabyVaccinesState.error({required String error}) = Error;
  }
