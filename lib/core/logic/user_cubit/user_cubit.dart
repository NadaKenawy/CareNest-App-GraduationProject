import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/shared_pref_helper.dart';
import '../../models/user_model.dart';

class UserState {
  final UserModel? user;
  final bool isLoading;

  UserState({this.user, this.isLoading = false});

  UserState copyWith({UserModel? user, bool? isLoading}) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState(isLoading: true)) {
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final savedUser = await getSavedUserData();
      if (savedUser != null) {
        emit(state.copyWith(user: savedUser, isLoading: false));
        log('User loaded from cache: ${savedUser.firstname}');
        log('User birthdate: ${savedUser.dateOfBirth}');
      } else {
        emit(state.copyWith(isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      log('Error loading user data: $e');
    }
  }

  void setUser(UserModel user) {
    emit(state.copyWith(user: user));
    log('User set: ${user.firstname}');
  }

  void clearUser() {
    emit(UserState());
  }
}

Future<void> saveUserDataLocally(UserModel user) async {
  await SharedPrefHelper.setSecuredString(
    'user_data',
    jsonEncode(user.toJson()),
  );
}

Future<UserModel?> getSavedUserData() async {
  final jsonString = await SharedPrefHelper.getSecuredString('user_data');
  log("✅ Found saved user data: $jsonString");
  return UserModel.fromJson(jsonDecode(jsonString));
}
