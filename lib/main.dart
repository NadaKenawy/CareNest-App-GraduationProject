import 'package:care_nest/core/di/service_locator.dart';
import 'package:care_nest/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'carenest_app.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/shared_pref_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(const CareNest());
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
