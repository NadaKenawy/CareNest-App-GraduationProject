import 'package:care_nest/features/add_baby/ui/widgets/babies_list_view_skeletonizer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BabiesListViewSkeletonizer extends StatelessWidget {
  const BabiesListViewSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: const BabiesListViewSkeletonizerItem(
                gender: 'boy',
                name: 'Karma',
                age: '12',
                weight: '15',
                height: '100',
              ));
        },
      ),
    );
  }
}
