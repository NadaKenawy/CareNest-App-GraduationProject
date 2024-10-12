import 'package:care_nest/features/sign_up/ui/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const CareNest());
}

class CareNest extends StatelessWidget {
  const CareNest({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(411.4, 843.4),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignUp(),
      ),
    );
  }
}
