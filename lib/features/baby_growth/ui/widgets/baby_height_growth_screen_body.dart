import 'dart:developer';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/get_baby_height_growth_cubit/get_baby_height_growth_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/get_baby_height_growth_cubit/get_baby_height_growth_state.dart';
import 'package:care_nest/features/baby_growth/logic/latest_growth_data_cubit/latest_growth_data_cubit.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/growth_advice_card.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/growth_info_card.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/header_section.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/update_height_growth_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/baby_height_growth_chart.dart';

class BabyHeightGrowthScreenBody extends StatefulWidget {
  const BabyHeightGrowthScreenBody({super.key});

  @override
  _BabyHeightGrowthScreenBodyState createState() =>
      _BabyHeightGrowthScreenBodyState();
}

class _BabyHeightGrowthScreenBodyState
    extends State<BabyHeightGrowthScreenBody> {
  String selectedBaby = "Your Baby";
  String selectedImage = AppImages.girlProfileImage;
  String babyId = "";
  bool isLoading = true;

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
      context.read<GetAllBabiesCubit>().state.maybeWhen(
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
      context.read<GetBabyHeightGrowthCubit>().getBabyHeightGrowth(babyId);
      context.read<LatestGrowthDataCubit>().latestGrowthData(babyId);
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showAddBabyDialog(context);
      });
    }
    setState(() {
      isLoading = false;
    });
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
                SharedPrefHelper.setSecuredString(SharedPrefKeys.babyId, id);
                SharedPrefHelper.setSecuredString(
                    SharedPrefKeys.babyName, name);
              },
            ),
            BlocBuilder<GetBabyHeightGrowthCubit, GetBabyHeightGrowthState>(
              builder: (context, state) {
                String lastHeightValue = "N/A";
                String previousHeightValue = "N/A";
                List<dynamic> chartData = [];

                if (babyId.isNotEmpty &&
                    state is Success &&
                    state.measurementData != null) {
                  var validHeights = state.measurementData!
                      .map((e) => e.height)
                      .where((height) => height != null)
                      .toList();
                  chartData = state.measurementData!;
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
                      lastRecord: 'Last month recorded height ',
                      lastRecordValue: previousHeightValue,
                      current: 'Your baby\'s current height ',
                      currentValue: lastHeightValue,
                    ),
                    SizedBox(height: 16.h),
                    const Divider(color: Colors.grey, thickness: 2),
                    SizedBox(height: 28.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: BabyHeightGrowthChart(
                          userHeights:
                              babyId.isEmpty ? [] : List.from(chartData)),
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
                      buttonText: 'Height per age',
                      textStyle: TextStyles.font16WhiteMedium,
                      buttonWidth: 168.w,
                      buttonColor: ColorsManager.secondryBlueColor,
                      onPressed: () {},
                    ),
                    AppTextButton(
                      buttonText: 'Weight for growth',
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
                        GoRouter.of(context)
                            .push(AppRouter.kBabyWeightGrowthScreen);
                      },
                    ),
                  ]),
            ),
            SizedBox(height: 4.h),
            if (babyId.isNotEmpty)
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
