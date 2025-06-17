import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/update_report/update_report_request_body.dart';
import '../models/update_report/update_report_response.dart';

class UpdateReportRepo {
  final ApiService _apiService;
  UpdateReportRepo(this._apiService);

  Future<ApiResult<UpdateReportResponse>> updateReport(
    UpdateReportRequestBody updateReportRequestBody,
    String token,
    String id,
  ) async {
    try {
      final response = await _apiService.updateReport(
        token,
        id,
        updateReportRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
