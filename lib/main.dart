import 'package:care_nest/core/di/service_locator.dart';
import 'package:care_nest/features/fcm/logic/update_fcm_cubit/update_fcm_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'carenest_app.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();

  await getIt<UpdateFcmCubit>().initializeAndSendToken();

  runApp(const CareNest());
}
