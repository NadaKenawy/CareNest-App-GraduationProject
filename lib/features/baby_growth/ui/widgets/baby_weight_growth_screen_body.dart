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
import 'package:care_nest/features/baby_growth/ui/widgets/growth_advice_card.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/growth_info_card.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'update_weight_growth_data.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/baby_weight_growth_chart.dart';

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
    final gender =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyGender);
    final savedImage =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyImage);

    setState(() {
      babyId = id;
      selectedBaby = name;
      if (savedImage.isNotEmpty) {
        selectedImage = savedImage;
      } else if (gender.isNotEmpty) {
        selectedImage = gender == 'Male'
            ? AppImages.boyProfileImage
            : AppImages.girlProfileImage;
      }
    });

    if (babyId.isNotEmpty) {
      final state = context.read<GetAllBabiesCubit>().state;
      if (state is Success) {
        state.maybeWhen(
          success: (babiesData) {
            try {
              final matchingBabies = babiesData!.where((b) => b.id == babyId);
              if (matchingBabies.isNotEmpty) {
                final baby = matchingBabies.first;
                final newImage = baby.babyImage?.isNotEmpty == true
                    ? baby.babyImage!
                    : (baby.gender == 'Male'
                        ? AppImages.boyProfileImage
                        : AppImages.girlProfileImage);
                setState(() {
                  selectedImage = newImage;
                });
                SharedPrefHelper.setSecuredString(
                    SharedPrefKeys.babyImage, newImage);
                SharedPrefHelper.setSecuredString(
                    SharedPrefKeys.babyGender, baby.gender ?? 'Male');
              }
            } catch (e) {
              log("Error fetching baby data: $e");
            }
          },
          orElse: () {},
        );
      }
      context.read<GetBabyWeightGrowthCubit>().getBabyWeightGrowth(babyId);
      context.read<LatestGrowthDataCubit>().latestGrowthData(babyId);
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showAddBabyDialog(context);
      });
    }
  }

  void _showAddBabyDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.child_care,
                  size: 48, color: ColorsManager.primaryPinkColor),
              const SizedBox(height: 16),
              Text(
                "Let's get started!",
                style: TextStyles.font16BlackMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Add your baby to begin tracking their growth journey. You can add more anytime.',
                textAlign: TextAlign.center,
                style: TextStyles.font16BlackMedium
                    .copyWith(color: Colors.grey[600], fontSize: 14),
              ),
              const SizedBox(height: 24),
              AppTextButton(
                buttonText: 'Add Baby',
                textStyle: TextStyles.font16WhiteMedium,
                buttonColor: ColorsManager.primaryPinkColor,
                borderRadius: 16,
                buttonHeight: 48,
                buttonWidth: double.infinity,
                onPressed: () {
                  GoRouter.of(context)
                      .pushReplacement(AppRouter.kAddBabyScreen);
                },
              ),
              const SizedBox(height: 24),
              Divider(color: Colors.grey[300]),
              const SizedBox(height: 16),
              Text(
                'Already have a baby?',
                style: TextStyles.font16BlackMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Select from the dropdown to view their growth history.',
                textAlign: TextAlign.center,
                style: TextStyles.font16BlackMedium
                    .copyWith(color: Colors.grey[600], fontSize: 14),
              ),
              const SizedBox(height: 24),
              AppTextButton(
                buttonText: 'OK',
                textStyle: TextStyles.font16WhiteMedium,
                buttonColor: ColorsManager.primaryPinkColor,
                borderRadius: 16,
                buttonHeight: 48,
                buttonWidth: double.infinity,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
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
              onBabySelected: (id, name, image) async {
                setState(() {
                  selectedBaby = name;
                  selectedImage = image;
                  babyId = id;
                });
                context
                    .read<GetBabyWeightGrowthCubit>()
                    .getBabyWeightGrowth(id);
                context.read<LatestGrowthDataCubit>().latestGrowthData(id);
                await SharedPrefHelper.setSecuredString(
                    SharedPrefKeys.babyId, id);
                await SharedPrefHelper.setSecuredString(
                    SharedPrefKeys.babyName, name);
                await SharedPrefHelper.setSecuredString(
                    SharedPrefKeys.babyImage, image);
              },
            ),
            BlocBuilder<GetBabyWeightGrowthCubit, GetBabyWeightGrowthState>(
              builder: (context, state) {
                String lastRecordValue = "N/A";
                String previousRecordValue = "N/A";
                List<dynamic> chartData = [];

                if (babyId.isNotEmpty &&
                    state is Success &&
                    state.measurementData != null) {
                  var validWeights = state.measurementData!
                      .map((e) => e.weight)
                      .where((weight) => weight != null)
                      .toList();
                  chartData = state.measurementData!;
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
                      lastRecord: 'Last month recorded weight ',
                      lastRecordValue: previousRecordValue,
                      current: 'Your baby\'s current weight ',
                      currentValue: lastRecordValue,
                    ),
                    SizedBox(height: 16.h),
                    const Divider(color: Colors.grey, thickness: 2),
                    SizedBox(height: 28.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: BabyWeightGrowthChart(
                          userWeights:
                              babyId.isEmpty ? [] : List.from(chartData)),
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
                          fontSize: 16.sp,
                          fontWeight: FontWeightHelper.semiBold),
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
                      textStyle: TextStyles.font16WhiteMedium,
                      buttonWidth: 168.w,
                      buttonColor: ColorsManager.secondryBlueColor,
                      onPressed: () {},
                    ),
                  ]),
            ),
            SizedBox(height: 4.h),
            if (babyId.isNotEmpty)
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
