import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/features/community/data/repos/create_message_repo.dart';
import 'package:care_nest/features/community/logic/create_message/create_message_state.dart';
import 'package:care_nest/features/community/logic/get_community_messages/get_community_messages_cubit.dart';
import 'package:care_nest/features/community/data/models/get_community_messages/get_community_messages_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateMessageCubit extends Cubit<CreateMessageState> {
  final CreateMessageRepo _repo;
  final GetCommunityMessagesCubit _messagesCubit;

  CreateMessageCubit(this._repo, this._messagesCubit)
      : super(const CreateMessageState.initial());

  Future<void> createMessage({
    String? message,
    List<MultipartFile>? images,
    MultipartFile? audio,
  }) async {
    emit(const CreateMessageState.loading());

    final token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final userId =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userId);

    final formData = FormData();

    if (message != null && message.isNotEmpty) {
      formData.fields.add(MapEntry('message', message));
    }

    if (images != null && images.isNotEmpty) {
      for (var image in images) {
        formData.files.add(MapEntry('images', image));
      }
    }

    if (audio != null) {
      formData.files.add(MapEntry('audio', audio));
    }

    final result = await _repo.createMessage(formData, token);

    result.when(
      success: (response) {
        if (response.success) {
          // Create a new message object from the response
          final newMessage = CommunityMessage(
            id: response.data['id'] as String?,
            senderId: userId,
            message: message ?? response.data['message'] as String? ?? '',
            timestamp: DateTime.now(),
            userImage: response.data['userImage'] as String?,
            images: response.data['images'] as List<String>?,
            mediaUrl: response.data['mediaUrl'] as String?,
            mediaType: response.data['mediaType'] as String?,
          );

          // Add the new message to the messages list immediately
          _messagesCubit.addNewMessage(newMessage);
          emit(CreateMessageState.success(response));
        } else {
          emit(CreateMessageState.error(message: response.message));
        }
      },
      failure: (error) {
        emit(CreateMessageState.error(message: error.toString()));
      },
    );
  }
}
