import 'package:care_nest/features/reminders/vaccinations/data/models/mark_vaccine_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'mark_vaccine_state.freezed.dart';

@freezed
class MarkVaccineState<T> with _$MarkVaccineState<T> {
  const factory MarkVaccineState.initial() = _Initial;
  const factory MarkVaccineState.loading() = Loading;
  const factory MarkVaccineState.success(
      List<VaccineAdministeredData>? vaccineData) = Success;
  const factory MarkVaccineState.error({required String error}) = Error;
}
