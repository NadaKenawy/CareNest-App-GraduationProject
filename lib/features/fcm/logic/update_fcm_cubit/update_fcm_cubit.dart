import 'dart:developer';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/fcm/data/models/update_fcm/update_fcm_token_request_body.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../data/repos/update_fcm_repo.dart';
import 'update_fcm_state.dart';

class UpdateFcmCubit extends Cubit<UpdateFcmState> {
  UpdateFcmCubit(this._updateFcmRepo) : super(const UpdateFcmState.initial());

  final UpdateFcmRepo _updateFcmRepo;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  String? _deviceToken;

  Future<void> initializeNotificationService() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await _requestPermission();
    await _setupLocalNotifications();
    await _setupMessageHandlers();
  }

  Future<void> _requestPermission() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('Notification permissions granted.');
    } else {
      log('Notification permissions declined or not accepted.');
    }
  }

  Future<void> _setupLocalNotifications() async {
    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettingsDarwin = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        log('Notification clicked with payload: ${details.payload}');
      },
    );
  }

  Future<void> _setupMessageHandlers() async {
    FirebaseMessaging.onMessage.listen((message) {
      _showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log('Notification opened while app was in background: ${message.data}');
      _handleNotificationTap(message);
    });

    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      log('Notification caused app launch: ${initialMessage.data}');
      _handleNotificationTap(initialMessage);
    }
  }

  Future<void> _showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      await _localNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription:
                'This channel is used for important notifications.',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: message.data.toString(),
      );
    }
  }

  void _handleNotificationTap(RemoteMessage message) {
    log('Handling tapped notification: ${message.data}');
    // Handle navigation or actions based on notification data
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    log('Background message received: ${message.data}');
  }

  Future<void> getDeviceToken() async {
    try {
      log('Requesting FCM token...');
      _deviceToken = await FirebaseMessaging.instance.getToken();
      if (_deviceToken != null) {
        log('Device Token fetched successfully: $_deviceToken');
      } else {
        log('Failed to fetch Device Token.');
      }
    } catch (e) {
      log('Error fetching Device Token: $e');
    }
  }

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
      success: (updateFcmResponse) {
        log('Update FCM Token Success: $updateFcmResponse');
        emit(UpdateFcmState.updateFcmSuccess(updateFcmResponse));
      },
      failure: (apiErrorModel) {
        log('API Error: $apiErrorModel');
        emit(UpdateFcmState.updateFcmError(apiErrorModel));
      },
    );
  }

  Future<void> initializeAndSendToken() async {
    await getDeviceToken();
    if (_deviceToken != null) {
      await emitUpdateFcmState();
    } else {
      log('Device Token is null, skipping FCM update.');
    }
  }
}
