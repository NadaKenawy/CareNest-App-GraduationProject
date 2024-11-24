import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/features/add_baby/data/models/get_all_babies_response.dart';
import 'package:care_nest/features/add_baby/ui/widgets/baby_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyBabiesListView extends StatelessWidget {
  const MyBabiesListView({super.key, required this.babiesList});
  final List<BabiesData>? babiesList;

  @override
  Widget build(BuildContext context) {
    final reversedList = babiesList?.reversed.toList() ?? [];

    return ListView.builder(
      itemCount: reversedList.length,
      itemBuilder: (context, index) {
        final babyData = reversedList[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 40.h),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRouter.kBabyDataScreen, extra: reversedList[index]);
            },
            child: BabyContainer(
              gender: babyData.gender ?? "Unknown",
              name: babyData.name ?? "Ali",
              babyId: babyData.id!,
            ),
          ),
        );
      },
    );
  }
}
