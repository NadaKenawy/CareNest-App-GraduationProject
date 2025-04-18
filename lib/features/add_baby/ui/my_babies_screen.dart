import 'package:care_nest/features/add_baby/ui/widgets/my_babies_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/service_locator.dart';
import '../logic/delete_baby_cubit/delete_baby_cubit.dart';
import '../logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import '../logic/update_baby_cubit/update_baby_cubit.dart';

class MyBabiesScreen extends StatelessWidget {
  const MyBabiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => getIt<GetAllBabiesCubit>()..getAllBabies(),
      ),
      BlocProvider(
        create: (context) => getIt<DeleteBabyCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt<UpdateBabyCubit>(),
      ),
    ], child: const MyBabiesScreenBody());
  }
}
