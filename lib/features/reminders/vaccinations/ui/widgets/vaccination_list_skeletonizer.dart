import 'package:care_nest/features/reminders/vaccinations/ui/widgets/vaccination_item_skeletonizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class VaccinationListSkeletonizer extends StatelessWidget {
  const VaccinationListSkeletonizer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 28.w, bottom: 16.h),
      child: Skeletonizer(
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return const VaccinationItemSkeletonizer();
          },
        ),
      ),
    );
  }
}
