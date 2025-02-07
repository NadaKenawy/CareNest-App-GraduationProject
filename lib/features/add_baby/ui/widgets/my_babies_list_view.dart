import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/features/add_baby/data/models/get_all_babies/get_all_babies_response.dart';
import 'package:care_nest/features/add_baby/ui/widgets/baby_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../logic/get_all_babies_cubit/get_all_babies_cubit.dart';

class MyBabiesListView extends StatelessWidget {
  const MyBabiesListView({super.key, required this.babiesList});
  final List<BabiesData>? babiesList;

  @override
  Widget build(BuildContext context) {
    final reversedList = babiesList?.reversed.toList() ?? [];
    if (reversedList.isEmpty) {
      return const NoBabyText();
    }

    return ListView.builder(
      itemCount: reversedList.length,
      itemBuilder: (context, index) {
        final babyData = reversedList[index];
        final latestWeight = getLatestValue(babyData.weight, isWeight: true);
        final latestHeight = getLatestValue(babyData.height, isWeight: false);

        return Padding(
          padding: EdgeInsets.only(bottom: 40.h),
          child: BabyContainer(
            onPressed: () {
              GoRouter.of(context)
                  .push(
                AppRouter.kBabyDataScreen,
                extra: reversedList[index],
              )
                  .then((value) {
                if (value == true) {
                  context.read<GetAllBabiesCubit>().getAllBabies();
                }
              });
            },
            gender: babyData.gender ?? "Unknown",
            name: babyData.name ?? "ali",
            babyId: babyData.id!,
            dateOfBirth: babyData.dateOfBirth.toString().split(' ')[0],
            weight: latestWeight?.toString() ?? "Not available",
            height: latestHeight?.toString() ?? "Not available",
          ),
        );
      },
    );
  }

  num? getLatestValue(dynamic data, {bool isWeight = true}) {
    if (data == null || data.isEmpty) return null;

    for (var item in data.reversed) {
      if (isWeight) {
        if (item.weight != null) {
          return item.weight;
        }
      } else {
        if (item.height != null) {
          return item.height;
        }
      }
    }

    return null;
  }
}

class NoBabyText extends StatelessWidget {
  const NoBabyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              'Add Your Little\n One Now!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeightHelper.semiBold,
                fontSize: 32.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
