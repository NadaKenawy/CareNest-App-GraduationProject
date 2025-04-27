import 'package:flutter_bloc/flutter_bloc.dart';
import 'delete_message_state.dart';
import '../../data/repos/delete_message_repo.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/helpers/constants.dart';
import '../../data/models/delete_message/delete_message_response.dart';

class DeleteMessageCubit extends Cubit<DeleteMessageState> {
  final DeleteMessageRepo repo;
  DeleteMessageCubit(this.repo) : super(const DeleteMessageState.initial());

  Future<void> deleteMessage(String messageId) async {
    emit(const DeleteMessageState.loading());
    try {
      final token =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
      final DeleteMessageResponse res =
          await repo.deleteMessage(token, messageId);
      if (res.success) {
        emit(DeleteMessageState.success(messageId));
      } else {
        emit(DeleteMessageState.error(res.message));
      }
    } catch (e) {
      emit(DeleteMessageState.error(e.toString()));
    }
  }
}
