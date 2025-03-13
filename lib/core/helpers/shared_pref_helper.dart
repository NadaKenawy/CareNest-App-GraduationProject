// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static AndroidOptions _androidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static removeData(String key) async {
    debugPrint(
        'SharedPrefHelper : data with key : $key has been removed from SharedPreferences');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  static clearAllData() async {
    debugPrint(
        'SharedPrefHelper : all data has been cleared from SharedPreferences');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  static setData(String key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value.runtimeType) {
      case String:
        await sharedPreferences.setString(key, value);
        break;
      case int:
        await sharedPreferences.setInt(key, value);
        break;
      case bool:
        await sharedPreferences.setBool(key, value);
        break;
      case double:
        await sharedPreferences.setDouble(key, value);
        break;
      default:
        debugPrint("SharedPrefHelper : Unsupported value type");
        return null;
    }
  }

  static getBool(String key) async {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  static getDouble(String key) async {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  static getInt(String key) async {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  static getString(String key) async {
    debugPrint('SharedPrefHelper : getString with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  static Future<void> setSecuredString(String key, String value) async {
    try {
      debugPrint(
          "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
      await _secureStorage.write(
        key: key,
        value: value,
        aOptions: _androidOptions(),
      );
    } catch (e) {
      debugPrint('Error saving secured string: $e');
    }
  }

  static Future<String> getSecuredString(String key) async {
    try {
      debugPrint('FlutterSecureStorage : getSecuredString with key : $key');
      return await _secureStorage.read(key: key, aOptions: _androidOptions()) ??
          '';
    } catch (e) {
      debugPrint('Error reading secured string: $e');
      await _secureStorage.delete(key: key);
      return '';
    }
  }

  static Future<void> removeSecuredData(String key) async {
    try {
      debugPrint(
          'FlutterSecureStorage : data with key : $key has been removed');
      await _secureStorage.delete(key: key, aOptions: _androidOptions());
    } catch (e) {
      debugPrint('Error removing secured data: $e');
    }
  }

  static Future<void> clearAllSecuredData() async {
    try {
      debugPrint('FlutterSecureStorage : all data has been cleared');
      await _secureStorage.deleteAll(aOptions: _androidOptions());
    } catch (e) {
      debugPrint('Error clearing secure storage: $e');
    }
  }

  
}
