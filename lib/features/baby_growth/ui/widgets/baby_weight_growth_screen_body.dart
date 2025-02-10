
import 'dart:developer';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/get_baby_weight_growth_cubit/get_baby_weight_growth_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/get_baby_weight_growth_cubit/get_baby_weight_growth_state.dart';
import 'package:care_nest/features/baby_growth/logic/latest_growth_data_cubit/latest_growth_data_cubit.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/get_baby_weight_growth_bloc_builder.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/growth_advice_card.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/growth_info_card.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'update_weight_growth_data.dart';

class BabyWeightGrowthScreenBody extends StatefulWidget {
  const BabyWeightGrowthScreenBody({super.key});

  @override
  _BabyWeightGrowthScreenBodyState createState() =>
      _BabyWeightGrowthScreenBodyState();
}

class _BabyWeightGrowthScreenBodyState
    extends State<BabyWeightGrowthScreenBody> {
  String selectedBaby = "Your Baby";
  String selectedImage = AppImages.girlProfileImage;
  String babyId = "";

  @override
  void initState() {
    super.initState();
    loadBabyData();
  }

  Future<void> loadBabyData() async {
    final id = await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyId);
    final name =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyName);
    setState(() {
      babyId = id;
      selectedBaby = name;
    });
    if (babyId.isNotEmpty) {
      final state = context.read<GetAllBabiesCubit>().state;
      if (state is Success) {
        state.maybeWhen(
          success: (babiesData) {
            try {
              final baby = babiesData!.firstWhere((b) => b.id == babyId);
              setState(() {
                selectedImage = baby.gender == 'Male'
                    ? AppImages.boyProfileImage
                    : AppImages.girlProfileImage;
              });
            } catch (e) {
              log("Error fetching baby data: $e");
            }
          },
          orElse: () {},
        );
      }
      context.read<GetBabyWeightGrowthCubit>().getBabyWeightGrowth(babyId);
      context.read<LatestGrowthDataCubit>().latestGrowthData(babyId);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadDefaultBaby(); // نحمل الطفل الافتراضي أول ما الشاشة تفتح
  }

  Future<void> _loadDefaultBaby() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final defaultBabyId =
        sharedPreferences.getString(SharedPrefKeys.babyId) ?? "";

    if (defaultBabyId.isNotEmpty) {
      setState(() {
        babyId = defaultBabyId;
      });

      context
          .read<GetBabyWeightGrowthCubit>()
          .getBabyWeightGrowth(defaultBabyId);
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
                context.read<LatestGrowthDataCubit>().latestGrowthData(id);
                SharedPrefHelper.setSecuredString(SharedPrefKeys.babyId, id);
                SharedPrefHelper.setSecuredString(
                    SharedPrefKeys.babyName, name);
              },
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
                      isHeightCard: false,
                      status: 'Normal',
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: const GrowthAdviceCard(measurementType: "weight"),
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
              child: UpdateWeightGrowthData(
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
