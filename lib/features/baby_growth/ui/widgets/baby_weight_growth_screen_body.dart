import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/baby_growth/logic/get_baby_weight_growth_cubit/get_baby_weight_growth_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/get_baby_weight_growth_cubit/get_baby_weight_growth_state.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/get_baby_weight_growth_bloc_builder.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/growth_info_card.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/header_section.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/update_growth_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BabyWeightGrowthScreenBody extends StatefulWidget {
  const BabyWeightGrowthScreenBody({super.key});

  @override
  _BabyWeightGrowthScreenBodyState createState() =>
      _BabyWeightGrowthScreenBodyState();
}

class _BabyWeightGrowthScreenBodyState
    extends State<BabyWeightGrowthScreenBody> {
  String selectedBaby = "Your Baby";
  String selectedImage = "assets/images/baby_profile_girl.png";
  String babyId = "67a5a8c411c8ec3946a504f9";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                HeaderSection(
                  babyId: babyId,
                  selectedBaby: selectedBaby,
                  selectedImage: selectedImage,
                  onBabySelected: (id, name, image) {
                    setState(() {
                      selectedBaby = name;
                      selectedImage = image;
                      babyId = id;
                    });
                    context
                        .read<GetBabyWeightGrowthCubit>()
                        .getBabyWeightGrowth(id);
                  },
                ),
              ],
            ),
            BlocBuilder<GetBabyWeightGrowthCubit, GetBabyWeightGrowthState>(
              builder: (context, state) {
                String lastRecordValue = "N/A";
                String previousRecordValue = "N/A";

                if (state is Success && state.measurementData != null) {
                  var validWeights = state.measurementData!
                      .map((e) => e.weight)
                      .where((weight) => weight != null)
                      .toList();

                  if (validWeights.isNotEmpty) {
                    lastRecordValue = "${validWeights.last} kg";
                    if (validWeights.length > 1) {
                      previousRecordValue =
                          "${validWeights[validWeights.length - 2]} kg";
                    }
                  }
                }

                return Column(
                  children: [
                    GrowthInfoCard(
                      lastRecord: 'Last recorded weight ',
                      lastRecordValue: previousRecordValue,
                      current: 'Your baby’s current weight ',
                      currentValue: lastRecordValue,
                    ),
                    SizedBox(height: 16.h),
                    const Divider(color: Colors.grey, thickness: 2),
                    SizedBox(height: 28.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: const GetBabyWeightGrowthBlocBuilder(),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: const Color(0xff3F7726),
                            ),
                            height: 28.h,
                            width: 28.w,
                            child: Icon(Icons.check,
                                color: Colors.white, size: 22.sp),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            (previousRecordValue != "N/A" &&
                                    lastRecordValue != "N/A")
                                ? "Your baby has gained ${(double.parse(lastRecordValue.split(' ')[0]) - double.parse(previousRecordValue.split(' ')[0])).toStringAsFixed(1)} kg in the last month, which is a healthy growth rate."
                                : "Last recorded weight is $lastRecordValue. Keep tracking your baby's growth",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeightHelper.semiBold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20.h),
            const Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppTextButton(
                      buttonText: 'Height for age',
                      textStyle: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeightHelper.bold),
                      buttonWidth: 168.w,
                      buttonColor: Colors.transparent,
                      borderColor: ColorsManager.secondryBlueColor,
                      borderRadius: 16.r,
                      borderWidth: 2,
                      textColor: Colors.grey,
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    AppTextButton(
                      buttonText: 'Weight per growth',
                      textStyle: TextStyles.font16WhiteBold,
                      buttonWidth: 168.w,
                      buttonColor: ColorsManager.secondryBlueColor,
                      onPressed: () {},
                    ),
                  ]),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: UpdateGrowthData(
                babyId: babyId,
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
