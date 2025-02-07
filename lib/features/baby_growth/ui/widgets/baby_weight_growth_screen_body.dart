import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/baby_growth/logic/cubit/get_baby_growth_cubit_cubit.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/get_baby_height_growth_bloc_builder.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/growth_info_card.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/header_section.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/update_growth_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BabyWeightGrowthScreenBody extends StatefulWidget {
  const BabyWeightGrowthScreenBody({super.key});

  @override
  _BabyWeightGrowthScreenBodyState createState() =>
      _BabyWeightGrowthScreenBodyState();
}

class _BabyWeightGrowthScreenBodyState
    extends State<BabyWeightGrowthScreenBody> {
  List<Map<String, String>> babies = [
    {"name": "Karma", "image": "assets/images/baby_profile_girl.png"},
    {"name": "Zain", "image": "assets/images/baby_profile_boy.png"},
    {"name": "Loly", "image": "assets/images/baby_profile_girl.png"},
  ];

  String selectedBaby = "Karma";
  String selectedImage = "assets/images/baby_profile_girl.png";
   String babyId = "67a5ff8229c3b62a46cef643";

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
                  onBabySelected: (id,name, image) {
                    setState(() {
                      selectedBaby = name;
                      selectedImage = image;
                       babyId = id;
                    });
                     context.read<GetBabyHeightGrowthCubit>().getBabyHeightGrowth(id);
                  },
                ),
              ],
            ),
            const GrowthInfoCard(),
            SizedBox(height: 28.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const GetBabyHeightGrowthBlocBuilder(),
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
                    child: Icon(Icons.check, color: Colors.white, size: 22.sp),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Your baby has gained 1.2 kg in the last month, which is a healthy growth rate.",
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
                      buttonText: 'Weight per growth',
                      textStyle: TextStyles.font16WhiteBold,
                      buttonWidth: 168.w,
                      buttonColor: ColorsManager.secondryBlueColor,
                      onPressed: () {},
                    ),
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
                      onPressed: () {},
                    ),
                  ]),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const UpdateGrowthData(),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
