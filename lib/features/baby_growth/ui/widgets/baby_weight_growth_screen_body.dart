import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
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
  List<Map<String, String>> babies = [];
  String selectedBaby = "Your Baby";
  String selectedImage = "assets/images/baby_profile_girl.png";

  @override
  void initState() {
    super.initState();
    context.read<GetAllBabiesCubit>().getAllBabies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(
              selectedBaby: selectedBaby,
              selectedImage: selectedImage,
              onBabySelected: (name, image) {
                setState(() {
                  selectedBaby = name;
                  selectedImage = image;
                });
              },
            ),
            const GrowthInfoCard(),
            SizedBox(height: 16.h),
            const Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            SizedBox(height: 32.h),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const GetBabyHeightGrowthBlocBuilder()),
            SizedBox(height: 28.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: const Color(0xff3F7726),
                    ),
                    height: 28.h,
                    width: 28.w,
                    child: Icon(Icons.check, color: Colors.white, size: 22.sp),
                  ),
                  SizedBox(width: 8.w),
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
