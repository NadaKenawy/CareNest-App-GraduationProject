import 'package:care_nest/features/sign_up/ui/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CareNest());
}

class CareNest extends StatelessWidget {
  const CareNest({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.4, 843.4),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.fredokaTextTheme(),
        ),
        home: const SignUp(),
      ),
    );
  }
}
