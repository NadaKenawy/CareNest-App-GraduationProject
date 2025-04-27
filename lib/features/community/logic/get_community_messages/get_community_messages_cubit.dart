import 'dart:developer';

import 'package:care_nest/features/community/data/models/get_community_messages/get_community_messages_response.dart';
import 'package:care_nest/features/community/data/repos/get_community_messages_repo.dart';
import 'package:care_nest/features/community/logic/get_community_messages/get_community_messages_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/helpers/constants.dart';
import 'dart:async';

class GetCommunityMessagesCubit extends Cubit<GetCommunityMessagesState> {
  final GetCommunityMessagesRepo _getCommunityMessagesRepo;
  Timer? _pollingTimer;

  GetCommunityMessagesCubit(this._getCommunityMessagesRepo)
      : super(const GetCommunityMessagesState.initial());

  void getCommunityMessages() async {
    emit(const GetCommunityMessagesState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    final response =
        await _getCommunityMessagesRepo.getCommunityMessages(token);
    if (isClosed) return;

    response.when(
      success: (communityMessagesResponse) {
        emit(GetCommunityMessagesState.success(
            communityMessagesResponse.messages));
        // Start polling after initial load
        _startPolling();
      },
      failure: (apiErrorModel) {
        emit(GetCommunityMessagesState.error(apiErrorModel));
      },
    );
  }

  void _startPolling() {
    // Cancel any existing timer
    _pollingTimer?.cancel();

    // Start a new timer that polls every 3 seconds
    _pollingTimer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      if (isClosed) {
        timer.cancel();
        return;
      }

      String token =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

      final response =
          await _getCommunityMessagesRepo.getCommunityMessages(token);

      response.when(
        success: (communityMessagesResponse) {
          emit(GetCommunityMessagesState.success(
              communityMessagesResponse.messages));
        },
        failure: (apiErrorModel) {
          // Don't emit error state during polling to avoid UI disruption
          log('Polling error: ${apiErrorModel.message}');
        },
      );
    });
  }

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    return super.close();
  }

  void addNewMessage(CommunityMessage newMessage) {
    if (state is Success) {
      final currentMessages = (state as Success).messages;
      final updatedMessages = List<CommunityMessage>.from(currentMessages ?? [])
        ..add(newMessage)
        ..sort((a, b) => a.timestamp!.compareTo(b.timestamp!));
      emit(GetCommunityMessagesState.success(updatedMessages));
    }
  }

  void removeMessageById(String id) {
    final currentState = state;
    if (currentState is Success) {
      final updatedMessages =
          List<CommunityMessage>.from(currentState.messages ?? [])
            ..removeWhere((m) => m.id == id);
      emit(GetCommunityMessagesState.success(updatedMessages));
    }
  }
}
