import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/service_locator.dart';
import '../logic/update_user_cubit/update_user_cubit.dart';
import '../logic/update_user_image_cubit/update_user_image_cubit.dart';
import 'widgets/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => getIt<UpdateUserCubit>()),
       BlocProvider(create: (context) => getIt<UpdateUserImageCubit>()),
    ], child: const ProfileScreenBody());
  }
}
