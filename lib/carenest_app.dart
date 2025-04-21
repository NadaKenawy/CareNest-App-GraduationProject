import 'package:care_nest/core/di/service_locator.dart';
import 'package:care_nest/core/logic/user_cubit/user_cubit.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/routing/app_router.dart';

class CareNest extends StatelessWidget {
  const CareNest({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 907),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UserCubit>(
            create: (_) => getIt<UserCubit>(),
          ),
          BlocProvider<GetAllBabiesCubit>(
            create: (context) => getIt<GetAllBabiesCubit>()..getAllBabies(),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            textTheme: GoogleFonts.fredokaTextTheme(),
          ),
        ),
      ),
    );
  }
}
