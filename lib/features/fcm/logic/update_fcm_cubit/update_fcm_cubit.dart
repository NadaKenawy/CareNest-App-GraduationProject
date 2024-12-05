import 'dart:developer';

import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/fcm/data/models/update_fcm/update_fcm_token_request_body.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/update_fcm_repo.dart';
import 'update_fcm_state.dart';

class UpdateFcmCubit extends Cubit<UpdateFcmState> {
  UpdateFcmCubit(this._updateFcmRepo) : super(const UpdateFcmState.initial());

  final UpdateFcmRepo _updateFcmRepo;

  String? _deviceToken;

  /// دالة لجلب الـ Device Token
  Future<void> getDeviceToken() async {
    try {
      log('Requesting FCM token...');
      FirebaseMessaging messaging = FirebaseMessaging.instance;

      NotificationSettings settings = await messaging.requestPermission();

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        _deviceToken = await messaging.getToken();
        if (_deviceToken != null) {
          log('Device Token fetched successfully: $_deviceToken');
        } else {
          log('Failed to fetch Device Token.');
        }
      } else {
        log('User declined or has not accepted notification permissions.');
      }
    } catch (e) {
      log('Error fetching Device Token: $e');
    }
  }

  /// دالة لإرسال الـ Device Token إلى الـ backend
  Future<void> emitUpdateFcmState() async {
    if (_deviceToken == null) {
      log('Device Token is null. Please fetch it first.');
      return;
    }

    emit(const UpdateFcmState.updateFcmLoading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    log('Authorization Token Retrieved: $token');

    final response = await _updateFcmRepo.updateFcm(
      UpdateFcmTokenRequestBody(
        fcmToken: _deviceToken!,
      ),
      token,
    );

    response.when(
      success: (updateFcmResponse) async {
        log('Update FCM Token Success: $updateFcmResponse');
        emit(UpdateFcmState.updateFcmSuccess(updateFcmResponse));
      },
      failure: (apiErrorModel) {
        log('API Error: $apiErrorModel');
        emit(UpdateFcmState.updateFcmError(apiErrorModel));
      },
    );
  }

  /// دالة لتنسيق جلب وإرسال الـ Token
  Future<void> initializeAndSendToken() async {
    await getDeviceToken();
    if (_deviceToken != null) {
      await emitUpdateFcmState();
    } else {
      log('Device Token is null, skipping FCM update.');
    }
  }
}
