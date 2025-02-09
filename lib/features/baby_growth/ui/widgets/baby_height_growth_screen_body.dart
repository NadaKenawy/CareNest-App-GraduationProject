import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/baby_growth/logic/get_baby_height_growth_cubit/get_baby_height_growth_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/get_baby_height_growth_cubit/get_baby_height_growth_state.dart';
import 'package:care_nest/features/baby_growth/logic/latest_growth_data_cubit/latest_growth_data_cubit.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/get_baby_height_growth_bloc_builder.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/growth_advice_card.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/growth_info_card.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/header_section.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/update_height_growth_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BabyHeightGrowthScreenBody extends StatefulWidget {
  const BabyHeightGrowthScreenBody({super.key});

  @override
  _BabyHeightGrowthScreenBodyState createState() =>
      _BabyHeightGrowthScreenBodyState();
}

class _BabyHeightGrowthScreenBodyState
    extends State<BabyHeightGrowthScreenBody> {
  String selectedBaby = "Your Baby";
  String selectedImage = "assets/images/baby_profile_girl.png";
  String babyId = "67a5a8c411c8ec3946a504f9";

  @override
  void initState() {
    super.initState();
    _loadDefaultBaby();
  }

  Future<void> _loadDefaultBaby() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final defaultBabyId =
        sharedPreferences.getString(SharedPrefKeys.babyId) ?? '';

    if (defaultBabyId.isNotEmpty) {
      setState(() {
        babyId = defaultBabyId;
      });

      context
          .read<GetBabyHeightGrowthCubit>()
          .getBabyHeightGrowth(defaultBabyId);
      context.read<LatestGrowthDataCubit>().latestGrowthData(defaultBabyId);
    }
  }

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
                  //  babies: babies,
                  onBabySelected: (id, name, image) {
                    setState(() {
                      selectedBaby = name;
                      selectedImage = image;
                      babyId = id;
                    });
                    context
                        .read<GetBabyHeightGrowthCubit>()
                        .getBabyHeightGrowth(id);
                    context.read<LatestGrowthDataCubit>().latestGrowthData(id);
                  },
                ),
              ],
            ),
            BlocBuilder<GetBabyHeightGrowthCubit, GetBabyHeightGrowthState>(
              builder: (context, state) {
                String lastHeightValue = "N/A";
                String previousHeightValue = "N/A";

                if (state is Success && state.measurementData != null) {
                  var validHeights = state.measurementData!
                      .map((e) => e.height)
                      .where((height) => height != null)
                      .toList();

                  if (validHeights.isNotEmpty) {
                    lastHeightValue = "${validHeights.last} cm";
                    if (validHeights.length > 1) {
                      previousHeightValue =
                          "${validHeights[validHeights.length - 2]} cm";
                    }
                  }
                }

                return Column(
                  children: [
                    GrowthInfoCard(
                      isHeightCard: true,
                      status: 'Average',
                      lastRecord: 'Last recorded height ',
                      lastRecordValue: previousHeightValue,
                      current: 'Your baby’s current height ',
                      currentValue: lastHeightValue,
                    ),
                    SizedBox(height: 16.h),
                    const Divider(color: Colors.grey, thickness: 2),
                    SizedBox(height: 28.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: const GetBabyHeightGrowthBlocBuilder(),
                    ),
                    SizedBox(height: 28.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: const GrowthAdviceCard(measurementType: "height"),
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
                      buttonText: 'Height per growth',
                      textStyle: TextStyles.font16WhiteBold,
                      buttonWidth: 168.w,
                      buttonColor: ColorsManager.secondryBlueColor,
                      onPressed: () {},
                    ),
                    AppTextButton(
                      buttonText: 'Weight for age',
                      textStyle: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeightHelper.bold),
                      buttonWidth: 168.w,
                      buttonColor: Colors.transparent,
                      borderColor: ColorsManager.secondryBlueColor,
                      borderRadius: 16.r,
                      borderWidth: 2,
                      textColor: Colors.grey,
                      onPressed: () {
                        GoRouter.of(context)
                            .push(AppRouter.kBabyWeightGrowthScreen);
                      },
                    ),
                  ]),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: UpdateHeightGrowthData(
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
