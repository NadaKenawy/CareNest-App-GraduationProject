import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/tips/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TargetSelectionScreenBody extends StatelessWidget {
  const TargetSelectionScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Category',
          style: TextStyles.font20BlackSemiBold,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CategoryCard(
                title: 'Mom Tips',
                imagePath: 'assets/images/17634.webp',
                route: AppRouter.kMomTipsScreen,
              ),
              SizedBox(height: 40.h),
              const CategoryCard(
                title: 'Baby Tips',
                imagePath:
                    'assets/images/getimg_ai_img-S8Pqoy02QADotvjifjvze.webp',
                route: AppRouter.kBabyTipsScreen,
              ),
              SizedBox(height: 56.h),
            ],
          ),
        ),
      ),
    );
  }
}
