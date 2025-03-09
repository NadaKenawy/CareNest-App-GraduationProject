import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyAppointmentScreenBody extends StatelessWidget {
  const MyAppointmentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Appointment',
          style: TextStyles.font20BlackSemiBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: ListView.separated(
          itemCount: 2,
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            if (index == 0) {
              return _buildAppointmentCard(
                context,
                doctorName: 'Dr. Ahmed Saeed',
                specialization: 'Pediatrician',
                dateTime: 'Wed, 17 May | 08.30 AM',
                doctorImage: 'assets/images/doctors_test_img.png',
              );
            } else {
              return _buildAppointmentCard(
                context,
                doctorName: 'Dr. Yasmin Mostafa',
                specialization: 'Pediatrician',
                dateTime: 'Wed, 17 May | 08.30 AM',
                doctorImage: 'assets/images/doctors_test_img.png',
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(
    BuildContext context, {
    required String doctorName,
    required String specialization,
    required String dateTime,
    required String doctorImage,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Image.asset(
                  'assets/images/doctors_test_img.png',
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: TextStyles.font20BlackSemiBold,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      specialization,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      dateTime,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextButton(
                buttonText: 'Reschedule',
                textStyle: TextStyles.font16WhiteBold,
                buttonColor: ColorsManager.secondryBlueColor,
                buttonWidth: 140.w,
                buttonHeight: 44.h,
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kDoctorDetailsScreen);
                },
              ),
              SizedBox(width: 16.w),
              AppTextButton(
                buttonText: 'Cancel',
                textStyle: TextStyles.font16SecondaryBlueBold,
                borderColor: ColorsManager.secondryBlueColor,
                buttonColor: Colors.white,
                textColor: ColorsManager.secondryBlueColor,
                borderWidth: 2.w,
                buttonWidth: 140.w,
                buttonHeight: 44.h,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
