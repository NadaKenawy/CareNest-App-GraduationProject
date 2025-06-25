import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/networking/api_error_model.dart';
import '../../data/models/create_report/create_report_response.dart';
part 'create_report_state.freezed.dart';
@freezed
class CreateReportState<T> with _$CreateReportState<T> {
  const factory CreateReportState.initial() = _Initial;
  const factory CreateReportState.loading() = Loading;
  const factory CreateReportState.success(
    CreateReportResponse createReportResponse,
  ) = Success;
  const factory CreateReportState.error(ApiErrorModel apiErrorModel) = Error;
}
