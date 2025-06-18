import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';
part 'update_report_state.freezed.dart';
@freezed
class UpdateReportState<T> with _$UpdateReportState<T> {
  const factory UpdateReportState.initial() = _Initial;
  const factory UpdateReportState.loading() = Loading;
  const factory UpdateReportState.success(T data) = Success;
  const factory UpdateReportState.error(ApiErrorModel apiErrorModel) = Error;
}
