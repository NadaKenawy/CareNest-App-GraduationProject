import 'package:care_nest/features/profile/ui/widgets/custom_profile_app_bar.dart';
import 'package:care_nest/features/profile/ui/widgets/profile_data_fields.dart';
import 'package:care_nest/features/profile/ui/widgets/profile_image.dart';
import 'package:care_nest/features/profile/ui/widgets/profile_name_and_bio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/logic/user_cubit/user_cubit.dart';


class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {

     final user = context.watch<UserCubit>().state.user;
    if (user == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomProfileAppBar(),
            SizedBox(height: 20.h),
            const ProfileImage(),
            SizedBox(height: 12.h),
            const ProfileNameAndBio(),
            SizedBox(height: 32.h),
             ProfileDataFields( 
              user: user,),
          ],
        ),
      ),
    );
  }
}
