import 'package:care_nest/core/networking/api_service.dart';
import '../models/delete_message/delete_message_response.dart';

class DeleteMessageRepo {
  final ApiService apiService;
  DeleteMessageRepo(this.apiService);

  Future<DeleteMessageResponse> deleteMessage(String token, String messageId) {
    return apiService.deleteCommunityMessage(token, messageId);
  }
}
