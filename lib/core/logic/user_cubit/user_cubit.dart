import 'dart:convert';
import 'dart:developer';
import 'package:care_nest/core/helpers/constants.dart';
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
        log('User ID: ${savedUser.id}');
        await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.userId, savedUser.id);
        log('User ID saved to secure storage: ${savedUser.id}');
        if (savedUser.profileImg != null && savedUser.profileImg!.isNotEmpty) {
          await SharedPrefHelper.setSecuredString(
              SharedPrefKeys.userImage, savedUser.profileImg!);
          log('User image saved to secure storage: ${savedUser.profileImg}');
        }

        final babyImage =
            await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyImage);
        if (babyImage.isNotEmpty &&
            (savedUser.babyImage == null || savedUser.babyImage != babyImage)) {
          final updatedUser = savedUser.copyWith(babyImage: babyImage);
          emit(state.copyWith(user: updatedUser, isLoading: false));
          log('Baby image loaded from SharedPreferences: $babyImage');
        }
      } else {
        emit(state.copyWith(isLoading: false));
        log('No saved user data found.');
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      log('Error loading user data: $e');
    }
  }

  void setUser(UserModel user) {
    emit(state.copyWith(user: user));
    log('User set: ${user.firstname}');
    log('User ID: ${user.id}');
    saveUserDataLocally(user);
  }

  void updateBabyImage(String? imageUrl) async {
    final currentUser = state.user;
    if (currentUser != null) {
      final updatedUser = currentUser.copyWith(babyImage: imageUrl);
      emit(state.copyWith(user: updatedUser));
      await saveUserDataLocally(updatedUser);
      if (imageUrl == null || imageUrl.isEmpty) {
        await SharedPrefHelper.removeSecuredData(SharedPrefKeys.babyImage);
        log('🗑️ Baby image removed from secure storage');
      } else {
        log('✅ Baby image updated in UserCubit: $imageUrl');
      }
    }
  }

  void clearUser() {
    emit(UserState());
    log('User cleared');
    SharedPrefHelper.removeSecuredData('user_data');
    SharedPrefHelper.removeSecuredData('user_id');
    SharedPrefHelper.removeSecuredData(SharedPrefKeys.userImage);
    SharedPrefHelper.removeSecuredData(SharedPrefKeys.babyImage);
  }
}

Future<void> saveUserDataLocally(UserModel user) async {
  try {
    await SharedPrefHelper.setSecuredString(
      'user_data',
      jsonEncode(user.toJson()),
    );
    log('User data saved locally: ${user.firstname}');

    await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.userId,
      user.id,
    );
    log('User ID saved locally: ${user.id}');

    if (user.profileImg != null && user.profileImg!.isNotEmpty) {
      await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.userImage, user.profileImg!);
      log('User image saved locally: ${user.profileImg}');
    }

    if (user.babyImage != null && user.babyImage!.isNotEmpty) {
      await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.babyImage, user.babyImage!);
      log('Baby image saved locally: ${user.babyImage}');
    } else {
      await SharedPrefHelper.removeSecuredData(SharedPrefKeys.babyImage);
      log('🗑️ Baby image removed from secure storage (via saveUserDataLocally)');
    }
  } catch (e) {
    log('Error saving user data: $e');
  }
}

Future<UserModel?> getSavedUserData() async {
  try {
    final jsonString = await SharedPrefHelper.getSecuredString('user_data');
    if (jsonString.isNotEmpty) {
      log('✅ Found saved user data: $jsonString');
      final Map<String, dynamic> map = jsonDecode(jsonString);
      return UserModel.fromJson(map);
    } else {
      log('No saved user data found.');
      return null;
    }
  } catch (e) {
    log('Error retrieving saved user data: $e');
    await SharedPrefHelper.removeSecuredData('user_data');
    await SharedPrefHelper.removeSecuredData(SharedPrefKeys.userId);
    await SharedPrefHelper.removeSecuredData(SharedPrefKeys.userImage);
    await SharedPrefHelper.removeSecuredData(SharedPrefKeys.babyImage);
    return null;
  }
}
