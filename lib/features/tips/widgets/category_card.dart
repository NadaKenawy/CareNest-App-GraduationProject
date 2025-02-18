import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:care_nest/core/theme/text_styless.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String route;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(route);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
            ),
            SizedBox(height: 20.h),
            Text(
              title,
              style: TextStyles.font20BlackSemiBold,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
