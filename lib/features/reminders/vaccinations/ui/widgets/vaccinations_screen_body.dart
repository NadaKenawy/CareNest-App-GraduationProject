import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/get_baby_vaccines_cubit.dart';
import 'package:care_nest/features/reminders/vaccinations/ui/widgets/get_baby_vaccines_bloc_builder.dart';
import 'package:care_nest/features/reminders/vaccinations/ui/widgets/vaccination_list_skeletonizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/routing/app_router.dart';

import '../../../../../core/widgets/babies_dropdown.dart';

class VaccinationsScreenBody extends StatefulWidget {
  const VaccinationsScreenBody({super.key});

  @override
  _VaccinationsScreenBodyState createState() => _VaccinationsScreenBodyState();
}

class _VaccinationsScreenBodyState extends State<VaccinationsScreenBody> {
  String? selectedBabyName = '';
  String? selectedBabyId = '';
  String selectedBabyImage = AppImages.boyAndGirlImage;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadBabyData();
  }

  Future<void> loadBabyData() async {
    final babyName =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyName);
    final babyId =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyId);

    setState(() {
      selectedBabyName = babyName;
      selectedBabyId = babyId;
      isLoading = false;
    });

    if (selectedBabyId != null && selectedBabyId!.isNotEmpty) {
      context.read<GetBabyVaccinesCubit>().getBabyVaccines(selectedBabyId!);
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showAddBabyDialog(context);
      });
    }
  }

  void onBabySelected(String id, String name, String image) async {
    setState(() {
      isLoading = true;
    });
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.babyName, name);
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.babyId, id);

    setState(() {
      selectedBabyName = name;
      selectedBabyId = id;
      selectedBabyImage = image;
      isLoading = false;
    });
    context.read<GetBabyVaccinesCubit>().getBabyVaccines(id);
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
                'Add your baby to begin tracking their health and vaccinations. You can add more anytime.',
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
                'Select from the dropdown to view their vaccination history.',
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
      appBar: AppBar(
        toolbarHeight: 80.h,
        title: Text(
          selectedBabyName?.isNotEmpty == true
              ? "${selectedBabyName![0].toUpperCase()}${selectedBabyName!.substring(1)}'s Vaccinations"
              : 'My Vaccinations',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: BabyDropdown(
              selectedImage: selectedBabyImage,
              mode: BabyDropdownMode.basicWithGender,
              onSelected: (id, name, image, [index]) {
                onBabySelected(id, name, image);
              },
            ),
          )
        ],
      ),
      body: isLoading
          ? const Center(child: VaccinationListSkeletonizer())
          : (selectedBabyId != null && selectedBabyId!.isNotEmpty)
              ? const GetBabyVaccinesBlocBuilder()
              : const SizedBox.shrink(),
    );
  }
}
