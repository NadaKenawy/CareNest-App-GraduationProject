import 'dart:developer';

import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:care_nest/features/baby_growth/logic/put_growth_data_cubit/put_growth_data_cubit.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/put_growth_data_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class UpdateGrowthData extends StatelessWidget {
  const UpdateGrowthData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
        buttonText: 'Update Growth Data',
        textStyle: TextStyles.font16WhiteBold,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
            ),
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Update Growth Data",
                      style: TextStyle(
                          fontSize: 28.sp, fontWeight: FontWeightHelper.bold),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AppTextFormField(
                            controller: context
                                .read<PutGrowthDataCubit>()
                                .weightController,
                            hintText: 'Weight',
                            prefixIcon: const Icon(
                              FontAwesomeIcons.weightScale,
                              color: ColorsManager.secondryBlueColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: AppTextFormField(
                            controller: context
                                .read<PutGrowthDataCubit>()
                                .heightController,
                            hintText: 'Height',
                            prefixIcon: const Icon(
                              FontAwesomeIcons.rulerVertical,
                              color: ColorsManager.secondryBlueColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppTextButton(
                            buttonText: 'Save',
                            textStyle: TextStyles.font16WhiteBold,
                            buttonWidth: 168.w,
                            onPressed: () async {
                              final babyId =
                                  await SharedPrefHelper.getSecuredString(
                                      SharedPrefKeys.babyId);
                              log("Retrieved baby id: $babyId");

                              context
                                  .read<PutGrowthDataCubit>()
                                  .emitPutGrowthDataState(babyId);
                            },
                          ),
                          const PutGrowthDataBlocListener(),
                          AppTextButton(
                            buttonText: 'Cancel',
                            textStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeightHelper.bold),
                            buttonWidth: 168.w,
                            buttonColor: Colors.transparent,
                            borderColor: Colors.black,
                            borderRadius: 16.r,
                            borderWidth: 2,
                            textColor: Colors.black,
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                          ),
                        ]),
                  ],
                ),
              );
            },
          );
        });
  }
}
