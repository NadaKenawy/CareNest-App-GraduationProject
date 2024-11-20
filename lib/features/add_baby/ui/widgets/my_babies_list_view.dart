import 'package:care_nest/features/add_baby/data/models/get_all_babies_response.dart';
import 'package:care_nest/features/add_baby/ui/widgets/baby_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBabiesListView extends StatelessWidget {
  const MyBabiesListView({super.key, required this.babiesList});
  final List<BabiesData>? babiesList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: babiesList!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 40.h),
          child: BabyContainer(
            gender: "Boy",
            name: babiesList?[index].name ?? "ali",
          ),
        );
      },
    );
  }
}
